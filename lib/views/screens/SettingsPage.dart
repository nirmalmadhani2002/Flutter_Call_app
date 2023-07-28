import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_call_app/views/Global/Global.dart';
import 'package:provider/provider.dart';
import '../../controllers/Providers/Theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return (Global.isIOS == false)
        ? Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      (Global.profile)
                          ? Center(
                              child: Column(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          height: 100,
                                          child: Row(
                                            children: [
                                              const Spacer(),
                                              const Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.grey,
                                                  size: 25,
                                                ),
                                              ),
                                              const Spacer(),
                                              const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Spacer(),
                                                  Text(
                                                    "Profile",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "Update Profile Data",
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                              Spacer(
                                                flex: 3,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Switch(
                                                  value: Global.profile,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      Global.profile = val;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 65,
                                          child: Icon(
                                            Icons.add_a_photo_outlined,
                                            size: 40,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Enter your name...",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Enter your Bio...",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Spacer(),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text("SAVE"),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text("CLEAR"),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Icon(
                                          Icons.light_mode_outlined,
                                          color: Colors.grey,
                                          size: 25,
                                        ),
                                        Spacer(),
                                        Container(
                                          alignment: Alignment.center,
                                          child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Spacer(),
                                              Text(
                                                "Theme",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text("Change Theme"),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                        Spacer(
                                          flex: 4,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Switch(
                                            value: Provider.of<ThemeProvider>(
                                                    context)
                                                .ld1
                                                .isDark,
                                            onChanged: (val) {
                                              Provider.of<ThemeProvider>(
                                                      context,
                                                      listen: false)
                                                  .changeTheme();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                            size: 25,
                                          ),
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Spacer(),
                                            Text(
                                              "Profile",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text("Update Profile Data"),
                                            Spacer(),
                                          ],
                                        ),
                                        Spacer(
                                          flex: 3,
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            child: Switch(
                                              value: Global.profile,
                                              onChanged: (val) {
                                                setState(() {
                                                  Global.profile = val;
                                                });
                                              },
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        const Icon(
                                          Icons.light_mode_outlined,
                                          color: Colors.grey,
                                          size: 25,
                                        ),
                                        const Spacer(),
                                        Container(
                                          alignment: Alignment.center,
                                          child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Spacer(),
                                              Text(
                                                "Theme",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text("Change Theme"),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 3,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Switch(
                                            value: Provider.of<ThemeProvider>(
                                                    context)
                                                .ld1
                                                .isDark,
                                            onChanged: (val) {
                                              Provider.of<ThemeProvider>(
                                                      context,
                                                      listen: false)
                                                  .changeTheme();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : CupertinoPageScaffold(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    (Global.profile)
                        ? Center(
                            child: Column(
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            const Spacer(),
                                            const Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Icon(
                                                CupertinoIcons.person,
                                                size: 25,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Spacer(),
                                                Text(
                                                  "Profile",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text("Update Profile Data"),
                                                Spacer(),
                                              ],
                                            ),
                                            Spacer(
                                              flex: 3,
                                            ),
                                            Container(
                                                alignment: Alignment.center,
                                                child: CupertinoSwitch(
                                                  value: Global.profile,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      Global.profile = val;
                                                    });
                                                  },
                                                )),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                      const CircleAvatar(
                                        radius: 70,
                                        child: Icon(
                                          CupertinoIcons.camera,
                                          size: 40,
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      const CupertinoButton(
                                        onPressed: null,
                                        child: Text('Enter your name...'),
                                      ),
                                      const CupertinoButton(
                                        onPressed: null,
                                        child: Text('Enter your bio...'),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Spacer(),
                                          CupertinoButton(
                                            onPressed: () {},
                                            child: Text("SAVE"),
                                          ),
                                          CupertinoButton(
                                            onPressed: () {},
                                            child: Text("CLEAR"),
                                          ),
                                          Spacer(),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      const Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Icon(
                                          Icons.light_mode_outlined,
                                          size: 25,
                                        ),
                                      ),
                                      Spacer(),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Spacer(),
                                          Text(
                                            "Theme",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text("Change Theme"),
                                          Spacer(),
                                        ],
                                      ),
                                      const Spacer(
                                        flex: 5,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: CupertinoSwitch(
                                          value: Provider.of<ThemeProvider>(
                                                  context)
                                              .ld1
                                              .isDark,
                                          onChanged: (val) {
                                            Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .changeTheme();
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : Center(
                            child: Column(
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            const Spacer(),
                                            const Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Icon(
                                                CupertinoIcons.person,
                                                size: 25,
                                              ),
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Spacer(),
                                                Text(
                                                  "Profile",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text("Update Profile Data"),
                                                Spacer(),
                                              ],
                                            ),
                                            Spacer(
                                              flex: 3,
                                            ),
                                            Container(
                                                alignment: Alignment.center,
                                                child: CupertinoSwitch(
                                                  value: Global.profile,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      Global.profile = val;
                                                    });
                                                  },
                                                )),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      const Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Icon(
                                          Icons.light_mode_outlined,
                                          size: 25,
                                        ),
                                      ),
                                      Spacer(),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Spacer(),
                                          Text(
                                            "Theme",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text("Change Theme"),
                                          Spacer(),
                                        ],
                                      ),
                                      const Spacer(
                                        flex: 5,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: CupertinoSwitch(
                                          value: Provider.of<ThemeProvider>(
                                                  context)
                                              .ld1
                                              .isDark,
                                          onChanged: (val) {
                                            Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .changeTheme();
                                          },
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                )
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
