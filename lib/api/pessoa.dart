class ApiPessoa {
  int code;
  List<Result> result;

  ApiPessoa({this.code, this.result});

  ApiPessoa.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String iDPessoa;
  String nome;
  String tipoSanguineo;
  String cidade;
  Null iDUsuario;

  Result(
      {this.iDPessoa,
        this.nome,
        this.tipoSanguineo,
        this.cidade,
        this.iDUsuario});

  Result.fromJson(Map<String, dynamic> json) {
    iDPessoa = json['IDPessoa'];
    nome = json['Nome'];
    tipoSanguineo = json['TipoSanguineo'];
    cidade = json['Cidade'];
    iDUsuario = json['IDUsuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDPessoa'] = this.iDPessoa;
    data['Nome'] = this.nome;
    data['TipoSanguineo'] = this.tipoSanguineo;
    data['Cidade'] = this.cidade;
    data['IDUsuario'] = this.iDUsuario;
    return data;
  }
}