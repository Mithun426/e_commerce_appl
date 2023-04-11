import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/colors.dart';

Widget ourButton({color, String? title, textColor, onPress}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: color, padding: const EdgeInsets.all(12)),
    onPressed: 
      onPress,
    
    child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}