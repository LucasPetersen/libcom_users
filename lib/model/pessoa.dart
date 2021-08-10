// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

import 'endereco.dart';
import 'telefone.dart';

Pessoa usuarioFromJson(String str) => Pessoa.fromJson(json.decode(str));

String usuarioToJson(Pessoa data) => json.encode(data.toJson());

class Pessoa {
  Pessoa({
    required this.idpessoa,
    required this.nome,
    this.indicadopor,
    this.lgpd,
    this.idade,
    required this.dataNascimento,
    required this.sexo,
    this.estadoCivil,
    this.filhos,
    this.profissao,
    this.localTrabalho,
    this.grauInstrucao,
    this.formacao,
    this.religiao,
    required this.voluntarioProjetoIgreja,
    this.filiacaoPartido = false,
    required this.endereco,
    required this.telefones,
  });

  final int idpessoa;
  final String nome;
  final Indicadopor? indicadopor;
  final bool? lgpd;
  final int? idade;
  final String dataNascimento;
  final String sexo;
  final String? estadoCivil;
  final bool? filhos;
  final String? profissao;
  final String? localTrabalho;
  final String? grauInstrucao;
  final String? formacao;
  final String? religiao;
  final bool voluntarioProjetoIgreja;
  final bool filiacaoPartido;
  final Endereco endereco;
  final List<Telefone> telefones;

  Pessoa copyWith({
    int? idpessoa,
    String? nome,
    Indicadopor? indicadopor,
    bool? lgpd,
    int? idade,
    String? dataNascimento,
    String? sexo,
    String? estadoCivil,
    bool? filhos,
    String? profissao,
    String? localTrabalho,
    String? grauInstrucao,
    String? formacao,
    String? religiao,
    bool? voluntarioProjetoIgreja,
    bool? filiacaoPartido,
    Endereco? endereco,
    List<Telefone>? telefones,
  }) =>
      Pessoa(
        idpessoa: idpessoa ?? this.idpessoa,
        nome: nome ?? this.nome,
        indicadopor: indicadopor ?? this.indicadopor,
        lgpd: lgpd ?? this.lgpd,
        idade: idade ?? this.idade,
        dataNascimento: dataNascimento ?? this.dataNascimento,
        sexo: sexo ?? this.sexo,
        estadoCivil: estadoCivil ?? this.estadoCivil,
        filhos: filhos ?? this.filhos,
        profissao: profissao ?? this.profissao,
        localTrabalho: localTrabalho ?? this.localTrabalho,
        grauInstrucao: grauInstrucao ?? this.grauInstrucao,
        formacao: formacao ?? this.formacao,
        religiao: religiao ?? this.religiao,
        voluntarioProjetoIgreja: voluntarioProjetoIgreja ?? this.voluntarioProjetoIgreja,
        filiacaoPartido: filiacaoPartido ?? this.filiacaoPartido,
        endereco: endereco ?? this.endereco,
        telefones: telefones ?? this.telefones,
      );

  factory Pessoa.fromJson(Map<String, dynamic> json) => Pessoa(
        idpessoa: json["idpessoa"],
        nome: json["nome"],
        indicadopor: Indicadopor.fromJson(json["indicadopor"]),
        lgpd: json["lgpd"],
        idade: json["idade"],
        dataNascimento: json["data_nascimento"],
        sexo: json["sexo"],
        estadoCivil: json["estado_civil"],
        filhos: json["filhos"],
        profissao: json["profissao"],
        localTrabalho: json["local_trabalho"],
        grauInstrucao: json["grau_instrucao"],
        formacao: json["formacao"],
        religiao: json["religiao"],
        voluntarioProjetoIgreja: json["voluntario_projeto_igreja"],
        filiacaoPartido: json["filiacao_partido"],
        endereco: Endereco.fromJson(json["endereco"]),
        telefones: List<Telefone>.from(json["telefones"].map((x) => Telefone.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idpessoa": idpessoa,
        "nome": nome,
        "indicadopor": indicadopor?.toJson(),
        "lgpd": lgpd,
        "idade": idade,
        "data_nascimento": dataNascimento,
        "sexo": sexo,
        "estado_civil": estadoCivil,
        "filhos": filhos,
        "profissao": profissao,
        "local_trabalho": localTrabalho,
        "grau_instrucao": grauInstrucao,
        "formacao": formacao,
        "religiao": religiao,
        "voluntario_projeto_igreja": voluntarioProjetoIgreja,
        "filiacao_partido": filiacaoPartido,
        "endereco": endereco.toJson(),
        "telefones": List<dynamic>.from(telefones.map((x) => x.toJson())),
      };
}

class Indicadopor {
  Indicadopor({
    required this.nome,
    required this.idpessoa,
  });

  final String nome;
  final int idpessoa;

  Indicadopor copyWith({
    String? nome,
    int? idpessoa,
  }) =>
      Indicadopor(
        nome: nome ?? this.nome,
        idpessoa: idpessoa ?? this.idpessoa,
      );

  factory Indicadopor.fromJson(Map<String, dynamic> json) => Indicadopor(
        nome: json["nome"],
        idpessoa: json["idpessoa"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "idpessoa": idpessoa,
      };
}
