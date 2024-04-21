import 'package:objectbox/objectbox.dart';

abstract class LocalSource<T> {

  Future<void> insert(T obj);

  Future<void> insertAll(List<T> obj);

  Future<void> update(int id, T obj);

  Future<List<T>> fetchAll();

  Future<T> findById(int id);

  Future<List<T>> findByStep(bool Function(T) test);

  Future<void> delete(int id);

  Future<void> deleteAll(List<int> ids);

  Future<void> reset();
}

class LocalSourceImpl<T> extends LocalSource<T> {
  final Box<T> store;

  LocalSourceImpl(this.store);

  @override
  Future<void> delete(int id) async {
    store.remove(id);
  }

  @override
  Future<List<T>> fetchAll() async {
    return store.getAll();
  }

  @override
  Future<T> findById(int id) async {
    final temp = store.get(id);
    if (temp != null) {
      return temp;
    }
    throw Exception();
  }

  @override
  Future<List<T>> findByStep(bool Function(T) test) async {
    return store.getAll().where(test).toList();
  }

  @override
  Future<void> insert(T obj) async {
    store.put(obj);
  }

  @override
  Future<void> update(int id, T obj) async {
    store.put(obj);
  }

  @override
  Future<void> insertAll(List<T> obj) async {
    store.putMany(obj);
  }

  @override
  Future<void> deleteAll(List<int> ids) async {
    store.removeMany(ids);
  }

  @override
  Future<void> reset() async {
    store.removeAll();
  }
}
