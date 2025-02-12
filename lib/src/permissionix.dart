import 'package:flutter/material.dart';
import 'package:permissionix/src/permissionix_manager.dart';

/// A widget that conditionally displays or replaces its child 
/// based on permissions.
class Permissionix<T> extends StatelessWidget {
  /// Creates a [Permissionix] that checks the user's permissions
  /// before displaying the content.
  const Permissionix({
    required this.permission,
    required this.child,
    super.key,
    this.replacement,
  });

  /// The required permission to show the [child] widget.
  final T permission;

  /// The widget to display if the user has the required [permission].
  final Widget child;

  /// The widget to display if the user does not have the required [permission].
  ///
  /// If `null`, the section is hidden.
  final Widget? replacement;

  @override
  Widget build(BuildContext context) {
    final hasPermission = PermissionixManager<T>().hasPermission(permission);

    if (hasPermission) {
      return child;
    } else {
      return replacement ?? const SizedBox.shrink();
    }
  }
}
