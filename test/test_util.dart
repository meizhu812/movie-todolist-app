import 'package:flutter/material.dart';

Widget wrapWidget(Widget widget) {
  return MaterialApp(
    home: Scaffold(
      body: widget,
    ),
  );
}
