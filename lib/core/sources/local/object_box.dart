import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../../objectbox.g.dart';

class ObjectBox {
  static late final Store store;

  ObjectBox._create(Store store);

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final dir = p.join(docsDir.path, 'flutter_assurance_db');
    if (!Store.isOpen(dir)) {
      store = await openStore(directory: dir);
    } else {
      store = Store.attach(getObjectBoxModel(), dir);
    }
    return ObjectBox._create(store);
  }
}
