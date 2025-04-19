import 'package:auto_route/auto_route.dart';
import 'package:fixitbhaii_admin/routes/app.routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom();

  @override
  List<CustomRoute> get routes => [
        CustomRoute(
          initial: true,
          // path: AppRouteName.splash,
          page: SplashRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          // path: AppRouteName.login,
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          // path: AppRouteName.dashboard,
          page: DashboardRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 300,
        ),
      ];
}
