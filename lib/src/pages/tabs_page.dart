import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:newsapp/src/pages/tab2_page.dart';
import 'package:newsapp/src/services/news_services.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline), label: 'Para Ti'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.public), label: 'Encabezado'),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: const [Tab1Screen(), Tab2Screen()],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;

    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
