import 'package:flutter/material.dart';
import 'package:buscappme/screen/drawer/drawerp.dart';
import 'package:image_picker/image_picker.dart';

class PublicarBusquedaScreen extends StatefulWidget {
  const PublicarBusquedaScreen({super.key});

  @override
  State<PublicarBusquedaScreen> createState() => _PublicarBusquedaScreenState();
}

class _PublicarBusquedaScreenState extends State<PublicarBusquedaScreen> {
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 61, 168),
        centerTitle: true,
        title: const Text('Publicar Búsqueda'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('Seleccione una imagen'),
              IconButton(
                  onPressed: () async {
                    final XFile? image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    setState(() {
                      _selectedImage = image;
                    });
                  },
                  icon: const Icon(Icons.browse_gallery))
            ],
          )
        ],
      ),
    );
  }
}
