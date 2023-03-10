import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_services.dart';
import 'package:newsapp/src/widgets/listas_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
        body: (headlines.length == 0)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListaNoticias(headlines));
  }

  @override
  bool get wantKeepAlive => true;
}
