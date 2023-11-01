import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// C R U D

late Database database;
void createDataBase() async {
  // Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  //print(databasesPath);
  String path = join(databasesPath, 'contact.db');
  //print(path);

  database = await openDatabase(path, version: 1, onCreate: (db, version) {
    db.execute(
        'CREATE TABLE Product (id INTEGER PRIMARY KEY, description TEXT, imageLink TEXT, price TEXT ,type TEXT )')
        .then((value) {
      print("table created");
    }).catchError((error) {
      print(error);
    });
  }, onOpen: (db) {
    getDatabase();
    print("table opened");
  });
}

insertDataBase({required int id,required String description,required String imageLink, required String price}) async {
  await database.transaction((txn) {
    return txn
        .rawInsert(
        'INSERT INTO Product(id,description,imageLink,type) VALUES("$id","$description", "$imageLink" ,"$price" ,"all")')
        .then((value) {
      print(" $value successfully inserted");
      getDatabase();
    }).catchError((error) {
      print(error);
    });
  });
}

updateDataBase({
  required String name,
  required String phoneNumber,
  required int id,
}) async {
  await database.rawUpdate(
      'UPDATE Contacts SET name = ?, phoneNumber = ? WHERE id = ?',
      [name, phoneNumber, id]).then((value) {
    print('$value update');
    getDatabase();
  }).catchError((error) {
    print(error);
  });
}

deleteData({required int id}) async {
  await database
      .rawDelete('DELETE FROM Product WHERE id = ?', [id]).then((value) {
    print("$value deleted");
    getDatabase();
  }).catchError((error) {
    print(error);
  });
}

addOrRemoveFavorite({required String type, required int id}) async {
  await database.rawUpdate(
      'UPDATE Product SET type = ?, WHERE id = ?', [type, id]).then((value) {
    print("$value  type update");
    getDatabase();
  }).catchError((error) {
    print(error);
  });
}

List<Map> contactsListDb = [];
List<Map> favoriteListDb = [];

getDatabase() async {
  contactsListDb.clear();
  favoriteListDb.clear();
  await database.rawQuery('SELECT * FROM Product').then((value) {
    for (Map<String, Object?> element in value) {
      contactsListDb.add(element);
      if (element['type'] == 'favorite') favoriteListDb.add(element);
    }
  });
}
