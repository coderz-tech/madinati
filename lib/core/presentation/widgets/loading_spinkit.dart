import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinKit extends StatelessWidget {
  final double? size;

  const LoadingSpinKit({
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitDualRing(
      color: Theme.of(context).primaryColor,
      size: size ?? 50.0,
    );
  }
}
