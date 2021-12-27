import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:tutodo/components/my_colors.dart';
import 'package:tutodo/database/DBHelper.dart';
import 'package:tutodo/main_pages/add_page.dart';
import 'package:tutodo/model/tasks.dart';
import 'package:tutodo/provider/offline_cart_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 3;
  var dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final offlineCart = context.watch<OfflineCartProvider>();

    List<Tasks> finalTask = offlineCart.cart;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 27, top: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                FeatherIcons.grid,
                size: 30,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    'Tasks',
                    style: TextStyle(
                      fontSize: 47,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    FeatherIcons.bell,
                  ),
                  SizedBox(
                    width: 27,
                  ),
                ],
              ),
              const SizedBox(
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
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                color:
                                    MyColors.home_background.withOpacity(0.25),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    'TODAY',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: selectedIndex == 1
                                          ? MyColors.mainColor
                                          : MyColors.mainText.withOpacity(0.67),
                                      fontWeight: selectedIndex == 1
                                          ? FontWeight.bold
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 2;
                                });
                              },
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                color:
                                    MyColors.home_background.withOpacity(0.25),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    'TOMORROW',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: selectedIndex == 2
                                          ? MyColors.mainColor
                                          : MyColors.mainText.withOpacity(0.67),
                                      fontWeight: selectedIndex == 2
                                          ? FontWeight.bold
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 3;
                                });
                              },
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                color:
                                    MyColors.home_background.withOpacity(0.25),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    'ALL',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: selectedIndex == 3
                                          ? MyColors.mainColor
                                          : MyColors.mainText.withOpacity(0.67),
                                      fontWeight: selectedIndex == 3
                                          ? FontWeight.bold
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      flex: 6,
                      child: Stack(
                        children: [
                          Container(
                            height: double.maxFinite,
                            color: MyColors.home_background.withOpacity(0.25),
                            child: finalTask.isEmpty
                                ? Center(
                                    child: Text(
                                      'Empty',
                                      style: TextStyle(
                                        color:
                                            MyColors.mainText.withOpacity(0.21),
                                        fontSize: 32,
                                      ),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: finalTask.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) => Column(
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          ListTile(
                                            onTap: () {
                                              dbHelper.updateProduct(
                                                Tasks(
                                                    title:
                                                        finalTask[index].title,
                                                    time: finalTask[index].time.toString(),
                                                    active: finalTask[index]
                                                                .active ==
                                                            1
                                                        ? 0
                                                        : 1,
                                                    id: finalTask[index].id),
                                              );
                                              context
                                                  .read<OfflineCartProvider>()
                                                  .getAllProduct();
                                            },
                                            title: Text(
                                              '${finalTask[index].title}',
                                              style: TextStyle(
                                                decoration:
                                                    finalTask[index].active == 0
                                                        ? null
                                                        : TextDecoration
                                                            .lineThrough,
                                                decorationColor:
                                                    MyColors.mainColor,
                                                decorationStyle:
                                                    TextDecorationStyle.solid,
                                                decorationThickness: 3,
                                                fontSize: 21,
                                              ),
                                            ),
                                            subtitle: Text(
                                              DateFormat(
                                                DateTime.now().year ==
                                                        DateTime.parse(
                                                          finalTask[index]
                                                              .time!,
                                                        ).year
                                                    ? 'dd MMM'
                                                    : 'dd MMM yyyy',
                                              ).format(
                                                DateTime.parse(
                                                  finalTask[index].time!,
                                                ),
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
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                  ),
                                  color: MyColors.mainColor,
                                ),
                                child: const Icon(
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
