import 'dart:convert';
import 'package:pdmex4/services/UFServices.dart';
import 'package:flutter/material.dart';
import 'package:pdmex4/model/UF.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Cidades do MS")),
        body: FutureBuilder(
          future:
              buscarCidadesMS(), // Chama a função que busca as cidades do MS
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro ao carregar as cidades'));
            } else if (snapshot.hasData) {
              List<Municipio>? municipios = snapshot.data;
              return ListView.builder(
                itemCount: municipios!.length,
                itemBuilder: (context, index) {
                  final municipio = municipios[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: Card(
                      color: Colors.lightBlue[50],
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: Text(
                            municipio.nome.substring(0, 1),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          municipio.nome,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                          ),
                        ),
                        subtitle: Text(
                          'ID: ${municipio.id}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        trailing: Icon(
                          Icons.location_city,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('Nenhuma cidade encontrada'));
            }
          },
        ),
      ),
    );
  }
}
