import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/constant.dart';
import 'package:todo_app/ui/screen/Home.dart';

import '../../data/database.dart';

class PincodeScreen extends StatefulWidget {
  const PincodeScreen({super.key});

  @override
  _PincodeScreenState createState() => _PincodeScreenState();
}

class _PincodeScreenState extends State<PincodeScreen> {
  String pinCode = '';
  String erroText = '';
  TodoDataBase db = TodoDataBase();
  TextEditingController textEditingController = TextEditingController();
  void _updatePinCode(String newPinCode) {
    setState(() {
      pinCode = newPinCode;
    });
    erroText = "";
    if (pinCode.length == 6) {
      if (db.isPincodeEmpty()) {
        db.updateTodopincode(pinCode);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } else {
        if (db.checkPincode(pinCode)) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
        } else {
          setState(() {
            erroText = 'invalid pin code';
            pinCode = '';
          });
        }
      }
    }
  }

  Widget _buildDigitButton(int digit) {
    return InkWell(
      onTap: () => _updatePinCode(pinCode + digit.toString()),
      child: CircleAvatar(
        backgroundColor: const Color(0xffF6FFDE),
        radius: 40,
        child: Center(
          child: Text(
            digit.toString(),
            style:styleButtonPincode,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    List<int> dotitem = [1, 2, 3, 4, 5, 6];
    bool isUsername = db.isUsernameEmpty();
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: isUsername
          ? const CircularProgressIndicator(
              color: Colors.black,
            )
          : SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                  'Enter your pin code',
                  style: pincodeTextEnter,
                ),
                const SizedBox(height: 20),
                Text(
                  erroText,
                  style:errorText,
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: dotitem.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        int dotnum = dotitem[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: pinCode.length >= dotnum
                                ? Colors.black
                                : const Color(0xffF6FFDE),
                          ),
                        );
                      }),
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDigitButton(1),
                    _buildDigitButton(2),
                    _buildDigitButton(3),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDigitButton(4),
                    _buildDigitButton(5),
                    _buildDigitButton(6),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDigitButton(7),
                    _buildDigitButton(8),
                    _buildDigitButton(9),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(width: 80),
                    _buildDigitButton(0),
                    GestureDetector(
                      onTap: () => pinCode.isNotEmpty
                          ? _updatePinCode(
                              pinCode.substring(0, pinCode.length - 1))
                          : "",
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xffF6FFDE),
                        child: Icon(
                          Icons.backspace,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.1,
                )
              ],
            ),
          ),
    );
  }
}
