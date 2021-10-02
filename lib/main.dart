import 'dart:math';

import 'package:flutter/material.dart';
import 'package:joken_po/components/gesture_detector_component.dart';
import 'package:joken_po/components/padding_component.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joken Po',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Joken Po App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AssetImage _appImage = const AssetImage('../assets/images/padrao.png');

  String _text = 'Choose an option below:';

  //Troca a imagem
  void _trocaImagem(String valueUser) {
    //
    List<String> opcoesDeEscolha = ['pedra', 'papel', 'tesoura'];
    //
    int valorAleatorio = Random().nextInt(3);

    String valueApp = opcoesDeEscolha[valorAleatorio];

    // ignore: avoid_print
    print('Valor do usuario: ' + valueUser);
    // ignore: avoid_print
    print('Valor do App: ' + valueApp);

    switch (valueApp) {
      case 'pedra':
        setState(() {
          _appImage = const AssetImage('../assets/images/pedra.png');
        });
        break;
      case 'papel':
        setState(() {
          _appImage = const AssetImage('../assets/images/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          _appImage = const AssetImage('../assets/images/tesoura.png');
        });
        break;
    }

    //Caso o usuario ganhe
    if ( //
        (valueUser == 'papel' && valueApp == 'pedra') ||
            //
            (valueUser == 'pedra' && valueApp == 'tesoura') ||
            //
            (valueUser == 'tesoura' && valueApp == 'papel')
        //
        ) {
      _text = 'Você ganhou! :)';
      //Caso o App ganhe
    } else if ( //
        (valueApp == 'pedra' && valueUser == 'tesoura') ||
            //
            (valueApp == 'tesoura' && valueUser == 'papel') ||
            //
            (valueApp == 'papel' && valueUser == 'pedra')
        //
        ) {
      _text = 'Você perdeu! :(';
    } else {
      _text = 'Você empatou!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PaddingComponent(texto: 'Escolha do App'),
            Image(
              image: _appImage,
              height: 150,
            ),
            PaddingComponent(texto: _text),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // O valor clicado será enviado para outro componente que ele
                // irá pegar e mostrar a imagem
                GestureDetectorComponent(
                    onTap: () => _trocaImagem('pedra'),
                    appImage: '../assets/images/pedra.png'),
                GestureDetectorComponent(
                    onTap: () => _trocaImagem('papel'),
                    appImage: '../assets/images/papel.png'),
                GestureDetectorComponent(
                    onTap: () => _trocaImagem('tesoura'),
                    appImage: '../assets/images/tesoura.png'),
              ],
            ),
          ],
        ));
  }
}
