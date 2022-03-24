import 'package:get/get.dart';
import 'package:intesasoft_case_study/models/response_model.dart';
import 'package:intesasoft_case_study/services/http_services.dart';

class CitiesController extends GetxController {
  var cities = <ResponseModel>[].obs;
  var qrVal = ''.obs;

  getCitiesData() {
    HttpServices().getCities().then((value) {
      for (var i = 0; i < value!.length; i++) {
        cities.add(value[i]);
      }
    });
  }
}
