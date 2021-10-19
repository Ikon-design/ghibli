import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghibli/widget/video.dart';
import 'pages/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        const VideoPlayerScreen(),
        Container(
          decoration: const BoxDecoration(color: Colors.black54),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
                width: 250,
                image: AssetImage('lib/assets/images/logo_ghibli.png')),
            ElevatedButton(onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => List()))
            }, child: const Text("Decouvrir l'univers")),
          ],
        ),
      ]),
    );
  }
}
