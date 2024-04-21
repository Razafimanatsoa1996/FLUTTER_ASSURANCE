import 'package:flutter_assurance/core/models/user_models.dart';
import 'local_source.dart';

abstract class LocalDataSource {
  Future<List<UserModel>> fetch(String step);

  Future<void> insertAll(List<UserModel> spaces);
}

class BaseLocalDataSource extends LocalDataSource {
  BaseLocalDataSource(this.source);

  final LocalSource<UserModel> source;

  @override
  Future<void> insertAll(List<UserModel> spaces) async {
    List<UserModel> res = await source.fetchAll();
    res = res.where((element) => element.userId == spaces.first.userId).toList();
    source.deleteAll(res.map((e) => e.id ?? 0).toList());
    source.insertAll(spaces);
  }

  @override
  Future<List<UserModel>> fetch(String id) async {
    return (await source.fetchAll())
        .where((element) => element.userId == id)
        .toList();
  }
}
