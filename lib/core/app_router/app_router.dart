import 'package:go_router/go_router.dart';
import 'package:photopulse/features/main/data/models/response/search_response_model.dart';
import 'package:photopulse/features/main/presentation/screens/details_screen.dart';
import 'package:photopulse/features/main/presentation/screens/main_screen.dart';

import 'navigate_services.dart';
import 'screen_routes.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: NavigatorService.navigatorKey,
    initialLocation: AppRouterNames.mainRoute,
    routes: [
      GoRoute(
        path: AppRouterNames.mainRoute,
        name: AppRouterNames.mainRoute,
        builder: (_, __) => const MainScreen(),
      ),
      GoRoute(
        path: AppRouterNames.detailsRoute,
        name: AppRouterNames.detailsRoute,
        builder: (_, state) => DetailsScreen(photo: state.extra as Photos),
      ),
    ],
  );
}