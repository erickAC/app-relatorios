// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotaFiscal {
  int? idNotaFiscal;
  double? totalProduto;
  double? totalServico;
  double? valorTotalNota;

  NotaFiscal({
    required this.idNotaFiscal,
    required this.totalProduto,
    required this.totalServico,
    required this.valorTotalNota,
  });
 
  NotaFiscal.fromJson(Map<String, dynamic> json) :
    idNotaFiscal = json["idNotaFiscal"] as int?,
    totalProduto = json["totalProduto"] as double?,
    totalServico = json["totalServico"] as double?,
    valorTotalNota = json["valorTotalNota"] as double?;

}
