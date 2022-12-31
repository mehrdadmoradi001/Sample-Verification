import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Application(),
    );
  }
}

class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);

  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var inputWidth = MediaQuery
        .of(context)
        .size
        .width / 5;

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: inputWidth,
              child: TextField(
                focusNode: focus1,
                controller: textEditingController1,
                onChanged: (value) {
                  _getCheckValue(value);
                  value.length == 1 ? FocusScope.of(context).nextFocus() : value
                      .isEmpty ? FocusScope.of(context).requestFocus(focus1) : null;
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: inputWidth,
              child: TextField(
                focusNode: focus2,
                controller: textEditingController2,
                onChanged: (value) {
                  _getCheckValue(value);
                  value.length == 1 ? FocusScope.of(context).nextFocus() : value
                      .isEmpty ? FocusScope.of(context).previousFocus() : null;
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: inputWidth,
              child: TextField(
                focusNode: focus3,
                controller: textEditingController3,
                onChanged: (value) {
                  _getCheckValue(value);
                  value.length == 1 ? FocusScope.of(context).nextFocus() : value
                      .isEmpty ? FocusScope.of(context).previousFocus() : null;
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: inputWidth,
              child: TextField(
                focusNode: focus4,
                controller: textEditingController4,
                onChanged: (value) {
                  _getCheckValue(value);
                  value.length == 1 ? FocusScope.of(context).unfocus() : value
                      .isEmpty ? FocusScope.of(context).previousFocus() : null;
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getCheckValue(String value){
    if(value.length==4){
      var nums = value.split('');
      textEditingController1.text= nums[0];
      textEditingController2.text= nums[1];
      textEditingController3.text= nums[2];
      textEditingController4.text= nums[3];
    }
  }

}
