import 'package:flutter_assurance/core/constants/shared_preferences_key.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/suscribeData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class SubscribeLocalDataSource {
  Future<void> save(SubscribeDataResponse data);
}

class SubscribeLocalDataSourceImpl extends SubscribeLocalDataSource {
  final SharedPreferences preferences;

  SubscribeLocalDataSourceImpl(this.preferences);

  @override
  Future<void> save(SubscribeDataResponse data) async {
    final subscribeData = jsonEncode(data.toJson());
    await preferences.setString(
      SharedPreferencesKey.subscribeData,
      subscribeData,
    );
  }
}
