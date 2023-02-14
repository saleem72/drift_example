//

import 'package:flutter/material.dart';

class AppTopHeader extends StatelessWidget with PreferredSizeWidget {
  const AppTopHeader({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
