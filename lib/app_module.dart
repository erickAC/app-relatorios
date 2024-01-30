import 'package:app_relatorios/features/home/home_page.dart';
import 'package:app_relatorios/features/relatorio/pizza_report/pizza_report_page.dart';
import 'package:app_relatorios/features/relatorio/ranking_vendas/ranking_vendas_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends  Module{

  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (context) => HomePage(),);
    r.child('/relatorio/ranking-vendas', child: (context) => RankingVendasPage(), transition: TransitionType.leftToRight);
    r.child('/relatorio/pizza-report', child: (context) => PizzaReportPage());
  }

}