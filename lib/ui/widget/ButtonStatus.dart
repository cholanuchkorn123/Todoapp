import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class ButtonStatus extends StatelessWidget {
  const ButtonStatus({
    super.key,
    required this.type,
    required this.onpress,
    required this.nowTypePick,
  });
  final String type;
  final String nowTypePick;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        width: width * 0.2,
        decoration: BoxDecoration(
            color: type == nowTypePick
                ? const Color(0xff9BA4B5)
                : const Color(0xffF6F1F1),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          type,
          style:styleType,
        )),
      ),
    );
  }
}
