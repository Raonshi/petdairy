import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:petdiary/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.go('/'),
            iconSize: 32.0,
            icon: const Icon(Icons.chevron_left_rounded),
          ),
          title: const Text('Add New Pet'),
        ),
        body: Column(
          children: [
            ListTile(
              onTap: () {
                SharedPreferences.getInstance().then((value) => value.remove(LocalStorageKey.petList));
              },
              title: Text('데이터 초기화'),
            ),
            ListTile(
              onTap: () {
                context.loaderOverlay.show();
                FirebaseAuth.instance.signOut().then((_) {
                  context.loaderOverlay.hide();
                  context.go('/auth');
                });
              },
              title: Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
