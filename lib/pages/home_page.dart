import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> users = List.generate(10, (index) => "Usuário $index");

    return Scaffold(
        appBar: AppBar(
          title: Text("Usuários"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Filtrar por nome"),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
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
                        users[index],
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text("Cidade, UF"),
                    );
                  }),
            )
          ],
        ));
  }
}
