import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mathcourses/api_service.dart';

class Conexion {
  final ApiService apiService = ApiService('https://your-api-url.com/');

  Future<Database> abrir() async {
    String ruta = join(await getDatabasesPath(), 'bd_tareas.db');
    return openDatabase(ruta, version: 1, onCreate: _crearTabla);
  }

  Future<void> _crearTabla(Database db, int version) async {
    await db.execute(
        'CREATE TABLE sign_in (id INTEGER PRIMARY KEY, name TEXT, last_name TEXT, age TEXT, city TEXT, country TEXT, phone TEXT, email TEXT, password TEXT)');
    await db.execute(
        'CREATE TABLE contact_us (id INTEGER PRIMARY KEY, name TEXT, last_name TEXT, phone TEXT, email TEXT, message TEXT)');
  }

  Future<void> cerrar() async {
    final Database db = await abrir();
    db.close();
  }

  Future<void> insert(String tabla, Map<String, dynamic> data) async {
    await apiService.post('/$tabla', data);
  }

  Future<List<Map<String, dynamic>>> read(String tabla) async {
    final response = await apiService.get('/$tabla');
    return List<Map<String, dynamic>>.from(jsonDecode(response.body));
  }

  Future<void> update(String tabla, Map<String, dynamic> data) async {
    await apiService.put('/$tabla/${data['id']}', data);
  }

  Future<void> delete(String tabla, int id) async {
    await apiService.delete('/$tabla/$id');
  }

  Future<bool> login(String email, String password) async {
    final response = await apiService.post('/login', {'email': email, 'password': password});
    return jsonDecode(response.body)['success'];
  }

  Future<void> register(String name, String lastName, String age, String city, String country, String phone, String email, String password) async {
    final data = {
      'name': name,
      'last_name': lastName,
      'age': age,
      'city': city,
      'country': country,
      'phone': phone,
      'email': email,
      'password': password,
    };
    await apiService.post('/sign_in', data);
  }

  Future<void> contactUs(String name, String lastName, String phone, String email, String message) async {
    final data = {
      'name': name,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'message': message,
    };
    await apiService.post('/contact_us', data);
  }
}