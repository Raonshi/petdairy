import 'package:go_router/go_router.dart';
import 'package:petdiary/config.dart';
import 'package:petdiary/pages/pet_detail/pet_detail_page.dart';
import 'package:petdiary/pages/root/root_page.dart';

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
          child: PetDetailPage(
            id: state.queryParams['id'] ?? '',
          ),
        );
      },
    )
  ],
);
