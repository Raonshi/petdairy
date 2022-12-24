import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:petdiary/config.dart';
import 'package:petdiary/style/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.colors.primary,
          leading: IconButton(
            onPressed: () => context.go('/'),
            iconSize: 32.0,
            icon: Icon(Icons.chevron_left_rounded, color: context.colors.onPrimary),
          ),
          title: Text(
            '설정',
            style: context.texts.titleLarge!.copyWith(color: context.colors.onPrimary),
          ),
        ),
        body: Column(
          children: [
            ListTile(
              onTap: () {
                SharedPreferences.getInstance().then((value) => value.remove(LocalStorageKey.petList));
              },
              title: const Text('데이터 초기화'),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                context.loaderOverlay.show();
                FirebaseAuth.instance.signOut().then((_) {
                  context.loaderOverlay.hide();
                  context.go('/auth');
                });
              },
              title: const Text('로그아웃'),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
