import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_application_project/translations/locale_keys.dart';
import '../api/trivia_api.dart';
import '../widgets/AppBar_page.dart';

class TriviaScreen extends StatefulWidget {
  const TriviaScreen({Key? key}) : super(key: key);

  @override
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  late Future<String> _trivia;

  @override
  void initState() {
    super.initState();
    _trivia = fetchTrivia('6f1f97066dfd4414b1710984979febb2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarPage(text: LocaleKeys.trivia_title.tr()),
        preferredSize: Size.fromHeight(110),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _trivia,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Html(
                  data: snapshot.data!,
                  style: {
                    'body': Style(
                      fontSize: FontSize.xLarge,
                    ),
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
