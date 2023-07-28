import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Global/Global.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({super.key});

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return (Global.isIOS == false)
        ? Scaffold(
            body: Center(
              child: Text("No any calls yet..."),
            ),
          )
        : CupertinoPageScaffold(
            child: Center(
              child: Text("No any calls yet..."),
            ),
          );
  }
}
