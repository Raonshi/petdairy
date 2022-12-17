import 'package:go_router/go_router.dart';
import 'package:petdiary/page/add_pet/add_pet_page.dart';
import 'package:petdiary/page/pet_detail/pet_detail_page.dart';
import 'package:petdiary/page/root/root_page.dart';
import 'package:petdiary/page/setting/setting_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RootPage(),
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
      path: '/setting',
      builder: (context, state) => const SettingPage(),
    )
  ],
);
