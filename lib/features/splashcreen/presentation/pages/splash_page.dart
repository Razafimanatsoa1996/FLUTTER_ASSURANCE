import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assurance/core/utils/router/app_router.dart';
import 'package:flutter_assurance/features/splashcreen/presentation/manager/splash_event.dart';
import 'package:flutter_assurance/features/splashcreen/presentation/manager/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../manager/splash_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // context.read<SplashBloc>().add(LoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashBloc>(context).add(SetSplash());
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 94, 32, 1),
      body: BlocListener<SplashBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is Loaded) {
            context.router.push(const SubscribeRoute());
          }
        },
        child: BlocBuilder<SplashBloc, SplashScreenState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.white,
                  size: 50,
                ),
              ); /* const Logo(
              height: 620,
            ); */
            }
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.white,
                size: 50,
              ),
            );
          },
        ),
      ),
    );
  }
}
