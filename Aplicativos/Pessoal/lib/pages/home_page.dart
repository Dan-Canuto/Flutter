import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:organizer/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool menu = false;
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  
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
        child: Container(
          color: AppColors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SideMenu(
                style: SideMenuStyle(
                  displayMode: !menu ? SideMenuDisplayMode.open : SideMenuDisplayMode.compact,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: menu ? Radius.circular(10):Radius.circular(30),
                      bottomRight:menu ? Radius.circular(10):Radius.circular(30),
                    ),

                  ),
                  openSideMenuWidth: mediaQuery.size.width * 0.4,
                  compactSideMenuWidth: mediaQuery.size.width * 0.20,
                  hoverColor: AppColors.c1,
                  selectedColor: AppColors.black,
                  selectedIconColor: AppColors.c3,
                  unselectedIconColor: Colors.black54,
                  backgroundColor: AppColors.c1,
                  selectedTitleTextStyle: TextStyle(color: Colors.white),
                  unselectedTitleTextStyle: TextStyle(color: Colors.black54),
                  iconSize: 20,
                  itemInnerSpacing: 8.0,
                  itemOuterPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                  
                  itemBorderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                  ),
                  showTooltip: true,
                  itemHeight: 50.0,
                  toggleColor: Colors.black54
                ),
                // Page controller to manage a PageView
                controller: sideMenu,
                // Will shows on top of all items, it can be a logo or a Title text
                title: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        elevation: 10,
                        
                        fixedSize: Size(20, 15),
                    ),
                    onPressed: () {
                      setState(() {
                        menu = !menu;
                      });
                    },
                    child: Icon(
                      menu ? Icons.menu_outlined : Icons.menu_open_outlined,
                      color: AppColors.c3,
                      size: 18,
                      ),
                  ),
                ),
                footer:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      elevation: 10,
                      
                      fixedSize: Size(20, 15),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Login');
                  },
                  child: Icon(
                    Icons.exit_to_app_rounded,
                    color: AppColors.c3,
                    size: 18,
                    ),
                ),
                // Notify when display mode changed
                onDisplayModeChanged: (mode) {
                  print(mode);
                },
                // List of SideMenuItem to show them on SideMenu
                items: [
                  SideMenuItem(
                    title: 'Dashboard',
                    onTap: (index, _) {
                      sideMenu.changePage(index);
                    },
                    icon: Icon(Icons.home),
                  ),
                  SideMenuItem(
                    title: 'Settings',
                    onTap: (index, _) {
                      sideMenu.changePage(index);
                    },
                    icon: Icon(Icons.settings,),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    Container(
                      child: Center(
                        child: Text('Dashboard'),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('Settings'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}