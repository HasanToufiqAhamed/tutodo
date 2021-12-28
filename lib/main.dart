import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutodo/components/my_colors.dart';
import 'package:tutodo/main_pages/sign_in_page.dart';
import 'package:tutodo/provider/offline_cart_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OfflineCartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TuToDo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<OfflineCartProvider>().getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: Stack(
        children: [
          const Center(
            child: Text(
              'TuToDo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
