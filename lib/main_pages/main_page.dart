import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:tutodo/components/my_colors.dart';
import 'package:tutodo/main_pages/add_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 27, top: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 30,
                child: Image.asset('assets/images/menu.png'),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Tasks',
                    style: TextStyle(
                      fontSize: 47,
                    ),
                  ),
                  Spacer(),
                  Image.asset('assets/images/notif.png'),
                  SizedBox(
                    width: 27,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              'TODAY',
                              style: TextStyle(
                                fontSize: 15,
                                color: MyColors.mainColor,
                              ),
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              'TOMORROW'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                color: MyColors.mainColor,
                              ),
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              'ALL',
                              style: TextStyle(
                                fontSize: 15,
                                color: MyColors.mainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Stack(
                        children: [
                          Container(
                            height: double.maxFinite,
                            color: MyColors.home_background.withOpacity(0.25),
                            child: SingleChildScrollView(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 12,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ListTile(
                                      title: Text(
                                        ' Hello',
                                        style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          decorationColor: MyColors.mainColor,
                                          decorationStyle: TextDecorationStyle.solid,
                                          decorationThickness: 3,
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AddPage(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                  ),
                                  color: MyColors.mainColor,
                                ),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          )
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
    );
  }
}
