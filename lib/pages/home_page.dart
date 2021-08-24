import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:libcom_users/controllers/user_list_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = UserListController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuários"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              //onChanged: (value) => controller.usuarios.where((element) => controller.usuarios),
              decoration: InputDecoration(hintText: "Filtrar por nome"),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: controller.usuariosNotifier,
              builder: (_, usuarios, __) => ListView.builder(
                  itemCount: controller.usuarios.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimatedCard(
                      direction: AnimatedCardDirection.right,
                      child: ListTile(
                        onTap: () => Navigator.pushNamed(context, "/detail", arguments: controller.usuarios[index]),
                        leading: Stack(clipBehavior: Clip.none, children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.grey.shade400.withOpacity(0.5),
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
                        title: Text(
                          controller.usuarios[index].nome,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                            "${controller.usuarios[index].endereco.cidade}, ${controller.usuarios[index].endereco.estado}"),
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
