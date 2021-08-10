class Telefone {
  Telefone({
    this.whatsapp = true,
    this.tipo,
    required this.numero,
    required this.idtelefone,
    this.operadora,
  });

  final bool whatsapp;
  final String? tipo;
  final String numero;
  final int idtelefone;
  final String? operadora;

  Telefone copyWith({
    bool? whatsapp,
    String? tipo,
    String? numero,
    int? idtelefone,
    String? operadora,
  }) =>
      Telefone(
        whatsapp: whatsapp ?? this.whatsapp,
        tipo: tipo ?? this.tipo,
        numero: numero ?? this.numero,
        idtelefone: idtelefone ?? this.idtelefone,
        operadora: operadora ?? this.operadora,
      );

  factory Telefone.fromJson(Map<String, dynamic> json) => Telefone(
        whatsapp: json["whatsapp"],
        tipo: json["tipo"],
        numero: json["numero"],
        idtelefone: json["idtelefone"],
        operadora: json["operadora"],
      );

  Map<String, dynamic> toJson() => {
        "whatsapp": whatsapp,
        "tipo": tipo,
        "numero": numero,
        "idtelefone": idtelefone,
        "operadora": operadora,
      };
}
