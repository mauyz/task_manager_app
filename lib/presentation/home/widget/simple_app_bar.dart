import 'package:flutter/material.dart';

/// A custom app bar that provides a simple configuration for the [AppBar].
class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  const SimpleAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 5,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      shadowColor: Theme.of(context).colorScheme.inversePrimary,
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
