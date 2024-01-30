import 'dart:convert';

import 'package:app_relatorios/environment.dart';
import 'package:app_relatorios/features/relatorio/nota_produto.dart';
import 'package:http/http.dart' as http;

class NotaProdutoService {

  Future<List<NotaProduto>?> listarMaisVendidos() async {
    try {
      var result = await http.get(Uri.parse('${Envinronment.url}/nota/produto/mais/vendidos'));
      if (result.statusCode == 200) {
        List<dynamic> list = jsonDecode(result.body);
        print(list);
        List<NotaProduto> response = list.map((e) => NotaProduto.fromJson(e)).toList();
        return response;
      }
    } catch(e) {
      print(e);
    }
    return [];
  }

}