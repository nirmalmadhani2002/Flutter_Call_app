import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_call_app/views/Global/Global.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return (Global.isIOS == false)
        ? Scaffold(
            body: Center(
            child: Text("No any chats yet..."),
          ),)
        : CupertinoPageScaffold(
            child: Center(child: Text("No any chats yet...")),
          );
  }
}
