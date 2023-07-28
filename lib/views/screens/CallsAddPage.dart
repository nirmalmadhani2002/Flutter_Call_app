import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_call_app/views/Global/Global.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../controllers/Providers/Theme_provider.dart';

class CallsAddPage extends StatefulWidget {
  const CallsAddPage({super.key});

  @override
  State<CallsAddPage> createState() => _CallsAddPageState();
}

class _CallsAddPageState extends State<CallsAddPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController chatController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime date = DateTime(2016, 10, 26);

  @override
  Widget build(BuildContext context) {
    return (Global.isIOS == false)
        ? Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
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
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Full Name",
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Phone Number",
                          prefixIcon: Icon(
                            Icons.call,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: TextFormField(
                        controller: chatController,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Chat Conversation",
                          prefixIcon: Icon(
                            Icons.chat_outlined,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 20, top: 10),
                      child: TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pick Date',
                          prefixIcon: Icon(
                            Icons.date_range,
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat("dd-MM-yyyy").format(pickedDate);

                            setState(() {
                              dateController.text =
                                  formattedDate.toString();
                            });
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            Global.date = dateController.text;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 20,
                      ),
                      child: TextFormField(
                        controller: dateController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pick Time',
                          prefixIcon: Icon(
                            Icons.access_time_outlined,
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat("dd-MM-yyyy").format(pickedDate);

                            setState(() {
                              dateController.text =
                                  formattedDate.toString();
                            });
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            Global.date = dateController.text;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        nameController.clear();
                        phoneController.clear();
                        chatController.clear();
                        dateController.clear();
                        Global.date = null;
                      },
                      child: Text("SAVE"),
                    ),
                  ],
                ),
              ),
            ),
          )
        :  CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
            child: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  CircleAvatar(
                    radius: 70,
                    child: Icon(
                      CupertinoIcons.camera,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    child:  Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(CupertinoIcons.person),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: 320,
                          height: 40,
                          child: CupertinoTextField(
                            decoration: BoxDecoration(border: Border.all(color: (Provider.of<ThemeProvider>(context).ld1.isDark == false)
                                ? Colors.black
                                : Colors.white,),
                            borderRadius: BorderRadius.circular(5),
                            ),
                            controller: nameController,
                            placeholder: "Full Name",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    child:  Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(CupertinoIcons.phone),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: 320,
                          height: 40,
                          child: CupertinoTextField(
                            decoration: BoxDecoration(border: Border.all(color: (Provider.of<ThemeProvider>(context).ld1.isDark == false)
                                ? Colors.black
                                : Colors.white,),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            controller: phoneController,
                            placeholder: "Phone Number",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    child:  Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(CupertinoIcons.chat_bubble_text),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: 320,
                          height: 40,
                          child: CupertinoTextField(
                            decoration: BoxDecoration(border: Border.all(color: (Provider.of<ThemeProvider>(context).ld1.isDark == false)
                                ? Colors.black
                                : Colors.white,),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            controller: chatController,
                            placeholder: "Chat Conversation",
                            style: TextStyle(color:(Provider.of<ThemeProvider>(context).ld1.isDark == false)
                              ? Colors.black
                              : Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 60,
                    child: const Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(CupertinoIcons.calendar),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: 320,
                          height: 40,
                          child: CupertinoTextField(
                            // onTap: (){},
                            readOnly: true,
                            prefix: Text("Pick Date"),
                            decoration: BoxDecoration(),
                            keyboardType: TextInputType.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 25,
                    child:  Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(CupertinoIcons.clock),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: 320,
                          height: 40,
                          child: CupertinoTextField(
                            onTap: (){
                             setState(() {
                                 CupertinoDatePicker(
                                   initialDateTime: date,
                                   mode: CupertinoDatePickerMode.date,
                                   use24hFormat: true,
                                   showDayOfWeek: true,
                                   onDateTimeChanged: (DateTime newDate) {
                                     setState(() => date = newDate);
                                   },
                                 );
                             });
                            },
                            prefix: Text("Pick Time"),
                            decoration: BoxDecoration(),
                            keyboardType: TextInputType.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  CupertinoButton.filled(
                    onPressed: () {
                      setState(() {
                        nameController.clear();
                        phoneController.clear();
                        chatController.clear();
                        dateController.clear();
                      });
                    },
                    child: const Text('SAVE'),
                  ),
                ],
              ),
              ),
            ),
          );
  }
}
