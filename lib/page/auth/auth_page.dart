import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:petdiary/config.dart';
import 'package:petdiary/page/auth/auth_provider.dart';
import 'package:petdiary/style/theme.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: LoaderOverlay(
        child: Scaffold(
          backgroundColor: context.colors.secondary,
          body: Center(
            child: Consumer<AuthProvider>(
              builder: (context, provider, _) {
                if (provider.isSignIn) {
                  return const _AuthLoading();
                } else {
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
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthLoading extends StatefulWidget {
  const _AuthLoading();

  @override
  State<_AuthLoading> createState() => __AuthLoadingState();
}

class __AuthLoadingState extends State<_AuthLoading> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100)).then(
      (value) => context.go('/'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Offstage();
  }
}
