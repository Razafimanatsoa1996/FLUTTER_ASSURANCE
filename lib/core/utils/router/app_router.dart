import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assurance/features/home/presentation/pages/home.dart';
import 'package:flutter_assurance/features/subscribe/presentation/pages/Subscribe.dart';
import 'package:flutter_assurance/features/splashcreen/presentation/pages/splash_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  static const int transitionDuration = 200;

  static const Widget Function(
    BuildContext,
    Animation<double>,
    Animation<double>,
    Widget,
  ) transition = TransitionsBuilders.slideLeft;

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
        ),
        AutoRoute(
          initial: false,
          page: SubscribeRoute.page,
        ),
        AutoRoute(
          initial: false,
          page: HomeRoute.page,
        ),
        /*   SubscribeRoute(
          page: RegisterRoute.page,
          transitionsBuilder: transition,
          durationInMilliseconds: transitionDuration,
        ),  */
      ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    resolver.next();
  }
}
