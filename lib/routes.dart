import 'package:go_router/go_router.dart';
import 'package:petdiary/page/add_pet/add_pet_page.dart';
import 'package:petdiary/page/auth/auth_page.dart';
import 'package:petdiary/page/edit_pet/edit_pet_page.dart';
import 'package:petdiary/page/pet_detail/pet_detail_page.dart';
import 'package:petdiary/page/root/root_page.dart';
import 'package:petdiary/page/setting/setting_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/auth',
  redirect: (context, state) {
    return state.location;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RootPage(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) => PetDetailPage(id: state.queryParams['id'] ?? ''),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => const AddPetPage(),
    ),
    GoRoute(
      path: '/edit',
      builder: (context, state) => EditPetPage(id: state.queryParams['id'] ?? ''),
    ),
    GoRoute(
      path: '/setting',
      builder: (context, state) => const SettingPage(),
    )
  ],
);
