import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200,
        width: 200,
        child: const Center(
          child: Text("Hello Setting Page"),
        ),
      ),
    );
  }
}
