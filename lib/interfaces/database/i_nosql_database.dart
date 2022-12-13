abstract class INoSQLDatabase {
  Future<void> create(Object? object);

  Future<List> find(String key, String where);
}
