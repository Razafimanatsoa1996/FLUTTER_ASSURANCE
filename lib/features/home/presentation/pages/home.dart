import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assurance/core/utils/widgets/drawer.dart';
import 'package:flutter_assurance/features/subscribe/presentation/manager/subscribe_bloc.dart';
import 'package:flutter_assurance/features/subscribe/presentation/manager/subscribe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 94, 32, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white,
            size: MediaQuery.of(context).size.height * 0.05),
        backgroundColor: const Color.fromRGBO(27, 94, 32, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Bold',
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.005,
                top: MediaQuery.of(context).size.height * 0.005),
            child: const Row(
              children: [
                Icon(
                  Icons.call,
                  size: 35.0,
                ),
                Icon(
                  Icons.mail,
                  size: 35.0,
                ),
              ],
            )
            /*  Image.asset(
                'assets/images/logo.jpg',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.03,
              ) */
            ,
          )
        ],
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: const DrawerMenu(),
      body: SafeArea(
        child: BlocListener<SubscribeBloc, SubscribeState>(
          listener: (context, state) {
            /* if (state is ErrorState) {
              SnackBar snackBar = SnackBar(
                content: Text(
                  'an_error_has_occurred'.tr(),
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } */
          },
          child: BlocBuilder<SubscribeBloc, SubscribeState>(
            builder: (context, state) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 4.0,

                    /*    margin:  EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.width * 0.02,
                    left: MediaQuery.of(context).size.width * 0.02,
                  ), */
                    /*   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)), */
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment(0, -0.9),
                          child: Text(
                            "Autorisations",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
