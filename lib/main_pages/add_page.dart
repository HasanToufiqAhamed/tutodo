import 'package:flutter/material.dart';
import 'package:tutodo/components/my_colors.dart';
import 'package:tutodo/dialogue/select_date_dialogue.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController title = TextEditingController();
  int selectedIndex = 0;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      floatingActionButton: keyboardIsOpened
          ? FloatingActionButton(
              backgroundColor: MyColors.mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 7,
              onPressed: () {},
            )
          : null,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 27,
                  top: 27,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Add new',
                      style: TextStyle(
                        fontSize: 47,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.mainColor,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.mainColor,
                              width: 4.0,
                            ),
                          ),
                          hintText: 'Enter Task',
                          hintStyle: TextStyle(
                            color: MyColors.mainText.withOpacity(0.21),
                          )),
                      style: TextStyle(
                        fontSize: 32,
                      ),
                      maxLines: 2,
                      minLines: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WHEN',
                          style: TextStyle(
                            fontSize: 15,
                            color: MyColors.dexText,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: MyColors.home_background.withOpacity(0.25),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    color: MyColors.home_background
                                        .withOpacity(0.25),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    child: Text(
                                      'Today',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: selectedIndex == 1
                                            ? MyColors.mainColor
                                            : MyColors.mainText
                                                .withOpacity(0.67),
                                        fontWeight: selectedIndex == 1
                                            ? FontWeight.bold
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = 2;
                                    });
                                  },
                                  child: Container(
                                    color: MyColors.home_background
                                        .withOpacity(0.25),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    child: Text(
                                      'Tomorrow',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: selectedIndex == 2
                                            ? MyColors.mainColor
                                            : MyColors.mainText
                                                .withOpacity(0.67),
                                        fontWeight: selectedIndex == 2
                                            ? FontWeight.bold
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    /*setState(() {
                                      selectedIndex=3;
                                    });*/
                                    /*showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      context: context,
                                      builder: (BuildContext context) =>
                                          selectDateDialogue(),
                                    );*/
                                    showDatePicker(
                                        context: context,
                                        initialDate: selectedDate,
                                        firstDate: DateTime(2010),
                                        lastDate: DateTime(2025),
                                        helpText: "SELECT BOOKING DATE",
                                        cancelText: "NOT NOW",
                                        confirmText: "BOOK NOW"
                                    );
                                  },
                                  child: Container(
                                    color: MyColors.home_background
                                        .withOpacity(0.25),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    child: Text(
                                      'Select Date',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: selectedIndex == 3
                                            ? MyColors.mainColor
                                            : MyColors.mainText
                                                .withOpacity(0.67),
                                        fontWeight: selectedIndex == 3
                                            ? FontWeight.bold
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            keyboardIsOpened
                ? SizedBox()
                : Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 30,
                    ),
                    width: double.maxFinite,
                    color: MyColors.mainColor,
                    child: Text(
                      'Add Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
