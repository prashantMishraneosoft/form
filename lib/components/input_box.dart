import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String prefixText;
  final String hintText;
  final Color color;
  final FocusNode focusNode;
  final bool readOnly;
  final String initialValue;
  final FormFieldValidator<String> validator;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final int maxLength;

  const InputBox({
    this.labelText,
    this.controller,
    this.prefixText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.color,
    this.focusNode,
    this.readOnly,
    this.initialValue,
    this.validator,
    this.borderColor,
    this.textColor,
    this.backgroundColor,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            labelText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
          ),
          child: TextFormField(
            validator: validator,
            initialValue: initialValue,
            readOnly: readOnly != null ? readOnly : false,
            controller: controller,
            maxLength: maxLength,
            maxLines: 1,
            focusNode: focusNode,
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              prefixIcon: prefixIcon,
              hintText: hintText,
              prefixText: prefixText,
                prefixStyle: TextStyle(color: color),
                suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black, width: 32.0),
              ),
            ),

          ),
        ),
      ],
    );
  }
}

class InputBoxNoTitle extends StatelessWidget {
  final TextEditingController controller;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String prefixText;
  final String hintText;
  final Color color;
  final FocusNode focusNode;
  final bool readOnly;
  final String initialValue;
  final FormFieldValidator<String> validator;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final int maxLength;


  const InputBoxNoTitle({
    this.controller,
    this.prefixText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.color,
    this.focusNode,
    this.readOnly,
    this.initialValue,
    this.validator,
    this.borderColor,
    this.textColor,
    this.backgroundColor,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: TextFormField(
        validator: validator,
        initialValue: initialValue,
        readOnly: readOnly != null ? readOnly : false,
        controller: controller,
        maxLength: maxLength,
        maxLines: 1,
        focusNode: focusNode,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: prefixIcon,
          hintText: hintText,
          prefixText: prefixText,
          prefixStyle: TextStyle(color: color),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.black, width: 32.0),
          ),
        ),

      ),
    );
  }
}