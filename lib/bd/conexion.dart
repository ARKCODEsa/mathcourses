import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Conexion {
  Future<Database> abrir() async {
    String ruta = join(await getDatabasesPath(), 'bd_tareas.db');
    return openDatabase(ruta, version: 1, onCreate: _crearTabla);
  }

  Future<void> _crearTabla(Database db, int version) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS sign_in (id INTEGER PRIMARY KEY, name TEXT, last_name TEXT, age TEXT, city TEXT, country TEXT, phone TEXT, email TEXT, password TEXT)');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS contact_us (id INTEGER PRIMARY KEY, name TEXT, last_name TEXT, phone TEXT, email TEXT, message TEXT)');
  }

  Future<void> cerrar() async {
    final Database db = await abrir();
    db.close();
  }

  Future<void> insert(String tabla, Map<String, dynamic> data) async {
    final Database db = await abrir();
    await db.insert(tabla, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> read(String tabla) async {
    final Database db = await abrir();
    return db.query(tabla);
  }

  Future<void> update(String tabla, Map<String, dynamic> data) async {
    final Database db = await abrir();
    await db.update(tabla, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  Future<void> delete(String tabla, int id) async {
    final Database db = await abrir();
    await db.delete(tabla, where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> login(String email, String password) async {
    final Database db = await abrir();
    final List<Map<String, dynamic>> maps = await db.query('sign_in',
        where: 'email = ? and password = ?', whereArgs: [email, password]);
    return maps.isNotEmpty;
  }

  Future<void> register(String name, String lastName, String age, String city, String country, String phone, String email, String password) async {
    final Database db = await abrir();
    final Map<String, dynamic> data = {
      'name': name,
      'last_name': lastName,
      'age': age,
      'city': city,
      'country': country,
      'phone': phone,
      'email': email,
      'password': password,
    };
    await db.insert('sign_in', data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> contactUs(String name, String lastName, String phone, String email, String message) async {
    final Database db = await abrir();
    final Map<String, dynamic> data = {
      'name': name,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'message': message,
    };
    await db.insert('contact_us', data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}