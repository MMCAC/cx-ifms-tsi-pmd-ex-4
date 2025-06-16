import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pdmex4/model/UF.dart';

const BASE_URL = "servicodados.ibge.gov.br";

Future<List<UF>> buscarTodasAsUFs() async {
  final uri = Uri.https(BASE_URL, "api/v1/localidades/estados");
  final response = await http.get(uri);
  List<UF> ufs = [];
  if (response.statusCode == 200) {
    final bytes = response.bodyBytes;
    final utf8Map = utf8.decode(bytes);
    final dynamic ufsMap = jsonDecode(utf8Map);

    ufs = ufsMap.map<UF>((json) {
      return UF.fromJson(json);
    }).toList();
  }
  return ufs;
}

Future<List<Municipio>> buscarCidadesMS() async {
  final uri = Uri.https(BASE_URL, "api/v1/localidades/estados/50/municipios");
  final response = await http.get(uri);
  List<Municipio> municipios = [];

  if (response.statusCode == 200) {
    final bytes = response.bodyBytes;
    final utf8Map = utf8.decode(bytes);
    final dynamic municipiosMap = jsonDecode(utf8Map);

    municipios = municipiosMap.map<Municipio>((json) {
      return Municipio.fromJson(json);
    }).toList();
  }
  return municipios;
}