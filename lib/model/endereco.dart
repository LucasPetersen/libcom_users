class Endereco {
  Endereco({
    required this.cidade,
    required this.estado,
    this.complemento,
    required this.numero,
    required this.logradouro,
    required this.bairro,
    required this.cep,
  });

  final String cidade;
  final String estado;
  final String? complemento;
  final int numero;
  final String logradouro;
  final String bairro;
  final String cep;

  Endereco copyWith({
    String? cidade,
    String? estado,
    String? complemento,
    int? numero,
    String? logradouro,
    String? bairro,
    String? cep,
  }) =>
      Endereco(
        cidade: cidade ?? this.cidade,
        estado: estado ?? this.estado,
        complemento: complemento ?? this.complemento,
        numero: numero ?? this.numero,
        logradouro: logradouro ?? this.logradouro,
        bairro: bairro ?? this.bairro,
        cep: cep ?? this.cep,
      );

  factory Endereco.fromJson(Map<String, dynamic> json) => Endereco(
        cidade: json["cidade"],
        estado: json["estado"],
        complemento: json["complemento"],
        numero: json["numero"],
        logradouro: json["logradouro"],
        bairro: json["bairro"],
        cep: json["cep"],
      );

  Map<String, dynamic> toJson() => {
        "cidade": cidade,
        "estado": estado,
        "complemento": complemento,
        "numero": numero,
        "logradouro": logradouro,
        "bairro": bairro,
        "cep": cep,
      };
}
