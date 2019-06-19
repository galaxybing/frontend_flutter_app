import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(DemoApp());

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
        if (alreadySaved) {
          _saved.remove(pair);
        } else {
          _saved.add(pair);
        }
      });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
            )
            .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: const Text('已收藏列表'),
            ),
            body: new ListView(children: divided),
          );
        },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // final wordPairContent = WordPair.random();
    // return Text(wordPairContent.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text('自动生成无限数量“名字”'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

/*
 * RandomWords 有状态部件类，两个条件： StatefulWidget + State 类
 */
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState(); // + State 类
}


/*
 * Stateless widgets 是不可变的，所有的值都是 final
 */
class DemoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    /*
     * MaterialApp 需要渲染时或者在 Flutter Inspector 中切换平台时 build 都会运行
     *
     */
    //final wordPairContent =  WordPair.random();
    return MaterialApp(
      title: 'frontend_flutter_app',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      /*
      home: Scaffold(
        appBar: AppBar(// 导航栏 + 标题
          title: Text('前端开发混合app基础脚手架'),
        ),
        body: Center( // 主屏幕内容
          //child: Text(wordPairContent.asPascalCase),
          child: RandomWords()
        ),
      ),
      */
      home: RandomWords()
    );
  }

}

