import 'package:go_router/go_router.dart';
import 'package:petdiary/pages/add_pet/add_pet_page.dart';
import 'package:petdiary/pages/pet_detail/pet_detail_page.dart';
import 'package:petdiary/pages/root/root_page.dart';
import 'package:petdiary/pages/setting/setting_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: RootPage());
      },
    ),
    GoRoute(
      path: '/detail',
      pageBuilder: (context, state) {
        return NoTransitionPage(
          child: PetDetailPage(id: state.queryParams['id'] ?? ''),
        );
      },
    ),
    GoRoute(
      path: '/add',
      pageBuilder: (context, state) => const NoTransitionPage(child: AddPetPage()),
    ),
    GoRoute(
      path: '/setting',
      pageBuilder: (context, state) => const NoTransitionPage(child: SettingPage()),
    )
  ],
);
