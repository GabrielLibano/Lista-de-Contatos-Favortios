import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int countFavoritos = 0;
  List<Contato> contatos = [
    Contato('gabriel@hotmail.com', 'Gabriel Corinthians', false),
    Contato('isabella@hotmail.com', 'Isabella Corinthians', false),
    Contato('analucia@hotmail.com', 'Ana Corinthians', false),
    Contato('wilson@hotmail.com', 'Wilson Palmeiras', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de Favoritos $countFavoritos'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: IconButton(
              icon: Icon(
                  contatos[index].favorito
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red),
              onPressed: () {
                setState(() {
                  contatos[index].favorito = !contatos[index].favorito;
                  if (contatos[index].favorito)
                    countFavoritos++;
                  else
                    countFavoritos--;
                  print(contatos[index].favorito);
                });
              },
            ),
            leading: CircleAvatar(
              child: Image.network('https://i.pravatar.cc/150?img=$index'),
              radius: 30,
            ),
            title: Text(contatos[index].nome),
            subtitle: Text(contatos[index].email),
          );
        },
      ),
    );
  }
}

class Contato {
  final String nome;
  final String email;
  bool favorito;

  Contato(this.nome, this.email, this.favorito);
}
