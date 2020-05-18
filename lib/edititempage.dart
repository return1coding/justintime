import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:justintime/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'dart:convert';

TextEditingController classNameController;
TextEditingController locationController;
TextEditingController timeController;
TextEditingController dayController;

class itemEditPage extends StatefulWidget {
  ListItem thisListItemObj;
  itemEditPage(this.thisListItemObj);

  @override
  _itemEditPageState createState() => _itemEditPageState(thisListItemObj);
}

const PickerData2 = '''
[
    [
        "MONDAY",
        "TUESDAY",
        "WEDNESDAY",
        "THURSDAY",
        "FRIDAY"
    ]
]
    ''';

TextStyle kInputPageFontStyle =
    TextStyle(color: Color(0xFF35C900), fontSize: 15, fontFamily: 'Code8x8');

class _itemEditPageState extends State<itemEditPage> {
  String pickedTime;
  String selectedColor;
  String selectedDay;
  showPickerArray(BuildContext context) {
    new Picker(
        magnification: 1.2,
        textStyle: kInputPageFontStyle.copyWith(),
        headercolor: kInputPageFontStyle.color,
        confirmTextStyle:
            kInputPageFontStyle.copyWith(fontSize: 10, color: Colors.black),
        cancelTextStyle:
            kInputPageFontStyle.copyWith(fontSize: 10, color: Colors.black),

        // backgroundColor: kInputPageFontStyle.color,
        adapter: PickerDataAdapter<String>(
            pickerdata: new JsonDecoder().convert(PickerData2), isArray: true),
        hideHeader: true,
        title: new Text(
          "Please Select",
          style:
              kInputPageFontStyle.copyWith(color: Colors.black, fontSize: 12),
        ),
        onConfirm: (Picker picker, List value) {
          selectedDay = picker.getSelectedValues()[0].toString();
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  ListItem thisListItemObj;
  _itemEditPageState(this.thisListItemObj);

  @override
  void initState() {
    super.initState();
    classNameController = TextEditingController(text: thisListItemObj.itemName);
    locationController =
        TextEditingController(text: thisListItemObj.itemLocation);
    dayController = TextEditingController(text: thisListItemObj.itemDay);
    timeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF002E02),
          elevation: 0,
          title: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "JUST IN timE",
                  style: TextStyle(
                    fontFamily: 'Code8x8',
                    color: Color(0xFF35C900),
                  ),
                ),
                FadeAnimatedTextKit(
                  duration: Duration(milliseconds: 500),
                  isRepeatingAnimation: true,
                  text: ["__"],
                  textStyle: TextStyle(color: Color(0xFF35C900)),
                  totalRepeatCount: 0,
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Color(0xFF002E02),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Class Name",
                      style: kInputPageFontStyle,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    child: Container(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        thisListItemObj.itemName,
                        style: kInputPageFontStyle.copyWith(
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Location",
                      style: kInputPageFontStyle,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    child: Container(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        thisListItemObj.itemLocation,
                        style: kInputPageFontStyle.copyWith(
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Day",
                      style: kInputPageFontStyle,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    child: Container(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        thisListItemObj.itemDay,
                        style: kInputPageFontStyle.copyWith(
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Time",
                      style: kInputPageFontStyle,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    child: Container(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        thisListItemObj.itemTime,
                        style: kInputPageFontStyle.copyWith(
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Color",
                      style: kInputPageFontStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    color: Color(int.parse(thisListItemObj.itemColor)),
                    height: 50,
                    width: 400,
                    child: Container(
                      padding: EdgeInsets.only(left: 15, top: 15),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Color(0xFF484848)),
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              width: double.infinity,
              height: 50,
              child: FlatButton(
                onPressed: () {
                  print("TAPPED");
                  final database = Provider.of<AppDatabase>(
                    context,
                    listen: false,
                  );
                  print("Database done");
                  database.deleteListItems(thisListItemObj);

                  Navigator.pop(context);
                },
                child: Center(
                  child: Container(
                    child: Text(
                      "DELETE",
                      style: TextStyle(
                        fontFamily: 'Code8x8',
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(color: Color(0xFF484848)),
            //   margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            //   width: double.infinity,
            //   height: 50,
            //   child: FlatButton(
            //     onPressed: () {
            //       print("TAPPED");
            //       final database = Provider.of<AppDatabase>(
            //         context,
            //         listen: false,
            //       );
            //       print("Database done");
            //       // save data
            //       print(classNameController.text);
            //       print("classname");
            //       print(locationController.text);
            //       print(pickedTime);
            //       print(dayController.text);
            //       database.updateListItems(thisListItemObj.copyWith(
            //           itemTime: pickedTime,
            //           itemName: classNameController.text,
            //           itemLocation: locationController.text,
            //           itemDay: selectedDay,
            //           itemColor: selectedColor));
            //       Navigator.pop(context);
            //     },
            //     child: Center(
            //       child: Container(
            //         child: Text(
            //           "UPDATE",
            //           style: TextStyle(
            //             fontFamily: 'Code8x8',
            //             color: Color(0xFF00D81D),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ));
  }
}

//TODO Make this page look much better
//TODO give a color picker
//TODO time picker
//TODO Day picker
//TODO Why does the keyboard block the whole screen?
