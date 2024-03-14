import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownList extends StatefulWidget {
   final List<String> options;
   final Function(String? value) onChanged;
   final String hint;
   final TextStyle? hintTextStyle;
   const CustomDropDownList({Key? key,
     this.hintTextStyle,
     required this.options,required this.onChanged,required this.hint}) : super(key: key);

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Padding(
        padding:  EdgeInsetsDirectional.only(start: 15.w),
        child: Text(widget.hint,style: widget.hintTextStyle,),
      ),
      underline:const SizedBox(),
      items: widget.options.map((String value) {
        return DropdownMenuItem<String>(
          enabled: true,
          value: value,
          child: Padding(
            padding:  EdgeInsetsDirectional.only(start: 15.w),
            child: Text(value),
          ),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}
