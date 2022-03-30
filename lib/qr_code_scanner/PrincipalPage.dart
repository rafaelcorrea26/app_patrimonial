import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Page.dart';
import 'QrCodeScannerPage.dart';

class QRViewPage extends StatefulWidget {
  const QRViewPage({Key? key}) : super(key: key);

  @override
  State<QRViewPage> createState() => _QRViewPageState();
}

class _QRViewPageState extends State<QRViewPage> {
  TextEditingController _codigoBarController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  inputTexto(context) {
    return TextField(
      controller: _codigoBarController,
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 15), // add padding to adjust icon
          child: Icon(
            Icons.document_scanner_outlined,
            color: Colors.blue,
          ),
        ),
        labelText: "Código de Barras",
        labelStyle: const TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.done_rounded),
          color: Colors.blue,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PageNext(),
            ),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
          width: 2,
        )),
      ),
      style: const TextStyle(fontSize: 20),
    );
  }

  Corpo() {
    return Container(
        alignment: Alignment.topCenter,
        child: Flex(direction: Axis.vertical, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          inputTexto(context),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(350, 50), primary: Colors.blue),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QrCodeScannerPage(),
                    )),
                child: Text('Leitor código barras')),
          ),
        ]));
  }

  BarraSuperior(context) {
    return AppBar(
      title: const Text('Leitor Código Barras'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          tooltip: 'Leito Limpo',
          onPressed: () {
            _codigoBarController.clear();
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Leitor Limpo, selecione uma opção para continuar.')));
          },
        ),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          tooltip: 'Go to the next page',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Next page'),
                  ),
                  body: const Center(
                    child: Text(
                      'This is the next page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraSuperior(context),
      body: Corpo(),
    );
  }
}
