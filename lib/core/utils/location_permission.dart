import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../locale/presentation/cubit/locale_cubit.dart';

/// Put this in MaterialApp.builder to cover the *entire* app.
/// It:
///  - blocks all interaction with a nondismissible ModalBarrier
///  - updates live via: serviceStatusStream + positionStream + periodic poll
class LocationHardBlock extends StatefulWidget {
  final Widget child;
  final Duration pollInterval;
  final bool requestPermissionOnStart;

  const LocationHardBlock({
    super.key,
    required this.child,
    this.pollInterval = const Duration(seconds: 2),
    this.requestPermissionOnStart = true,
  });

  @override
  State<LocationHardBlock> createState() => _LocationHardBlockState();
}

class _LocationHardBlockState extends State<LocationHardBlock> with WidgetsBindingObserver {
  StreamSubscription<ServiceStatus>? _serviceSub;
  StreamSubscription<Position>? _positionSub;
  Timer? _poll;

  bool _serviceEnabled = false;
  bool _permissionOk = false;
  bool _checking = true;
  bool _deniedForever = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  Future<void> _init() async {
    // Initial check + (optional) permission prompt
    await _refresh(requestIfNeeded: widget.requestPermissionOnStart);

    // 1) Service status stream (fast path on many devices)
    _serviceSub = Geolocator.getServiceStatusStream().listen((_) => _refresh());

    // 2) Position stream (emits/errs when things change)
    _positionSub = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.lowest,
        distanceFilter: 1000000, // effectively "no move" updates
      ),
    ).listen(
          (_) {},
      onError: (_) => _refresh(), // e.g., service disabled/permission revoked
      cancelOnError: false,
    );

    // 3) Small poll (safety net for OEM quirks)
    _poll = Timer.periodic(widget.pollInterval, (_) => _refresh());

    setState(() => _checking = false);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refresh(); // user may have changed settings
    }
  }

  Future<void> _refresh({bool requestIfNeeded = false}) async {
    final svc = await Geolocator.isLocationServiceEnabled();
    var perm = await Geolocator.checkPermission();

    // Request once (startup) if desired
    if (!_isPermOk(perm) && requestIfNeeded) {
      perm = await Geolocator.requestPermission();
    }

    if (!mounted) return;

    setState(() {
      _serviceEnabled = svc;
      _permissionOk = _isPermOk(perm);
      _deniedForever = (perm == LocationPermission.deniedForever);
    });
  }

  bool _isPermOk(LocationPermission p) =>
      p == LocationPermission.always || p == LocationPermission.whileInUse;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _serviceSub?.cancel();
    _positionSub?.cancel();
    _poll?.cancel();
    super.dispose();
  }

  bool get _ok => _serviceEnabled && _permissionOk;

  @override
  Widget build(BuildContext context) {
    // Always render child (your app), then place a hard-block overlay on top when needed
    return Stack(
      children: [
        widget.child,
        if (!_ok || _checking) ...[
          const ModalBarrier(dismissible: false, color: Colors.black54),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Card(

                margin: const EdgeInsets.all(24),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.location_on, size: 48),
                      const SizedBox(height: 12),
                      Text(
                        _checking
                            ? "context.read<LocaleCubit>().getLabelById(id: 1175)"
                            : !_serviceEnabled
                            ? "context.read<LocaleCubit>().getLabelById(id: 1176)"
                            : _deniedForever
                            ? "context.read<LocaleCubit>().getLabelById(id: 1177)"
                            : !_permissionOk
                            ? "context.read<LocaleCubit>().getLabelById(id: 1178)"
                            : "context.read<LocaleCubit>().getLabelById(id: 1179)",
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _checking
                            ? "context.read<LocaleCubit>().getLabelById(id: 1180)"
                            : "context.read<LocaleCubit>().getLabelById(id: 1181)",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      if (!_checking) ...[
                        if (!_serviceEnabled)
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () async {
                                // Opens OS Location settings. After returning, we re-check automatically.
                                await Geolocator.openLocationSettings();
                              },
                              child:  Text("context.read<LocaleCubit>().getLabelById(id: 1182)"),
                            ),
                          ),

                        if (!_permissionOk && !_deniedForever)
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () async {
                                await Geolocator.requestPermission();
                                await _refresh();
                              },
                              child:  Text("context.read<LocaleCubit>().getLabelById(id: 1183)"),
                            ),
                          ),

                        if (_deniedForever)
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () async {
                                await Geolocator.openAppSettings();
                              },
                              child:  Text("context.read<LocaleCubit>().getLabelById(id: 1184)"),
                            ),
                          ),

                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: _refresh,
                          child:  Text("context.read<LocaleCubit>().getLabelById(id: 1185)"),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
