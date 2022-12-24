import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:petdiary/page/auth/auth_provider.dart';
import 'package:petdiary/style/theme.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        backgroundColor: context.colors.secondary,
        body: Center(
          child: Consumer<AuthProvider>(
            builder: (context, provider, _) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {
                      context.loaderOverlay.show();
                      provider.signIn().then((value) {
                        if (value) {
                          context.loaderOverlay.hide();
                          context.go('/');
                        }
                      });
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
