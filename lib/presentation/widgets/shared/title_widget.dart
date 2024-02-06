import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 4.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
