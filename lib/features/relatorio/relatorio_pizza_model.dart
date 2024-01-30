// ignore_for_file: public_member_api_docs, sort_constructors_first
class RelatorioPizza {
  double? totalServico;
  double? totalProduto;

  RelatorioPizza({
    this.totalServico,
    this.totalProduto,
  });

  RelatorioPizza.fromJson(Map<String, dynamic> json) :
    totalServico = json["totalServico"] as double,
    totalProduto = json["totalProduto"] as double;

}
