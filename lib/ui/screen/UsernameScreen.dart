import 'package:flutter/material.dart';

import 'package:todo_app/constants/constant.dart';
import 'package:todo_app/ui/screen/PinScreen.dart';

import '../../data/database.dart';

class UsernameScree extends StatefulWidget {
  const UsernameScree({super.key});

  @override
  State<UsernameScree> createState() => _UsernameScreeState();
}

class _UsernameScreeState extends State<UsernameScree> {
  TextEditingController textEditingController = TextEditingController();
  TodoDataBase db = TodoDataBase();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Todo App',
            style: usernameText,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 0.8 * width,
            child: TextField(
              textAlign: TextAlign.center,
              controller: textEditingController,
              decoration: textFieldStyle,
              cursorColor: Colors.black,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 0.25 * width,
            child: TextButton(
                onPressed: () {
                  if (textEditingController.text.length > 12 ||
                      textEditingController.text.isEmpty) {
                    return;
                  } else {
                    db.username = textEditingController.text;
                    db.updateTodousename();
                    FocusScope.of(context).unfocus();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PincodeScreen()));
                  }
                },
                style: styleButtonNext,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: styleNextButtonfont,
                    ),
                    const Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                    ),
                  ],
                )),
          )
        ],
      )),
    );
  }
}
