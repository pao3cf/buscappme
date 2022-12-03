import 'package:flutter/material.dart';

class MensajesScreen extends StatelessWidget {
  const MensajesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Mensajes'),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text('Mensaje 1'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Mensaje 1.1'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Mensaje 1.2'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Mensaje 1.3'),
            ),
          ),
          Card(
            child: ListTile(leading: FlutterLogo(), title: Text('Mensaje 2')),
          ),
          Card(
            child: ListTile(leading: FlutterLogo(), title: Text('Mensaje 2.1')),
          ),
          Card(
            child: ListTile(leading: FlutterLogo(), title: Text('Mensaje 2.2')),
          ),
          Card(
            child: ListTile(
              title: Text('Mensaje 3'),
              trailing: Icon(Icons.adb_rounded),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Mensaje 3.1'),
              trailing: Icon(Icons.adb_rounded),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Mensaje 3.2'),
              trailing: Icon(Icons.adb_rounded),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Mensaje 4'),
              leading: FlutterLogo(),
              trailing: Icon(Icons.adb_rounded),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Mensaje 5'),
              leading: FlutterLogo(
                size: 50,
              ),
              subtitle: Text('Prueba de description'),
            ),
          ),
        ],
      ),
    );
  }
}
