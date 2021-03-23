class ApiUsuario {
  String id;
  String name;

  ApiUsuario(
      {this.id,
        this.name
      }
   );

  ApiUsuario.fromJson(Map<String, dynamic> json) {
    id = json['IDPessoa'];
    name = json['Nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDPessoa'] = this.id;
    data['Nome'] = this.name;
    return data;
  }
}
