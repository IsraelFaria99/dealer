import 'package:dealer/dealer.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  RequestHandlerStatus status = RequestHandlerStatus.Initial;
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            status = RequestHandlerStatus.Loading;
          });
          name = await ExamplePageController.getName();
          setState(() {
            status = RequestHandlerStatus.Completed;
          });
        },
        child: Icon(Icons.search),
      ),
      body: Container(
        child: Center(
          child: RequestHandlerWidget(
              status: status,
              initialWidget: ()=> Text('Uhmmmm...'),
              successWidget: () {
                return Container(
                  child: Text('Well done $name'),
                );
              }),
        ),
      ),
    );
  }
}

class ExamplePageController {
  static Future<String> getName() async {
    String name = '';
    await Future.delayed(Duration(seconds: 2), () {
      name = 'Dealer!';
    });
    return name;
  }
}
