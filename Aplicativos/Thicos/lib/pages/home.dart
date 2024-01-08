import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thicos/main.dart';
import 'package:thicos/models/caminhoes.dart';
import 'package:thicos/models/manutencao.dart';
import 'package:thicos/widget/menuItems.dart';
import 'package:thicos/models/perfis.dart';
import 'package:thicos/pages_home/calendarioPage.dart';
import 'package:thicos/pages_home/caminhoesPage.dart';
import 'package:thicos/pages_home/dashboardPage.dart';
import 'package:thicos/pages_home/manutencaoPage.dart';
import 'package:thicos/pages_home/registroPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
    required this.perfil,
    required this.camItems,
    required this.manuItems,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final List<Manutencao> manuItems;
  final List<Caminhao> camItems;
  final Perfil perfil;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  Caminhao? selecionado;

  void initState() {
    // Connect SideMenuController and PageController together
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Material(
        color: Color.fromARGB(255, 245, 243, 251),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: mediaQuery.size.height * 0.15,
              width: mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(5, 33, 58, 1),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(36, 37, 51, 0.678),
                      blurRadius: 8,
                      offset: Offset(
                        0,
                        8,
                      )),
                ],
                border: Border.symmetric(
                  horizontal: BorderSide(
                    width: 4,
                    color: Color.fromRGBO(5, 33, 58, 0.6),
                  ),
                ),
              ),
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 60,
                      minHeight: 60,
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: mediaQuery.size.width * 0.04),
                      height: mediaQuery.size.width < 600
                          ? mediaQuery.size.width * 0.16
                          : mediaQuery.size.height * 0.12,
                      width: mediaQuery.size.width < 600
                          ? mediaQuery.size.width * 0.16
                          : mediaQuery.size.height * 0.12,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black87,
                              blurRadius: 5,
                              offset: Offset(
                                0,
                                3,
                              )),
                        ],
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.jpeg'),
                        ),
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: Colors.black87,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      //child: Image.asset('assets/images/logo.jpeg'),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Center(
                      child: Text(
                        'GERENCIAMENTO THICOS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: mediaQuery.size.width < 800 ? 30 : 40,
                          fontFamily: 'RobotoCondensed',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 2.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      customButton: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 60,
                          minHeight: 60,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: mediaQuery.size.width * 0.04),
                          height: mediaQuery.size.width < 600
                              ? mediaQuery.size.width * 0.16
                              : mediaQuery.size.height * 0.12,
                          width: mediaQuery.size.width < 800
                              ? mediaQuery.size.width * 0.16
                              : mediaQuery.size.height * 0.12,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black87,
                                  blurRadius: 5,
                                  offset: Offset(
                                    0,
                                    3,
                                  )),
                            ],
                            color: Color.fromRGBO(149, 122, 86, 1),
                            border: Border.all(color: Colors.black87, width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: mediaQuery.size.width < 800
                                      ? mediaQuery.size.width * 0.08
                                      : mediaQuery.size.height * 0.08,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  widget.perfil.nome,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'RobotoCondensed',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      items: [
                        ...MenuItems.firstItems.map(
                          (item) => DropdownMenuItem<MenuItem>(
                            value: item,
                            child: MenuItems.buildItem(item),
                          ),
                        ),
                        const DropdownMenuItem<Divider>(
                            enabled: false, child: Divider()),
                        ...MenuItems.secondItems.map(
                          (item) => DropdownMenuItem<MenuItem>(
                            value: item,
                            child: MenuItems.buildItem(item),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        MenuItems.onChanged(context, value! as MenuItem);
                      },
                      buttonStyleData: ButtonStyleData(
                        // This is necessary for the ink response to match our customButton radius.
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        width: 160,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color.fromRGBO(149, 122, 86, 1),
                          border: Border.all(
                            color: Colors.black87,
                            width: 1,
                          ),
                        ),
                        offset: Offset(
                            mediaQuery.size.width < 600
                                ? mediaQuery.size.height * 0.02
                                : mediaQuery.size.width * 0.016,
                            0),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        customHeights: [
                          ...List<double>.filled(MenuItems.firstItems.length, 48),
                          8,
                          ...List<double>.filled(
                              MenuItems.secondItems.length, 48),
                        ],
                        padding: const EdgeInsets.only(left: 16, right: 16),
                      ),
                    ),
                  ),
                  //child: Image.asset('assets/images/logo.jpeg'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                mediaQuery.size.width * 0.012,
                0,
                mediaQuery.size.width * 0.012,
                mediaQuery.size.height * 0.025,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: mediaQuery.size.height * 0.5,
                        width: mediaQuery.size.width * 0.16,
                        padding: EdgeInsets.symmetric(
                            vertical: mediaQuery.size.height * 0.01,
                            horizontal: mediaQuery.size.width * 0.01),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(5, 33, 58, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(
                            width: 4,
                            color: Color.fromRGBO(5, 33, 58, 0.6),
                          ),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(36, 37, 51, 0.678),
                                blurRadius: 8,
                                offset: Offset(
                                  4,
                                  8,
                                )),
                          ],
                        ),
                        child: SideMenu(
                          style: SideMenuStyle(
                            // showTooltip: false,
                            displayMode: SideMenuDisplayMode.auto,
                            hoverColor: Color.fromRGBO(149, 122, 86, 1),
                            selectedHoverColor: Color.fromRGBO(149, 122, 86, 1),
                            selectedColor: Color.fromRGBO(149, 122, 86, 1),
                            selectedTitleTextStyle:
                                const TextStyle(color: Colors.white),
                            selectedIconColor: Color.fromARGB(255, 245, 243, 251),
                            unselectedTitleTextStyle: TextStyle(
                              color: Color.fromARGB(255, 245, 243, 251),
                            ),
                            unselectedIconColor:
                                Color.fromARGB(255, 245, 243, 251),
                            itemInnerSpacing: 20,
                            compactSideMenuWidth: 200,
                          ),
                          controller: sideMenu,
                          title: Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 4, bottom: 12),
                              width: mediaQuery.size.width * 0.08,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(149, 122, 86, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: Text(
                                'MENU',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Roboto Condensed',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 245, 243, 251)),
                              ),
                            ),
                          ),
                          onDisplayModeChanged: (mode) {
                            print(mode);
                          },
                          items: [
                            SideMenuItem(
                              title: 'Dashboard',
                              onTap: (index, _) {
                                sideMenu.changePage(index);
                                setState(() {
                                  selecionado = null;
                                });
                              },
                              icon: Icon(Icons.align_vertical_bottom),
                            ),
                            SideMenuItem(
                              title: 'Caminhões',
                              onTap: (index, _) {
                                sideMenu.changePage(index);
                                setState(() {
                                  selecionado = null;
                                });
                              },
                              icon: Icon(Icons.fire_truck_outlined),
                            ),
                            SideMenuItem(
                              title: 'Calendário',
                              onTap: (index, _) {
                                sideMenu.changePage(index);
                                setState(() {
                                  selecionado = null;
                                });
                              },
                              icon: Icon(Icons.calendar_month),
                            ),
                            SideMenuItem(
                              title: 'Manutenção',
                              onTap: (index, _) {
                                sideMenu.changePage(index);
                              },
                              icon: Icon(Icons.settings),
                            ),
                            SideMenuItem(
                              title: 'Registro',
                              onTap: (index, _) {
                                sideMenu.changePage(index);
                                setState(() {
                                  selecionado = null;
                                });
                              },
                              icon: Icon(Icons.library_books),
                              // badgeContent: Text(
                              //   '3',
                              //   style: TextStyle(color: Colors.white),
                              // ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: mediaQuery.size.height * 0.02),
                        width: mediaQuery.size.width * 0.16,
                        height: mediaQuery.size.height * 0.28,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(5, 33, 58, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(36, 37, 51, 0.678),
                              blurRadius: 8,
                              offset: Offset(
                                4,
                                8,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      height: mediaQuery.size.height * 0.8,
                      padding: EdgeInsets.all(8),
                      margin:
                          EdgeInsets.only(left: mediaQuery.size.width * 0.012),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(149, 122, 86, 1),
                        border: Border.all(
                          width: 4,
                          color: Color.fromRGBO(149, 122, 86, 0.6),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(36, 37, 51, 0.678),
                            blurRadius: 8,
                            offset: Offset(
                              4,
                              8,
                            ),
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: PageView(
                        allowImplicitScrolling: false,
                        controller: pageController,
                        children: [
                          DashboardPage(),
                          CaminhoesPage(
                            camItems: widget.camItems,
                            encaminhamento: encaminhamento,
                          ),
                          CalendarioPage(),
                          ManutencaoPage(
                            selecionado: selecionado,
                            camItems: widget.camItems,
                            manuItems: widget.manuItems,
                          ),
                          RegistroPage(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> encaminhamento(Caminhao caminhao) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 20,
          title: const Text(
            'Encaminhamento',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(46, 49, 75, 1),
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    Text("Placa do caminhão selecionado"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      caminhao.placa,
                      style: TextStyle(
                          color: Color.fromRGBO(46, 49, 75, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Para onde deseja ir?',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            selecionado = caminhao;
                          });
                          sideMenu.changePage(3);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.settings,
                                color: Color.fromRGBO(46, 49, 75, 1),
                              ),
                              Text(
                                "Manutenção",
                                style: TextStyle(
                                  color: Color.fromRGBO(46, 49, 75, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.my_library_books_rounded,
                                color: Color.fromRGBO(46, 49, 75, 1),
                              ),
                              Text(
                                "Registro",
                                style: TextStyle(
                                  color: Color.fromRGBO(46, 49, 75, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.transform_outlined,
                                color: Color.fromRGBO(46, 49, 75, 1),
                              ),
                              Text(
                                "Viagens",
                                style: TextStyle(
                                  color: Color.fromRGBO(46, 49, 75, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.person_pin_outlined,
                                color: Color.fromRGBO(46, 49, 75, 1),
                              ),
                              Text(
                                "Motorista",
                                style: TextStyle(
                                  color: Color.fromRGBO(46, 49, 75, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(46, 49, 75, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.keyboard_return_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                "VOLTAR",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
