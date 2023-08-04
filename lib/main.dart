import 'dart:developer';
import 'package:EduVerso/destination.dart';
import 'package:EduVerso/paint.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduVerso',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'EduVerso'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 138, 88),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.edit_outlined,
                        color: Colors.teal.shade100, size: 40),
                    const SizedBox(width: 3),
                    const Text('EduVerso',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ],
                )),
            const SizedBox(height: 10),
            // Carrusel de imágenes con texto
            Container(
                color: Colors.white,
                child: CarouselSlider(
                  options: CarouselOptions(autoPlay: true),
                  items: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal:
                              30.0), // Agrega espacio horizontal entre los elementos
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.asset('assets/brainidea.gif'),
                          ),
                          Column(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 70),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Sabias que...',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'El cerebro de un niño \nes muy receptivo a una\namplia variedad \nde estímulos sensoriales. ',
                                        style: TextStyle(
                                          fontSize: 15.5,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal:
                              38.0), // Agrega espacio horizontal entre los elementos
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.asset('assets/backpack.jpg'),
                          ),
                          Column(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 70),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Sin olvidar...',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Que también han aprendido \na interactuar mejor con sus \ncompañeros y a participar \nen juegos cooperativos.',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '¡Es mejor ver para aprender!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            // Lista horizontal de videos
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 22, 138, 88)
              ),
              height: 300, // Ajusta el tamaño según tus necesidades
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  VideoWidget(videoUrl: 'https://res.cloudinary.com/sistema-de-control-navarrete/video/upload/v1690687851/videouno_ifu7ke.mp4'),
                  VideoWidget(videoUrl: 'https://res.cloudinary.com/sistema-de-control-navarrete/video/upload/v1690687625/videodos_swrxm3.mp4'),
                  VideoWidget(videoUrl: 'https://res.cloudinary.com/sistema-de-control-navarrete/video/upload/v1690687589/videotres_jnk0pz.mp4'),
                  VideoWidget(videoUrl: 'https://res.cloudinary.com/sistema-de-control-navarrete/video/upload/v1690687783/videocuatro_cv5duv.mp4'),
                ],
              ),
            ), 
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 22, 138, 88),
                    Color.fromARGB(255, 25, 108, 146)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
            // Sección "Aprendiendo más"
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Aprendiendo más',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Algunos ejercicios que pueden ayudar',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 25),
            // Lista vertical de imágenes
            SizedBox(
              height: 480, // Ajusta el tamaño según tus necesidades
              child: Column(
                children: [
                  InkWell(
                  onTap: () {
                    // Navegar a la pantalla de destino al hacer clic
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DestinationScreen(
                          imagePath: 'assets/ejerciciouno.jpg', // Ruta de la imagen que deseas mostrar en la pantalla de destino
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Image.asset(
                      'assets/ejerciciouno.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  const SizedBox(height: 15),
                  InkWell(
                  onTap: () {
                    // Navegar a la pantalla de destino al hacer clic
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DestinationScreen(
                          imagePath: 'assets/ejerciciodos.png', // Ruta de la imagen que deseas mostrar en la pantalla de destino
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Image.asset(
                      'assets/ejerciciodos.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  const SizedBox(height: 15),
                 InkWell(
                  onTap: () {
                    // Navegar a la pantalla de destino al hacer clic
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DestinationScreen(
                          imagePath: 'assets/ejerciciotres.png', // Ruta de la imagen que deseas mostrar en la pantalla de destino
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Image.asset(
                      'assets/ejerciciotres.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // Sección "Aprendiendo más"
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Juega un poco',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Con una pizarra',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30)
                ]
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a PaintPage cuando se presione el botón flotante
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaintPage()),
          );
        },
        tooltip: 'Jugar',
        child: const Icon(Icons.videogame_asset),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class VideoWidget extends StatefulWidget {
  final String videoUrl;

  VideoWidget({required this.videoUrl});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
      aspectRatio: 16 / 9,
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }
}