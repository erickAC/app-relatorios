// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_relatorios/features/relatorio/produto_model.dart';

class NotaProduto {
  int idNotaProduto;
  int quantidadeProduto;
  double valorUnitario;
  Produto produto;

  NotaProduto({
    required this.idNotaProduto,
    required this.quantidadeProduto,
    required this.valorUnitario,
    required this.produto,
  });

  NotaProduto.fromJson(Map<String, dynamic> json ) : 
    idNotaProduto = json['idNotaProduto'] as int,
    quantidadeProduto = json['quantidadeProduto'] as int,
    valorUnitario = json['valorUnitario'] as double,
    produto = Produto.fromJson(json['produto']);

  
}
