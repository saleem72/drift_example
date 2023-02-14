//

import 'package:flutter/material.dart';

import '../helpers/failure.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.failure});
  final Failure failure;
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
