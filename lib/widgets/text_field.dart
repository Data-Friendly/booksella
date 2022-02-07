import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextFormField extends StatelessWidget {
  String text;
  Widget icon;
  FocusNode focusNode;
  bool boolValue;
  TextEditingController? controller;
  String? Function(String?)? function;
  InputTextFormField(this.text, this.icon, this.focusNode, this.boolValue,
      this.controller, this.function,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: screenheight * 0.075,
          width: double.infinity,
          decoration: focusNode.hasFocus
              ? null
              : const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
        ),
        Card(
          elevation: focusNode.hasFocus ? 10 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
              height: focusNode.hasFocus ? screenheight * 0.073 : 0,
              width: focusNode.hasFocus ? double.infinity : 0,
              decoration: focusNode.hasFocus
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white)
                  : null),
        ),
        TextFormField(
          controller: controller,
          validator: function,
          focusNode: focusNode,
          obscureText: boolValue,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold, color: Colors.grey[700]),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: icon,
            errorBorder: InputBorder.none,
            filled: false,
            hintText: text,
            contentPadding:
                EdgeInsets.symmetric(vertical: screenheight * 0.027),
            hintStyle: GoogleFonts.lato(color: Colors.grey[800], fontSize: 11),
          ),
        ),
      ],
    );
  }
}
