import 'package:flutter/material.dart';
import 'package:sd_card/model.dart/screen.dart';
import 'package:sd_card/styles/style.dart';
import 'package:sd_card/widgets/background_image_stack.dart';
import 'package:sd_card/widgets/container.dart';

class Program extends StatefulWidget {
  final ScreenData data;

  Program({@required this.data});

  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.title),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back_ios),
      ),
      body: ImageStackBody(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: widget.data.actionList.map((e) {
          return MyContainer(
            width: 300,
            onTap: () => e.action(context),
            child: Text(
              e.name,
              style: Styles.label(),
            ),
          );
        }).toList(),
      )),
    );
  }
}
