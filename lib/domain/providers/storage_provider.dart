import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

class StorageImageProvider extends ChangeNotifier {
  File? image;
  String? nameImage;

  //BD
  String urlbase = 'https://tfscdnfyqymsvuhirhdi.supabase.co/rest/v1/busquedas';
  String keydb =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmc2NkbmZ5cXltc3Z1aGlyaGRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE2MzI4NjEsImV4cCI6MTk4NzIwODg2MX0._Gwnv4hM69kBd_ai_dQ3TmpJ2Xl1rmNQvuoDpD24xIE';
  String autorization =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmc2NkbmZ5cXltc3Z1aGlyaGRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE2MzI4NjEsImV4cCI6MTk4NzIwODg2MX0._Gwnv4hM69kBd_ai_dQ3TmpJ2Xl1rmNQvuoDpD24xIE';

  //SUPABASE STORAGE
  final SupabaseClient client = SupabaseClient(
    'https://tfscdnfyqymsvuhirhdi.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmc2NkbmZ5cXltc3Z1aGlyaGRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE2MzI4NjEsImV4cCI6MTk4NzIwODg2MX0._Gwnv4hM69kBd_ai_dQ3TmpJ2Xl1rmNQvuoDpD24xIE',
  );

  //=======================================================
  //API

  Future<String> guardarDB(BuildContext context) async {
    final url = Uri.parse(urlbase);
    final String msg;

    Map<String, String> header = {
      'apikey': keydb,
      'Authorization': autorization,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };

    final body = jsonEncode({
      "nombre": "Mónica",
      "edad": "14",
      "ciudad": "Lima",
      "ultima_visto": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "comunicarse_con": "999999999",
      "fotos": nameImage
    });

    final response = await http.post(url, body: body, headers: header);

    if (response.statusCode != 201) {
      print(response.statusCode);
      msg = 'NO SE GUARDÓ CORRECTAMENTE';
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
            size: 100,
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('true');
                activeCleanImage();
              },
              child: const Text('Aceptar'),
            )
          ],
        ),
      );
    } else {
      print('MSG=> SE GUARDO CORRECTAMENTE');
      msg = 'SE GUARDO CORRECTAMENTE';
      subirImageStorage();
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Icon(
            Icons.check,
            color: Colors.amber,
            size: 100,
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('true');
              },
              child: const Text('Aceptar'),
            )
          ],
        ),
      );
    }
    return msg;
  }

  //nuevo
  //=======================================================

  void alertCustom(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Icon(
          Icons.notification_important,
          color: Colors.amber,
          size: 100,
        ),
        content: const Text(
          'Seguro de guardar?',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop('false'),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop('true'),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    ).then((value) => {
          if (value == 'true')
            {
              guardarDB(context),
            }
        });
  }

  //=======================================================

  //SUBIR LA IMAGE A STORAGE
  Future subirImageStorage() async {
    final file = File(image!.path);

    final ruta0 = '/data/user/0/com.example.buscappme/cache/$nameImage';
    final ruta1 = image!.path.replaceAll(
      'data/user/0/com.example.buscappme/cache',
      'IMG',
    );
    final ruta2 = image!.path.replaceAll(
      'data/user/0/com.example.buscappme/app_flutter',
      'IMG',
    );

    final newPath = (image!.path == ruta0) ? ruta1 : ruta2;

    final response = await client.storage.from('buscappme-storage').upload(newPath, file);
    activeCleanImage();

    print(response);

    notifyListeners();
  }

  //CAMARA
  Future activeCamaraImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    //El nombre del archivo
    nameImage = image.name;
    this.image = imageTemp;
    notifyListeners();
  }

  //GALERIA
  Future activeGalleryImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    nameImage = image.name;
    this.image = imageTemp;
    notifyListeners();
  }

  //LIMPIAR IMAGEN
  Future activeCleanImage() async {
    image = null;
    notifyListeners();
  }
}
