import 'package:flutter/material.dart';
import 'package:houzeocontacts/constants/colors.dart';

// ignore: must_be_immutable
class CustomTextFeild2 extends StatelessWidget {
  CustomTextFeild2(
      {
 
      this.sufixbutton,
      this.readOnly = false,
      this.prefixIcon,
      this.controller,
      this.keybordtype,
      super.key,
      this.tap,
      this.enabled = true,
      this.onChanged,
      required this.heading,
      this.obscure = false,
      this.validator});

  TextInputType? keybordtype;
  String heading;
  bool obscure;
  bool enabled;
  bool readOnly;
  Icon? sufixbutton;
  Icon? prefixIcon;
  TextEditingController? controller;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  void Function()? tap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          readOnly: readOnly,
          enabled: enabled,
          onChanged: onChanged,
          obscureText: obscure,
          controller: controller,
          keyboardType: keybordtype,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.white), // White border for error state
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.white), // White border for error state
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.white), 
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.white), 
            ),
            border: OutlineInputBorder(
              gapPadding: 4,
              borderSide: const BorderSide(
                  strokeAlign: BorderSide.strokeAlignCenter),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: heading, 
            labelStyle: const TextStyle(
              color: Colors.white, // Label color
              fontWeight: FontWeight.w700,
            ),
         
            hintStyle: const TextStyle(color: Color.fromARGB(255, 174, 169, 169)),
            filled: true,
            fillColor: AppColors.colorGray, 
            suffixIcon: sufixbutton != null
                ? GestureDetector(onTap: tap, child: sufixbutton)
                : null,
            prefixIcon: prefixIcon,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
