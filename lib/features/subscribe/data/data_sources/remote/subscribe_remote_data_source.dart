import 'package:flutter_assurance/core/error/exceptions.dart';
import 'package:flutter_assurance/core/sources/remotes/remote_data_sources.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/suscribeData.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/user.dart';
import 'dart:convert';
import 'dart:io';

abstract class SubscribeRemoteDataSource {
  Future<SubscribeDataResponse> sendSuscribe(User user);
}

class SubscribeRemoteDataSourceImpl implements SubscribeRemoteDataSource {
  final RemoteDataSource source;
  
  SubscribeRemoteDataSourceImpl(this.source);

  @override
  Future<SubscribeDataResponse> sendSuscribe(User user) async {
    try {
      final res = await source.post('subscribe/subscribe/', body: {
        'email': user.email,
        'telephone': user.telephone,
        'marque': user.marque,
        'os': user.os,
        'dateSubscribe': user.dateSubscribe
      });

      if (res.statusCode == 200) {
        var result = jsonDecode(res.data);
        print('sedrick valiny ${result}');
        return result;
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }
}
