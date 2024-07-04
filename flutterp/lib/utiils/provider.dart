import 'package:flutter/material.dart';
import 'package:flutterp/utiils/material.dart';
import 'package:provider/provider.dart';

import '../controller/http.dart';

class UtiilsProvider extends StatelessWidget {
  const UtiilsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HttpController()),
      ],
      child: const UtillsMaterial(),
    );

  }
}