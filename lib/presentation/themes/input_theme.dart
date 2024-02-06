import 'package:flutter/material.dart';
import 'package:tr_app/presentation/themes/constants_theme.dart';

class SizedBoxHeight extends StatelessWidget {
  const SizedBoxHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: sizedBoxHeight);
  }
}

class SizedBoxWidth extends StatelessWidget {
  const SizedBoxWidth({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: sizedBoxWidth);
  }
}
