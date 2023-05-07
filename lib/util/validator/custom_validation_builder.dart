import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

extension CustomValidationBuilder on ValidationBuilder {
  min(int minValue) => add((value) {
    if(int.parse(value!) < minValue){
      return "form_min_value".trParams({
        "min" : minValue.toString()
      });
    }

    return null;
  });

  max(int maxValue) => add((value) {
    if(int.parse(value!) > maxValue){
      return "form_max_value".trParams({
        "max" : maxValue.toString()
      });
    }

    return null;
  });
}