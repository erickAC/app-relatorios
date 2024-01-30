import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatórios', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: Column(
                  children: [
                    Text(
                      'Ranking de vendas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Modular.to.pushNamed('/relatorio/ranking-vendas');
                      }, 
                      child: Text('Acessar')
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: Column(
                  children: [
                    Text(
                      'Gráfico de pizza',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Modular.to.pushNamed('/relatorio/pizza-report');
                      }, 
                      child: Text('Acessar')
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
