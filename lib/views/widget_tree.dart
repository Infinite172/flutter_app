import 'package:flutter/material.dart';
import 'package:flutter_app/data/consants.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:flutter_app/views/pages/home_page.dart';
import 'package:flutter_app/views/pages/profile_page.dart';
import 'package:flutter_app/views/pages/settings_page.dart';
import 'package:flutter_app/views/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [
  HomePage(),
  ProfilePage(),
SettingsPage(
    title: "Settings",
  ),
];

class WidgetTree
 extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dragon Ball"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(onPressed:() async{
            isDarkModeNotifier.value = !isDarkModeNotifier.value;
            final SharedPreferences prefs = 
            await SharedPreferences.getInstance();
            await prefs.setBool(KConstants.themeModeKey, isDarkModeNotifier.value);
          },
           icon: ValueListenableBuilder(
             valueListenable: isDarkModeNotifier,
             builder: (context, isDarkMode, child) {
              return Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
              );
             }
           )
          ),
          IconButton(onPressed: () {
            Navigator.push(context, 
              MaterialPageRoute(
                builder: (context) {
              return SettingsPage(title: "Settings is here ");
            },
           ),
          );
          }, 
          icon: 
            Icon(Icons.settings),
          ),
          // IconButton(onPressed: () {
          //   Navigator.push(context, 
          //     MaterialPageRoute(
          //       builder: (context) {
          //     return LoginPage();
          //   },
          //  ),
          // );
          // }, 
          // icon: 
          //   Icon(Icons.login),
          // ),
        ],
      ),

      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return  pages.elementAt(selectedPage);
        },
      ),

      bottomNavigationBar: NavbarWidget()
      );
  }
}