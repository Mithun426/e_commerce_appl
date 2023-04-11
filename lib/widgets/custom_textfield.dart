import 'package:e_commerce_app/consts/consts.dart';
Widget customTextfield({String? title, String? hint, controller,ispass}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: ispass,
        controller: controller,
        decoration:InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(color: redColor)
          )
        )
      ),
      5.heightBox
    ],
  );
}
