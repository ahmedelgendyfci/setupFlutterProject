import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_app/Theme/AppTheme.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatefulWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  _ChangeThemeButtonWidgetState createState() =>
      _ChangeThemeButtonWidgetState();
}

class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      child: Switch.adaptive(
        value: themeProvider.darkTheme,
        onChanged: (value) async {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme();
        },
      ),
    );
  }
}
