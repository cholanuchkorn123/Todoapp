import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const boxBottomBorderDec = BoxDecoration(
    color: Color(0xffACB1D6),
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)));
final styleName = GoogleFonts.lato(
    height: 1.5,
    fontSize: 28,
    color: const Color(0xff394867),
    fontWeight: FontWeight.w700);
final styleWelcomeText = GoogleFonts.lato(
    height: 1.5,
    fontSize: 24,
    color: const Color(0xff394867),
    fontWeight: FontWeight.w700);
final boxStatusDec = BoxDecoration(
    color: const Color(0xffDBDFEA), borderRadius: BorderRadius.circular(30));
final styleFormatDate =
    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w700);
final styleDescription =
    GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600);
final styleType = GoogleFonts.lato(
    fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600);
final styleBoxListtile = BoxDecoration(
    color: const Color(0xffD4FAFC).withOpacity(0.4),
    border: Border.all(width: 2, color: Colors.grey),
    borderRadius: BorderRadius.circular(15));
final styleButtonPincode = GoogleFonts.lato(
    fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700);
final pincodeTextEnter = GoogleFonts.lato(
    fontSize: 26, color: const Color(0xffBE5A83), fontWeight: FontWeight.w700);
final errorText = GoogleFonts.lato(
    fontSize: 20, color: const Color(0xffE06469), fontWeight: FontWeight.w800);
final usernameText = GoogleFonts.lato(
    fontSize: 24, color: const Color(0xff8294C4), fontWeight: FontWeight.w700);
const textFieldStyle = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
  ),
  hintText: 'USERNAME',
  alignLabelWithHint: true,
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);
final styleButtonNext = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFEAD2)),
  side: MaterialStateProperty.all<BorderSide>(
    const BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
);

final styleNextButtonfont = GoogleFonts.lato(
    fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600);
