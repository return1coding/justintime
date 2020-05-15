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
                    height: 20,
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
                    child: TextField(
                      style: kInputPageFontStyle.copyWith(fontSize: 13),
                      cursorWidth: 10,
                      cursorColor: kInputPageFontStyle.color,
                      controller: classNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                    child: TextField(
                      style: kInputPageFontStyle.copyWith(fontSize: 13),
                      cursorWidth: 10,
                      cursorColor: kInputPageFontStyle.color,
                      controller: locationController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Day",
                            style: kInputPageFontStyle,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          width: 400,
                          child: FlatButton(
                            color: Colors.black,
                            child: Text(
                              selectedDay == null ? "SELECT" : selectedDay,
                              style: kInputPageFontStyle.copyWith(fontSize: 12),
                            ),
                            onPressed: () {
                              showPickerArray(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Time",
                            style: kInputPageFontStyle,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          width: 400,
                          child: FlatButton(
                            color: Colors.black,
                            child: Text(
                              pickedTime == null ? "SELECT" : pickedTime,
                              style: kInputPageFontStyle.copyWith(fontSize: 12),
                            ),
                            onPressed: () {
                              DatePicker.showTimePicker(context,
                                  showTitleActions: true,
                                  showSecondsColumn: false,
                                  theme: DatePickerTheme(
                                      itemHeight: 50,
                                      backgroundColor: Colors.black,
                                      doneStyle: kInputPageFontStyle,
                                      itemStyle: kInputPageFontStyle),
                                  onChanged: (time) {
                                print('change $time');
                              }, onConfirm: (time) {
                                print('confirm $time');
                                pickedTime = time.hour.toString() +
                                    " : " +
                                    time.minute.toString();
                                print(pickedTime);
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Color",
                            style: kInputPageFontStyle,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          width: 400,
                          child: FlatButton(
                            color: selectedColor == null
                                ? Colors.black
                                : Color(int.parse(selectedColor)),
                            child: Text(
                              selectedColor == null ? "SELECT" : " ",
                              style: kInputPageFontStyle.copyWith(fontSize: 12),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(
                                    "Pick Color",
                                    style: kInputPageFontStyle,
                                  ),
                                  backgroundColor: Colors.black,
                                  content: MaterialColorPicker(
                                      onMainColorChange: (Color color) {
                                        selectedColor =
                                            color.value.toInt().toString();
                                        print(color.value.toInt().toString());
                                      },
                                      spacing: 20.0,
                                      elevation: 0,
                                      shrinkWrap: true,
                                      allowShades: false,
                                      colors: [
                                        Colors.red,
                                        Colors.deepOrange,
                                        Colors.yellow,
                                        Colors.lightGreen,
                                        Colors.lightBlue,
                                        Colors.blue,
                                        Colors.purple
                                      ],
                                      selectedColor: Colors.red),
                                  actions: [
                                    FlatButton(
                                      child: Text(
                                        'CANCEL',
                                        style: kInputPageFontStyle.copyWith(
                                            fontSize: 10),
                                      ),
                                      onPressed: Navigator.of(context).pop,
                                    ),
                                    FlatButton(
                                      child: Text('SUBMIT',
                                          style: kInputPageFontStyle.copyWith(
                                              fontSize: 10)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        print("hello");
                                        print(selectedColor);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
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
