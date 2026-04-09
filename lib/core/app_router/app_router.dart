import 'package:go_router/go_router.dart';
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
        builder: (_, _) {
          return MainScreen();
        },
      ),
    ],
  );
}
