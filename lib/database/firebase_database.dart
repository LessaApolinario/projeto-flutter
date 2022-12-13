import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contratado/interfaces/database/i_nosql_database.dart';

class FirebaseDatabase implements INoSQLDatabase {
  late CollectionReference _collection;

  FirebaseDatabase(CollectionReference collection) {
    _collection = collection;
  }

  @override
  Future<void> create(Object? object) async {
    await _collection.add(object);
  }

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> find(
      String key, String where) async {
    QuerySnapshot querySnapshot =
        await _collection.where(key, isEqualTo: where).get();

    final data = querySnapshot.docs.toList();

    return data;
  }
}
