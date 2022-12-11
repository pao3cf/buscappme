import 'package:buscappme/screen/login/verify_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
// import 'package:buscappme/routes/routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

int numberText = 0;

final styleTextTitle = GoogleFonts.meriendaOne(
  fontSize: 25,
  fontWeight: FontWeight.w900,
  height: 1,
);

final styleTextSubTitle = GoogleFonts.lora(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: const Color.fromARGB(255, 46, 2, 243),
  height: 1,
);

final List<dynamic> texts = [
  {
    "title": 'Busca a personas',
    "subtitle": "Buscappme te ayuda a encontrar a esa persona que se perdió.",
    "img": 'assets/imgs/buscar.json',
  },
  {
    "title": 'Ayuda continua',
    "subtitle": "Busca, encuentra y ayuda a otras personas.",
    "img": 'assets/imgs/ayuda.json',
  },
  {
    "title": 'Devuelve la sonrisa',
    "subtitle": "Ayuda a que se reúnan con sus seres queridos.",
    "img": 'assets/imgs/celebrar.json',
  },
];

const primaryColor = Color.fromARGB(255, 57, 5, 199);

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifyAuthScreen(),
                      ));
                  // Navigator.pushReplacementNamed(context, MyRoutes.rLOGIN);
                },
                child: Text(
                  'OMITIR',
                  style: GoogleFonts.lora(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 36, 4, 214),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Texts slider
          SizedBox(
            height: sizeHeight * 0.7,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  numberText = value;
                });
              },
              itemCount: texts.length,
              itemBuilder: (context, index) {
                final texto = texts[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Lottie.asset(texto['img']),
                      const SizedBox(height: 20.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: Text(
                          texto['title'],
                          style: styleTextTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        texto['subtitle'],
                        style: styleTextSubTitle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          //Circle animation indicator
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  texts.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: numberText == index
                          ? primaryColor
                          : const Color.fromARGB(255, 246, 252, 193),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// class ImagePage extends StatelessWidget {
//   const ImagePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final sizeHeight = MediaQuery.of(context).size.height;

//     return Container(
//       height: sizeHeight * 0.60,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: NetworkImage('https://i.ibb.co/mT8F10K/fondito.jpg'),
//             fit: BoxFit.cover),
//       ),
//     );
//   }
// }
