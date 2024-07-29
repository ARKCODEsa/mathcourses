//importar paquetes sqlite
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//creamos la clase Conexion
class Conexion {
  //creamos el metodo que nos permitira abrir la base de datos
  Future<Database> abrir() async {
    //obtenemos la ruta de la base de datos
    String ruta = join(await getDatabasesPath(), 'bd_tareas.db');
    //abrimos la base de datos
    return openDatabase(ruta, version: 1, onCreate: _crearTabla);
  }

  //creamos el metodo que nos permitira crear la tabla login y products
  Future<void> _crearTabla(Database db, int version) async {
    //creamos la tabla login
    await db.execute(
        'CREATE TABLE sign_in (id INTEGER PRIMARY KEY, name TEXT, last_name TEXT, age TEXT, city TEXT, country TEXT, phone TEXT, email TEXT, password TEXT)');
    //creamos la tabla products
    await db.execute(
        'CREATE TABLE contact_us (id INTEGER PRIMARY KEY, name TEXT, last_name TEXT, phone TEXT, email TEXT. message TEXT)');
  }
  //creamos el metodo que nos permitira cerrar la base de datos
  Future<void> cerrar() async {
    final Database db = await abrir();
    db.close();
  }

  //-----------------------------------------------------------------------------------------------------------------------------------------------
  //creamos el metodo que nos permitira insertar datos en la tabla sign_in
  Future<void> insert(String tabla, Map<String, dynamic> data) async {
    final Database db = await abrir();
    await db.insert(tabla, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  //creamos el metodo que nos permitira leer los datos de la tabla sign_in
  Future<List<Map<String, dynamic>>> read(String tabla) async {
    final Database db = await abrir();
    return db.query(tabla);
  }
  //creamos el metodo que nos permitira actualizar los datos de la tabla sign_in
  Future<void> update(String tabla, Map<String, dynamic> data) async {
    final Database db = await abrir();
    await db.update(tabla, data,
        where: 'id = ?', whereArgs: [data['id']]);
  }
  //creamos el metodo que nos permitira eliminar los datos de la tabla sign_in
  Future<void> delete(String tabla, int id) async {
    final Database db = await abrir();
    await db.delete(tabla, where: 'id = ?', whereArgs: [id]);
  }
  //creamos metodo para validad si el usuario existe con el email y password de la tabla sign_in
  Future<bool> login(String email, String password) async {
    final Database db = await abrir();
    final List<Map<String, dynamic>> maps = await db.query('sign_in',
        where: 'email = ? and password = ?', whereArgs: [email, password]);
    if (maps.isNotEmpty) {
      return true;
    }
    return false;
  }
  //creamos el metodo que nos permitira registrar un nuevo usuario en la tabla sign_in
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
    await db.insert('sign_in', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //creamos el metodo que nos permitira insertar datos en la tabla contact_us y enviarlos a este email arqjhefferson@hotmail.com
  Future<void> contactUs(String name, String lastName, String phone, String email,String message) async {
    final Database db = await abrir();
    final Map<String, dynamic> data = {
      'name': name,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'message': message,
    };
    await db.insert('contact_us', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

}
