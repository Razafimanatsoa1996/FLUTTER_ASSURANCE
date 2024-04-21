import 'package:flutter/material.dart';

var raisedDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: const Color.fromRGBO(27, 94, 32, 1),
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        offset: Offset(5, 2),
        blurRadius: 3.0,
        spreadRadius: 0.0,
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(-5, -2),
        blurRadius: 3.0,
        spreadRadius: 0.0,
      ),
    ]);

Color facebookColor = const Color(0xFF416BC1);
Color googleColor = const Color(0xFFCF4333);
Color twitterColor = const Color(0xFF08A0E9);
