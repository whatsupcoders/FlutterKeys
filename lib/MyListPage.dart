import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyListPage extends StatefulWidget {
  MyListPage({Key key}) : super(key: key);

  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  List<String> articles = [
    'THE GREAT GATSBY',
    'BRAVE NEW WORLD',
    'THE SOUND AND THE FURY',
    'DARKNESS AT NOON',
    'SONS AND LOVERS'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
              ),
              onPressed: () {}),
        title: Text("Articles"),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Dismissible(
              key: Key(article),
              onDismissed: (direction) {
                setState(() {
                  articles.removeAt(index);
                });
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$article moved")));
              },
              background: Container(
                color: Colors.amber,
              ),
              child: Container(
                height: 100.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    '$article',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
          );
        },
      ),
    );
  }
}
