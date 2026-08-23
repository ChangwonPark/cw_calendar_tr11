import 'dart:developer';

import 'package:cw_calendar_tr11/const/color.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final bool  expand;
  final String label;

  const CustomTextField({
    super.key,
    required this.label,
    this.expand=false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            label,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600
          ),
        ),

        if(!expand)
        renderTextFormField(),

        if(expand)
          Expanded(
              child: renderTextFormField()
          ),

      ],
    );
  }
  renderTextFormField(){
    return         TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[300]
      ),
      cursorColor: Colors.grey,
      maxLines: expand ? null : 1,
      minLines: expand ? null : 1,
      expands: expand,
    );
  }
}
