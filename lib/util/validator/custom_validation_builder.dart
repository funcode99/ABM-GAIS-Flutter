import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

extension CustomValidationBuilder on ValidationBuilder {
  ValidationBuilder min(int minValue) => add((value) {
    if(int.parse(value!) < minValue){
      return "form_min_value".trParams({
        "min" : minValue.toString()
      });
    }

    return null;
  });

  ValidationBuilder max(int maxValue, [String? message]) => add((value) {
    if(int.parse(value!) > maxValue){
      return message ?? "form_max_value".trParams({
        "max" : maxValue.toString()
      });
    }

    return null;
  });

  ValidationBuilder validLink(){
    return add((value){
      String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value!)) {
        return 'Please enter valid url';
      }
      return null;
    });
  }
}