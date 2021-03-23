import 'dart:convert';
import 'package:doe_sangue/api/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  List<ApiUsuario> _api;

  Future<List<ApiUsuario>> _getUser() async {
    try{
      List<ApiUsuario> listUser = List();
      final response = await http.get('http://10.0.2.2/flutter_api/pessoa.php');
      final map = jsonDecode(response.body);
      final itens = map['result'];
      print (itens);
      if (response.statusCode == 200){
        print ("sucesso ao carregar lista");
        itens.forEach((item) => listUser.add(ApiUsuario.fromJson(item)));
        return listUser;
      } else {
        print ("Erro ao carregar lista1");
        return null;
      }
    } catch (e) {
      print ("Erro ao carregar lista2");
      return null;
    }
  }

  @override
  void initState(){
    super.initState();
    _getUser().then((map) {
      _api = map;
      print (_api.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: (_api==null ? 0 : _api.length),
          //itemCount: _api.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                color: Colors.green,
                child: Text(_api[index].name),
              ),
            );
          },
        ),
      ),
    );
  }
}

