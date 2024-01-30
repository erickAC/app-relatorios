import 'dart:convert';

import 'package:app_relatorios/environment.dart';
import 'package:app_relatorios/features/relatorio/nota_fiscal_model.dart';
import 'package:app_relatorios/features/relatorio/relatorio_pizza_model.dart';
import 'package:http/http.dart' as http;

class NotaFiscalService {

  Future<RelatorioPizza?> pizzaReport() async {
    try {
      var response = await http.get(Uri.parse('${Envinronment.url}/nota/fiscal/relatorio/pizza'));
      if (response.statusCode == 200) {
        dynamic relatorio = jsonDecode(response.body);
        return RelatorioPizza(totalProduto: relatorio["totalProduto"], totalServico: relatorio["totalServico"]);
      }
    } catch(e) {
      print(e);
    }
    return null;
  }

}