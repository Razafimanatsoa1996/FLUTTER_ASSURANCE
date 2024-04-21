import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: height ?? MediaQuery.sizeOf(context).height * 0.25,
        decoration: const BoxDecoration(),
        child: Center(
          child: Image.asset(
            'assets/images/logo.jpg',
          ),
        ),
      ),
    );
  }
}
