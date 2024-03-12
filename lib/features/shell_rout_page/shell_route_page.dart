import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';

class ShellRoutePage extends HookConsumerWidget {
  final StatefulNavigationShell shell;

  const ShellRoutePage({
    super.key,
    required this.shell,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useThemeExtension<ColorsScheme>();

    return Scaffold(
      backgroundColor: colors.background,
      body: shell,
    );
  }
}
