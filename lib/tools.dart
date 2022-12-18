import 'package:flutter/material.dart';
import 'package:petdiary/style/theme.dart';

void showSnackbar(BuildContext context, Widget content) => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: context.colors.primary.withOpacity(0.7),
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        behavior: SnackBarBehavior.floating,
        content: content,
      ),
    );
