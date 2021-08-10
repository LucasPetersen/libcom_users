import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:libcom_pessoas/model/pessoa.dart';

class UserListController {
  final pessoaNotifier = ValueNotifier<List<Pessoa>>(<Pessoa>[]);

  List<Pessoa> get pessoas => pessoaNotifier.value;

  set pessoas(List<Pessoa> value) => pessoaNotifier.value = value;

  UserListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    try {
      var dio = Dio();
      final response = await dio.get('https://users-mock.free.mockoapp.net/users');
      List<dynamic> users = response.data.map((pessoa) => Pessoa.fromJson(pessoa)).toList();
      print("usuarios");
      pessoas = List.from(users);
    } catch (e) {
      print(e);
      pessoas = <Pessoa>[];
    }
  }
}
