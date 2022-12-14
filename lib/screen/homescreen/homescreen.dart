import 'package:buscappme/domain/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:buscappme/screen/drawer/drawerp.dart';
import 'package:buscappme/routes/routes.dart';
import 'package:buscappme/preferences/preferences.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 159, 253),
        centerTitle: true,
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Color.fromARGB(255, 54, 1, 63),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Switch.adaptive(
              value: Preferences.theme,
              activeColor: const Color.fromARGB(255, 255, 234, 193),
              activeTrackColor: Colors.white,
              onChanged: (value) {
                Preferences.theme = value;
                final themeP =
                    Provider.of<ThemeProvider>(context, listen: false);
                value ? themeP.setOscuro() : themeP.setClaro();
                setState(() {});
              }),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              color: const Color.fromARGB(255, 255, 188, 183),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Mi Edad:',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 222, 4),
                    ),
                  ),
                  Text(
                    '30',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 4, 100),
                    ),
                  ),
                ],
              )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              color: const Color.fromARGB(255, 231, 216, 172),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_960_720.jpg'),
                        ),
                      ),
                      const Text(
                        'Angelica Paola',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color.fromARGB(255, 252, 123, 3),
                        ),
                      ),
                      const Text(
                        'Carnero Francia',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color.fromARGB(255, 187, 93, 4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Nacionalidad: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 3, 3),
                                  ),
                                ),
                                Text(
                                  'Peruana',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 68, 1, 112),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Departamento: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 3, 3),
                                  ),
                                ),
                                Text(
                                  'Lima',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 68, 1, 112),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Distrito: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 3, 3),
                                  ),
                                ),
                                Text(
                                  'Pueblo Libre',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 68, 1, 112),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Ocupaci??n: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 3, 3),
                                  ),
                                ),
                                Text(
                                  'Social Manager',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 68, 1, 112),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, MyRoutes.rPUBLICARBUSQUEDA);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
