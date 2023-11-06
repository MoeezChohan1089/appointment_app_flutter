
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pms/utilites/constants.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.obscureText,
    this.focusNode,
    this.onChanged,
     this.validation,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.isFilled,
    this.isUnderlineInputBorder,
    this.isOutlineInputBorder,
    this.isOutlineInputBorderColor,
    this.maxLength,
    this.fontSize,
    this.inputFormatter,
    this.onTap,
    this.fillColor,
    this.fieldborderColor,
    this.textFieldFillColor,
    this.fieldborderRadius,
    this.maxLines,
    this.contentPaddingLeft,
    this.contentPaddingRight,
    this.contentPaddingTop,
    this.contentPaddingBottom,
    this.containerPadding,
    this.textColor,
    this.hintTextColor,
    this.hintFontSize,
    this.textFontSize,
    this.textAlign,
    this.prefixIcon,
    this.suffixIcon,
    Key? key}) : super(key: key);
 final bool ? obscureText;
 final String? Function(String?)? validation;
 final Function? onChanged;
 final Function? onTap;
 final FocusNode? focusNode;
 final TextEditingController? controller;
 final TextInputType? keyboardType;
 final String ? hintText;
 final bool? isFilled;
 final bool? isUnderlineInputBorder;
 final bool? isOutlineInputBorder;
 final Color? isOutlineInputBorderColor;
 final int? maxLength;
 final int? maxLines;
 final double? fontSize;
 final int? inputFormatter;
 final Color? fillColor;
 final Color? textFieldFillColor;
 final Color? fieldborderColor;
 final Color? textColor;
 final Color? hintTextColor;
 final double? textFontSize;
 final double? hintFontSize;
 final double? fieldborderRadius;
 final double? contentPaddingTop;
 final double? contentPaddingBottom;
 final double? contentPaddingLeft;
 final double? contentPaddingRight;
 final double? containerPadding;
 final TextAlign? textAlign;
 final Widget? prefixIcon;
 final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: containerPadding??0),
      decoration: BoxDecoration(
          color:fillColor??Colors.transparent,
          border: Border.all(
              width: fieldborderColor!=null? 0:1,
              color: fieldborderColor??Colors.transparent
          ),
          borderRadius: BorderRadius.circular(fieldborderRadius??4)
      ),
      child: TextFormField(
        obscureText: obscureText??false,
        maxLength: maxLength,
        maxLines: maxLines??1,
        focusNode: focusNode,
        onTap: ()=>onTap,
        validator: validation,
        onChanged:(_)=> onChanged,
        controller: controller,
        keyboardType: keyboardType,
        textAlign: textAlign??TextAlign.left,
      //  textAlignVertical:textAlign != null? TextAlignVertical.bottom:TextAlignVertical.center,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          contentPadding:  EdgeInsets.only(left: contentPaddingLeft??12,right:contentPaddingRight?? 12,
          top: contentPaddingTop??13,bottom: contentPaddingBottom??13),
          isDense: true,
          hintText: hintText,
          hintStyle:  TextStyle(
              fontSize: hintFontSize??15,
              color: hintTextColor??darkBlueColor
          ),
          helperStyle:  const TextStyle(
              color: Colors.transparent,
          ),
          errorStyle: const TextStyle(
              color: Colors.red
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: textFieldFillColor,
          border:isUnderlineInputBorder==false||isOutlineInputBorder==false?InputBorder.none:isOutlineInputBorder==false?
          const UnderlineInputBorder():OutlineInputBorder(
              borderSide: BorderSide(
                  width: isOutlineInputBorderColor!=null? 0:1,
                  color: isOutlineInputBorderColor??Colors.transparent
              ),
              borderRadius: BorderRadius.circular(fieldborderRadius??4)
          ),
          enabledBorder:isUnderlineInputBorder==false||isOutlineInputBorder==false?InputBorder.none:isOutlineInputBorder==false?
          const UnderlineInputBorder():OutlineInputBorder(
              borderSide: BorderSide(
                  width: isOutlineInputBorderColor!=null? 0:1,
                  color: isOutlineInputBorderColor??Colors.transparent
              ),
              borderRadius: BorderRadius.circular(fieldborderRadius??4)
          ),
          focusedBorder:isUnderlineInputBorder==false||isOutlineInputBorder==false?InputBorder.none:isOutlineInputBorder==false?
          const UnderlineInputBorder():OutlineInputBorder(
              borderSide: BorderSide(
                  width: isOutlineInputBorderColor!=null? 0:1,
                  color: isOutlineInputBorderColor??Colors.transparent
              ),
            borderRadius: BorderRadius.circular(fieldborderRadius??4)
          ),
          errorBorder: isUnderlineInputBorder==false||isOutlineInputBorder==false?InputBorder.none:isOutlineInputBorder==false?
          const UnderlineInputBorder():OutlineInputBorder(
            borderSide: BorderSide(
                width: isOutlineInputBorderColor!=null? 0:1,
                color: redColor
            ),
              borderRadius: BorderRadius.circular(fieldborderRadius??4)
          ),
        ),
        inputFormatters: [LengthLimitingTextInputFormatter(inputFormatter)],
        style:  TextStyle(
          color: textColor??blackColor,
          fontSize: textFontSize??15,
        ),
      ),
    );
  }
}
