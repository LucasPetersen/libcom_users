import 'package:flutter/material.dart';
import 'package:libcom_pessoas/model/pessoa.dart';

class AddEditPessoaPage extends StatefulWidget {
  final Pessoa? pessoa;
  final bool isEditing;

  AddEditPessoaPage({Key? key, this.pessoa, this.isEditing = false}) : super(key: key);

  @override
  _AddEditPessoaPageState createState() => _AddEditPessoaPageState();
}

class _AddEditPessoaPageState extends State<AddEditPessoaPage> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Editar Usuário" : "Adicionar Usuário"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextForm(
                label: "Nome",
                hint: "Digite seu nome ",
              ),
              CustomTextForm(
                label: "Cidade",
                hint: "Digite sua cidade ",
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: isEditing ? 'Salvar alterações' : 'Adicionar usuário',
        child: Icon(isEditing ? Icons.check : Icons.add),
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            _formKey.currentState?.save();
//            widget.onSave(_task, _note);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    required this.hint,
    required this.label,
  }) : super(key: key);

  final String hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? val) {
        return val!.trim().isEmpty ? 'Informe nome' : null;
      },
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
      ),
      onSaved: (value) {},
    );
  }
}
