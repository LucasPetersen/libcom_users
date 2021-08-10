import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:libcom_pessoas/controllers/user_list_controller.dart';

import '../model/pessoa.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = UserListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Usuários")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Filtrar por nome"),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Pessoa>>(
              valueListenable: controller.pessoaNotifier,
              builder: (_, pessoas, __) => ListView.builder(
                  itemCount: pessoas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () => Navigator.pushNamed(context, "/detail", arguments: pessoas[index]),
                        title: Text(
                          pessoas[index].nome,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text("Cidade, UF"),
                        leading: Stack(clipBehavior: Clip.none, children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade400.withOpacity(0.5),
                            radius: 32,
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 50,
                            ),
                          ),
                          Positioned(
                            right: -3,
                            bottom: -3,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                              height: 20,
                              width: 20,
                            ),
                          )
                        ]),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add_edit_pessoa", arguments: null);
        },
        child: Icon(Icons.add),
        tooltip: "Adicionar Usuário",
      ),
    );
  }
}
