import 'package:flutter/material.dart';
import 'package:share/share.dart';
import './widgets/simple_round_icon_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Share with Flutter',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title = 'Share Text';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _textFieldSubjectController =
      TextEditingController();

  void _shareLink() {
    setState(() {
      Share.share(_textFieldController.text,
              subject: _textFieldSubjectController.text)
          .then((_) => {
                //_textFieldController.clear(),
                //_textFieldSubjectController.clear(),
              });
      //Share.share('check out my website https://example.com', subject: 'Look what I made!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
              child: TextField(
                controller: _textFieldSubjectController,
                decoration: const InputDecoration(hintText: 'Subject'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
              child: TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: 'Text to share'),
              ),
            ),
            SimpleRoundIconButton(
              backgroundColor: Color(0xFF00695C),
              buttonText: Text(
                "Share",
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.share),
              iconColor: Color(0xFF00695C),
              onPressed: _shareLink,
            ),
          ],
        ),
      ),
    );
  }
}
