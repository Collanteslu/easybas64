import 'dart:convert';

import 'package:flutter/material.dart';

class PageBase54 extends StatefulWidget {
  const PageBase54({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PageBase54> createState() => _PageBase54State();
}

class _PageBase54State extends State<PageBase54> {
  late TextEditingController _controllerDecodeBase64;

  @override
  void initState() {
    super.initState();
    _controllerDecodeBase64 = TextEditingController(text: '');
  }

  void _encodeBase64(String value) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(value);
    setState(() {
      _controllerDecodeBase64 = TextEditingController(text: encoded);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(100.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Entrada',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 8,
                      onChanged: (String value) {
                        _encodeBase64(value);
                      },
                    ),
                  )),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Resultado',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      readOnly: true,
                      controller: _controllerDecodeBase64,
                      maxLines: 8,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
