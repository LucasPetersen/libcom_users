import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:libcom_users/model/usuario.dart';

class UserListController {
  final usuariosNotifier = ValueNotifier<List<Usuario>>([]);

  List<Usuario> get usuarios => usuariosNotifier.value;

  set usuarios(List<Usuario> usuarios) => usuariosNotifier.value = usuarios;

  UserListController() {
    getUsuarios();
  }

  Future<void> getUsuarios() async {
    try {
      var dio = Dio();
      final response = await dio.get("https://users-mock.free.mockoapp.net/users");
      usuarios = List.from(response.data.map((pessoa) => Usuario.fromJson(pessoa)).toList());
    } catch (e) {
      print(e);
      usuarios = [];
    }
  }
}
