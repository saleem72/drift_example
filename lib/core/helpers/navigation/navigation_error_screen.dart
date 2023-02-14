//

import 'package:flutter/material.dart';

class NavigationErrorScreen extends StatelessWidget {
  const NavigationErrorScreen({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Error"),
      ),
      body: Center(
        child: Text(error),
      ),
    );
  }
}
