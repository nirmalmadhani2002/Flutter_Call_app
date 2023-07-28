import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_call_app/views/Global/Global.dart';
import 'package:flutter_call_app/views/cupertino_theme/Cupertino_dark_theme.dart';
import 'package:flutter_call_app/views/cupertino_theme/Cupertino_light_theme.dart';
import 'package:flutter_call_app/views/screens/CallsAddPage.dart';
import 'package:flutter_call_app/views/screens/CallsPage.dart';
import 'package:flutter_call_app/views/screens/ChatsPage.dart';
import 'package:flutter_call_app/views/screens/SettingsPage.dart';
import 'package:provider/provider.dart';
import 'controllers/Providers/Theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late final TabController _tabController;
  int initialStep = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Global.isIOS == false)
        ? MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => ThemeProvider()),
            ],
            builder: (context, _) {
              return MaterialApp(
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                darkTheme: ThemeData.dark(
                  useMaterial3: true,
                ),
                themeMode:
                    (Provider.of<ThemeProvider>(context).ld1.isDark == false)
                        ? ThemeMode.light
                        : ThemeMode.dark,
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  appBar: AppBar(
                    centerTitle: false,
                    title: const Text("Platform Converter"),
                    bottom: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          icon: Icon(Icons.person_add_alt),
                        ),
                        Tab(
                          text: "CHATS",
                        ),
                        Tab(
                          text: "CALLS",
                        ),
                        Tab(
                          text: "SETTINGS",
                        ),
                      ],
                    ),
                    actions: [
                      Switch(
                          value: Global.isIOS,
                          onChanged: (val) {
                            setState(() {
                              Global.isIOS = val;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  body: TabBarView(
                    controller: _tabController,
                    children: const [
                      CallsAddPage(),
                      ChatsPage(),
                      CallsPage(),
                      SettingsPage(),
                    ],
                  ),
                ),
              );
            },
          )
        : MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => ThemeProvider()),
            ],
            builder: (context, _) {
              return CupertinoApp(
                theme: (Provider.of<ThemeProvider>(context).ld1.isDark == false)
                  ? cupertinoLight
                  : cupertinodark,
                debugShowCheckedModeBanner: false,
                home: CupertinoPageScaffold(
                  backgroundColor: (Provider.of<ThemeProvider>(context).ld1.isDark == false)
                  ? Colors.white
                  : Colors.black,
                  navigationBar: CupertinoNavigationBar(
                    backgroundColor:  (Provider.of<ThemeProvider>(context).ld1.isDark == false)
                        ? Colors.white
                        : Colors.black,
                    middle:  Text(
                      "Platform Convertor",
                      style: TextStyle(color: (Provider.of<ThemeProvider>(context).ld1.isDark == false)
                          ? Colors.black
                          : Colors.white,),
                    ),
                    trailing: CupertinoSwitch(
                      thumbColor: Colors.white,
                      trackColor: Colors.green,
                      value: Global.isIOS,
                      onChanged: (val) {
                        setState(() {
                          Global.isIOS = val;
                        });
                      },
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        IndexedStack(
                          index: initialStep,
                          children: const [
                            CallsAddPage(),
                            ChatsPage(),
                            CallsPage(),
                            SettingsPage(),
                          ],
                        ),
                        Container(
                          height: 60,
                          child: CupertinoTabBar(
                            currentIndex: initialStep,
                            onTap: (val) {
                              setState(() {
                                initialStep = val;
                              });
                            },
                            activeColor: CupertinoColors.activeBlue,
                            inactiveColor: Colors.grey,
                            items: const [
                              BottomNavigationBarItem(
                                icon: Icon(CupertinoIcons.person_add),
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(CupertinoIcons.chat_bubble_2),
                                label: "Chats",
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(CupertinoIcons.phone),
                                label: "Calls",
                              ),
                              BottomNavigationBarItem(
                                  icon: Icon(CupertinoIcons.settings_solid),
                                  label: "Settings"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
