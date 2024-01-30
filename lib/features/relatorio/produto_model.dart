// ignore_for_file: public_member_api_docs, sort_constructors_first
class Produto {
  int idProduto;
  String nomeProduto;

  Produto({
    required this.idProduto,
    required this.nomeProduto,
  });

  Produto.fromJson(Map<String, dynamic> json) :
    idProduto = json["idProduto"] as int,
    nomeProduto = json["nomeProduto"] as String;

  Map<String, dynamic> toJson() => {
    'idProduto': idProduto,
    'nomeProduto': nomeProduto
  };

}
