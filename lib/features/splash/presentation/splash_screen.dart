import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/locale/presentation/cubit/locale_cubit.dart';
import '../../../../../core/utils/gps_helper.dart';
import '../../../core/locale/domain/entities/local_model.dart';
import '../../onboarding/presentation/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _bootstrapped = false;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    // Kick off GPS (don’t await if it handles its own permissions/timeout)
    try {
      // If you need to await, make this `await GpsHelper.getLocation();`
      GpsHelper.getLocation();
    } catch (_) {
      // Swallow or log; we don't want the splash to hang on GPS errors
    }

    // Load saved locale (await if the cubit method returns a Future)
    try {
      await context.read<LocaleCubit>().loadSavedLocale();
    } catch (_) {
      // Handle silently; fallback to default locale
    }

    if (!mounted) return;

    setState(() => _bootstrapped = true);

    // Navigate after a microtask to ensure the first frame rendered
    Future.microtask(() => _goToNext());
  }

  void _goToNext() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const OnBoardingScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // If you actually need to react to locale state changes, you can wrap the body
    // with BlocBuilder<LocaleCubit, List<LocalModel>>. For this splash, a simple
    // placeholder is enough.
    return Scaffold(
      // body: Center(
      //   child: _bootstrapped
      //       ? const SizedBox() // very brief; we’ll navigate immediately
      //       : const SizedBox(
      //     height: 48,
      //     width: 48,
      //     child: CircularProgressIndicator(),
      //   ),
      // ),
    );
  }
}