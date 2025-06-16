class UF {
  int id;
  String nome;
  String sigla;

  UF({this.id = 0, this.nome = "", this.sigla = ""});

  UF.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        sigla = jsonMap['sigla'],
        nome = jsonMap['nome'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'sigla': sigla,
    };
  }
}

class Municipio {
  int id;
  String nome;

  Municipio({this.id = 0, this.nome = ""});

  Municipio.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
    };
  }
}
