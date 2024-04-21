import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'package:flutter_assurance/core/injections/injections.dart';
import 'package:flutter_assurance/core/sources/local/object_box.dart';
import 'package:flutter_assurance/core/utils/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//first we call a function future

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await EasyLocalization.ensureInitialized();
  await dotenv.load(
    fileName: '.env',
  );
  final AppRouter appRouter = AppRouter();
  await ObjectBox.create();
  await inject();
  if (Platform.isAndroid) {
    HttpOverrides.global = MyHttpOverrides();
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('fr', 'FR'),
      ],
      path: 'assets/translations',
      child: App(
        appRouter: appRouter,
      ),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
