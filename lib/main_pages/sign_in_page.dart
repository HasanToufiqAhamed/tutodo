import 'package:flutter/material.dart';
import 'package:tutodo/components/my_colors.dart';
import 'package:tutodo/main_pages/main_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: double.maxFinite,
            alignment: Alignment.topLeft,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.6,
              child: Image.asset('assets/images/img.png'),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello there,\nWelcome',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 2,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Sign In with Google',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset('assets/images/google.png'),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
