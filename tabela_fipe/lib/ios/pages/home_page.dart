import 'package:flutter/cupertino.dart';
import 'package:tabela_fipe/ios/pages/home_tab.dart';
import 'package:tabela_fipe/ios/pages/reservas_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = [
    HomeTab(),
    ReservasTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color(0xffFAAD14),
        leading: Text(
          'LOGO',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: CupertinoColors.white,
          activeColor: const Color(0xffFAAD14),
          inactiveColor: const Color(0xffC4C4C4),
          border: Border.all(color: const Color(0xffC4C4C4)),
          height: 60.0,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                  width: 64.0,
                  height: 32.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xffE7E7E7),
                  ),
                  child: const Icon(CupertinoIcons.home, size: 24.0)),
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 64.0,
                  height: 32.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xffE7E7E7),
                  ),
                  child: const Icon(CupertinoIcons.square_list_fill, size: 24.0)),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) => _pages[index],
          );
        },
      ),
    );
  }
}
