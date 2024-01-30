import 'package:app_relatorios/features/relatorio/nota_fiscal_model.dart';
import 'package:app_relatorios/features/relatorio/nota_produto.dart';
import 'package:app_relatorios/features/relatorio/nota_produto_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class RankingVendasPage extends StatefulWidget {
  const RankingVendasPage({super.key});

  @override
  State<RankingVendasPage> createState() => _RankingVendasPageState();
}

class _RankingVendasPageState extends State<RankingVendasPage> {
  final service = NotaProdutoService();
  late Future<List<NotaProduto>?> list;

  @override
  void initState() {
    super.initState();
    list = service.listarMaisVendidos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking de vendas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        ),
      body: FutureBuilder<List<NotaProduto>?>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var format = new NumberFormat ("#,##0.###", "pt_BR");
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    tileColor: Colors.black12,
                    textColor: Colors.black,
                    leading: Text('${index + 1}'),
                    title: Text(
                      '${snapshot.data?[index].produto.nomeProduto}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    subtitle: Text('Qtde: ${snapshot.data?[index].quantidadeProduto.toString()} | Preço: R\$ ${format.format(snapshot.data?[index].valorUnitario)}'),
                    onTap: () {
                      alertDialog(context, snapshot.data![index]);
                    },
                  ),
                );
              },
            );
          }
          return Center(
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void alertDialog(BuildContext context, NotaProduto notaProduto) {
    var alert = AlertDialog(
      title: Text(notaProduto.produto.nomeProduto.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
      content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            Text('Código: ${notaProduto.idNotaProduto}'),
            Text('Quantidade: ${notaProduto.quantidadeProduto}'),
          ],
        ),
      actions: <Widget> [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
          ),
          onPressed: () {
            Modular.to.pop();
          },
          child: Text('Fechar', style: TextStyle(color: Colors.white),)
        )
      ],
    );
    showDialog(context: context, builder: (context) =>  alert,);
  }
}