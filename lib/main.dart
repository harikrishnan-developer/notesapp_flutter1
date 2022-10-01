import 'package:flutter/material.dart';

import 'Modules/notes/Views/AddNote_view.dart';
import 'Modules/notes/Views/Homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NOTES APP',
      home: HomeView(),
    );
  }
}
