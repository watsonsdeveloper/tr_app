import 'package:flutter/material.dart';
import 'package:tr_app/ui/themes/constants_theme.dart';

class SizedBoxHeight extends StatelessWidget {
  const SizedBoxHeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: sizedBoxHeight);
  }
}

class SizedBoxWidth extends StatelessWidget {
  const SizedBoxWidth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: sizedBoxWidth);
  }
}
