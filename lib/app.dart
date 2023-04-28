import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart' as yaru;
import 'package:houston/home_page.dart';

class Houston extends StatelessWidget {
  const Houston({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Houston',
      theme: yaru.yaruLight,
      darkTheme: yaru.yaruDark,
      home: const HomePage(),
    );
  }
}
