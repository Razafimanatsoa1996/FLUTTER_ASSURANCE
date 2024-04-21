import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assurance/core/injections/injections.dart';
import 'package:flutter_assurance/core/utils/router/app_router.dart';
import 'package:flutter_assurance/features/subscribe/presentation/manager/subscribe_bloc.dart';
import 'package:flutter_assurance/features/splashcreen/presentation/manager/splash_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SplashBloc>(),
        ),
        BlocProvider(lazy: false, create: (context) => getIt<SubscribeBloc>()
            /* ..add(
              LoginEvent(),
            ), */
            ),
      ],
      child: MaterialApp.router(
        title: 'Assurance',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // theme: themeLight,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
