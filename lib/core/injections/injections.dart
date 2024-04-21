import 'package:dio/dio.dart';
import 'package:flutter_assurance/core/repositories/base_repository.dart';
import 'package:flutter_assurance/core/repositories/base_repository_impl.dart';
import 'package:flutter_assurance/core/sources/remotes/remote_data_sources.dart';
import 'package:flutter_assurance/features/subscribe/data/data_sources/local/subscribe_local_data_source.dart';
import 'package:flutter_assurance/features/subscribe/data/data_sources/remote/subscribe_remote_data_source.dart';
import 'package:flutter_assurance/features/subscribe/data/repositories/subscribe_repository_impl.dart';
import 'package:flutter_assurance/features/subscribe/domain/repositories/subscribe_repository.dart';
import 'package:flutter_assurance/features/subscribe/domain/use_cases/saveSubscribe.dart';
import 'package:flutter_assurance/features/subscribe/domain/use_cases/sendSubscribe.dart';
import 'package:flutter_assurance/features/subscribe/presentation/manager/subscribe_bloc.dart';
import 'package:flutter_assurance/features/splashcreen/presentation/manager/splash_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'injections_bloc.dart';

part 'injections_data_source.dart';

part 'injections_repository.dart';

part 'injections_usecase.dart';

final getIt = GetIt.instance;

Future<void> inject() async {
  late final String baseUrl;
  baseUrl = dotenv.get('URL_DEV');

  await injectDataSource(baseUrl);
  injectRepository();
  injectUseCase();
  injectBloc();
}
