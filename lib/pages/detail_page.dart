import 'package:flutter/material.dart';

import '../model/pessoa.dart';
import '../widgets/detail_list.dart';
import 'add_edit_pessoa_page.dart';

class DetailPage extends StatelessWidget {
  final Pessoa pessoa;

  const DetailPage({Key? key, required this.pessoa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes')),
      body: Column(
        children: [
          UserInfo(pessoa: pessoa),
          const Divider(
            thickness: 3,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DetailList(name: 'Código:', value: pessoa.idpessoa.toString()),
                DetailList(name: 'Voluntário:', value: pessoa.nome),
                DetailList(name: 'Código:', value: pessoa.sexo),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddEditPessoaPage(isEditing: true, pessoa: pessoa)),
          );
        },
        child: Icon(Icons.edit),
        tooltip: 'Editar Usuário',
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.pessoa,
  }) : super(key: key);

  final Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(clipBehavior: Clip.none, children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade400.withOpacity(0.5),
                radius: 64,
                child: Icon(
                  Icons.person,
                  color: Colors.grey.shade500.withOpacity(0.8),
                  size: 112,
                ),
              ),
              Positioned(
                right: -3,
                bottom: -3,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                ),
              )
            ]),
            const SizedBox(height: 16),
            Text(
              pessoa.nome,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              "Cidade, UF",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
