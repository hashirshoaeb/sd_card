import 'package:flutter/material.dart';
import 'package:sd_card/screens/grua.dart';
import '../screens/program.dart';

class ScreenData {
  String title;
  List<Action> actionList;

  ScreenData({this.title, this.actionList});
}

class Action {
  String name;
  Function action;

  Action({this.name, this.action});
}

ScreenData program = ScreenData(
  title: 'Programa Nacional de Aprendizagem Eletrônica',
  actionList: [
    Action(
      name: 'ESCOLA PRIMARIA',
      action: (context) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Program(data: escola_primara);
            },
          ),
        );
      },
    ),
    Action(
      name: 'ENSINO MEDIO',
      action: (context) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Program(data: ensino_medio);
            },
          ),
        );
      },
    ),
    Action(
      name: 'COLEGIAL',
      action: (context) {},
    ),
    Action(
      name: 'FACULDADE',
      action: (context) {},
    ),
    Action(
      name: 'UNIVERSIDADE',
      action: (context) {},
    ),
  ],
);

ScreenData escola_primara = ScreenData(
  title: 'Programa Nacional de Aprendizagem Eletrônica',
  actionList: [
    Action(
      name: 'POR GRAU',
      action: (context) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Program(data: escola_primara_por_grau);
            },
          ),
        );
      },
    ),
    Action(
      name: 'POR ASSUNTO',
      action: (context) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Program(data: escola_primara_por_assunto);
            },
          ),
        );
      },
    ),
  ],
);

ScreenData escola_primara_por_grau = ScreenData(
  title: 'ESCOLA PRIMARIA Por Grau',
  actionList: [
    Action(
      name: 'GRAU 1',
      action: (context) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Grua();
            },
          ),
        );
      },
    ),
    Action(
      name: 'GRAU 2',
      action: (context) {},
    ),
    Action(
      name: 'GRAU 3',
      action: (context) {},
    ),
    Action(
      name: 'GRAU 4',
      action: (context) {},
    ),
    Action(
      name: 'GRAU 5',
      action: (context) {},
    ),
  ],
);

ScreenData escola_primara_por_assunto = ScreenData(
  title: 'ESCOLA PRIMARIA Por Assunto',
  actionList: [
    Action(
      name: 'Historia',
      action: (context) {},
    ),
    Action(
      name: 'Ciencia',
      action: (context) {},
    ),
    Action(
      name: 'Arte',
      action: (context) {},
    ),
    Action(
      name: 'Lingua',
      action: (context) {},
    ),
    Action(
      name: 'Educacao Fisica',
      action: (context) {},
    ),
  ],
);

ScreenData ensino_medio = ScreenData(
  title: 'EENSINO MEDIO',
  actionList: [
    Action(
      name: 'POR GRAU',
      action: (context) {},
    ),
    Action(
      name: 'POR ASSUNTO',
      action: (context) {},
    ),
  ],
);
