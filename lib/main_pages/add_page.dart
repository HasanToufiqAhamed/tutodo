import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:tutodo/components/my_colors.dart';
import 'package:tutodo/database/DBHelper.dart';
import 'package:tutodo/model/tasks.dart';
import 'package:tutodo/provider/offline_cart_provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController title = TextEditingController();
  int selectedIndex = 0;
  DateTime? selectedDate;
  bool selectDate = false;
  var dbHelper = DBHelper();

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
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              child: const Icon(
                Icons.check,
              ),
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
                    const Text(
                      'Add new',
                      style: TextStyle(
                        fontSize: 47,
                      ),
                    ),
                    TextFormField(
                      controller: title,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors.mainColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors.mainColor,
                            width: 4.0,
                          ),
                        ),
                        hintText: 'Enter Task',
                        hintStyle: TextStyle(
                          color: MyColors.mainText.withOpacity(0.21),
                        ),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                      maxLines: 2,
                      minLines: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'WHEN',
                          style: TextStyle(
                            fontSize: 15,
                            color: MyColors.dexText,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: MyColors.home_background.withOpacity(0.25),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      selectedIndex = 1;
                                      selectDate = false;
                                      FocusScope.of(context).unfocus();
                                    });
                                  },
                                  child: Container(
                                    color: MyColors.home_background
                                        .withOpacity(0.25),
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
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
                                      selectDate = false;
                                      FocusScope.of(context).unfocus();
                                    });
                                  },
                                  child: Container(
                                    color: MyColors.home_background
                                        .withOpacity(0.25),
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
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
                                    FocusScope.of(context).unfocus();
                                    DatePicker.showDatePicker(
                                      context,
                                      showTitleActions: true,
                                      minTime: DateTime.now(),
                                      theme: DatePickerTheme(
                                        headerColor: MyColors.home_background
                                            .withOpacity(0.25),
                                        backgroundColor: Colors.white,
                                        itemStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                        doneStyle: const TextStyle(
                                          color: MyColors.mainColor,
                                          fontSize: 16,
                                        ),
                                        cancelStyle: TextStyle(
                                          color: MyColors.mainText
                                              .withOpacity(0.21),
                                          fontSize: 14,
                                        ),
                                        itemHeight: 30,
                                        titleHeight: 60,
                                      ),
                                      onChanged: (date) {
                                        print('change $date in time zone ' +
                                            date.timeZoneOffset.inHours
                                                .toString());
                                      },
                                      onConfirm: (date) {
                                        print('confirm $date');
                                        setState(() {
                                          selectedDate = date;
                                          selectDate = true;
                                          selectedIndex = 3;
                                        });
                                      },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en,
                                    );
                                  },
                                  child: Container(
                                    color: MyColors.home_background
                                        .withOpacity(0.25),
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    child: Text(
                                      selectDate
                                          ? DateFormat('dd MMM yyyy')
                                              .format(selectedDate!)
                                          : 'Select Date',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: selectDate
                                            ? MyColors.mainColor
                                            : MyColors.mainText
                                                .withOpacity(0.67),
                                        fontWeight:
                                            selectDate ? FontWeight.bold : null,
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
                : GestureDetector(
                    onTap: () {
                      addTasks();
                    },
                    child: Container(
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
                    ),
                  )
          ],
        ),
      ),
    );
  }

  void addTasks() {
    if (title.text.isEmpty) {
      print('Error: empty title');
    } else if (selectedIndex == 0 && selectDate == false) {
      print('Error: select date');
    } else {
      DateTime? finalDate;
      if (selectedIndex == 1) {
        finalDate = DateTime.now();
      } else if (selectedIndex == 2) {
        finalDate = DateTime.now().add(Duration(days: 1));
      } else {
        finalDate = selectedDate;
      }
      Tasks cp = Tasks(active: 0, time: '$finalDate', title: title.text);
      dbHelper.save(cp);
      context.read<OfflineCartProvider>().getAllProduct();
      Navigator.pop(context);
    }
  }
}
