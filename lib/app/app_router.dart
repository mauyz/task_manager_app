import 'package:auto_route/auto_route.dart';
import 'package:task_manager_app/app/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        initial: true,
        page: HomeRoute.page,
      )
    ];
  }
}
