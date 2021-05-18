import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}//Fin de clase myapp

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Main());
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin{
  TabController controller;
  void initState() {
    super.initState();
    controller = TabController(
      length: 5,
      vsync: this,
      initialIndex: 0,
    );
  }
  Widget card(String text) {
    return Card(
      color: Colors.grey[700],
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Center(child: Text(text)),
      ),
    );
  }
  Tab tab(String text, Icon icon) {
    return Tab(
      icon: icon,
      text: text,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBars por Robles"),
        centerTitle: true,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0.0,
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          card("Card de inicio"),
          card("Card para agregar foto"),
          card("Card de favoritos"),
          card("Card de perfil"),
          card("Card de opciones"),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        isScrollable: true  ,
        tabs: <Widget>[
          tab("Inicio", Icon(Icons.home)),
          tab("Foto", Icon(Icons.add_a_photo)),
          tab("Favoritos", Icon(Icons.bookmark_rounded)),
          tab("Perfil", Icon(Icons.account_circle)),
          tab("Opciones", Icon(Icons.settings_rounded)),
        ],
      ),
    );
  }
}