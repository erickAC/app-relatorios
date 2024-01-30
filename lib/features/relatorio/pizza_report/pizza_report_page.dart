import 'package:app_relatorios/features/relatorio/nota_fiscal_model.dart';
import 'package:app_relatorios/features/relatorio/nota_fiscal_service.dart';
import 'package:app_relatorios/features/relatorio/relatorio_pizza_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';


class PizzaReportPage extends StatefulWidget {
  const PizzaReportPage({super.key});

  @override
  State<PizzaReportPage> createState() => _PizzaReportPageState();
}

class _PizzaReportPageState extends State<PizzaReportPage> {
  final service = NotaFiscalService();
  late Future<RelatorioPizza?> relatorio; 

  @override
  void initState() {
    super.initState();
    relatorio = service.pizzaReport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatório em pizza', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        ),
      body: Center(
                child: FutureBuilder<RelatorioPizza?>(
                  future: relatorio,
                  builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var format = new NumberFormat ("#,##0.###", "pt_BR");
                    return SfCircularChart(
                      legend: Legend(
                        isVisible: true,
                        borderColor: Colors.black,
                        borderWidth: 2,
                        alignment: ChartAlignment.far
                      ),
                        series: <CircularSeries>[
                            // Render pie chart
                            PieSeries<ChartData, String>(
                                dataSource: [
                                  ChartData('Total de produto', snapshot.data?.totalProduto ,'R\$ ${format.format(snapshot.data?.totalProduto)}'),
                                  ChartData('Total de serviço', snapshot.data?.totalServico,'R\$ ${format.format(snapshot.data?.totalServico)}'),
                                ],
                                explode: true,
                                dataLabelMapper: (ChartData data, _) => data.value ,
                                dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                  showCumulativeValues: true,
                                  labelPosition: ChartDataLabelPosition.outside,
                                  useSeriesColor: true,
                                ),
                                pointColorMapper:(ChartData data, _) => data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                            )
                        ]
                    ); 
                  }
                  return const CircularProgressIndicator();
                  },
                )
            ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.value, [this.color]);
  final String? x;
  final double? y;
  final String? value;
  final Color? color;
}