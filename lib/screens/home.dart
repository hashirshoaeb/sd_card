import 'package:flutter/material.dart';
import 'package:sd_card/model.dart/screen.dart';
import 'package:sd_card/screens/program.dart';
import 'package:sd_card/widgets/container.dart';
import 'package:sd_card/styles/style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('República de Angola'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Program(
                  data: program,
                );
              },
            ),
          );
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 13),
              Expanded(
                flex: 10,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/123.png'),
                ),
              ),
              SizedBox(height: 200),
              Expanded(
                flex: 12,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/Joao.png'),
                ),
              ),
            ],
          ),
          Center(
            child: MyContainer(
              onTap: () {},
              child: Text(
                'Programa Nacional de Aprendizagem Eletrônica',
                style: Styles.largeTitle(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
