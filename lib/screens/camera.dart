import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pond'),
          actions: [
            IconButton(
              onPressed: () => debugPrint("whatev"),
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  alignment: Alignment.center,
                  height: 350.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/foto.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ))
            ]),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.settings_applications_rounded),
              label: 'Ajustes',
              onTap: () => debugPrint("whatev"),
            ),
            SpeedDialChild(
              child: const Icon(Icons.brush_rounded),
              label: 'Personalización',
              onTap: () => debugPrint("whatev"),
            ),
          ],
        ),
      ),
    );
  }
}
