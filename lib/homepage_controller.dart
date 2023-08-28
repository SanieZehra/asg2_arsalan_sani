import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'models/model.dart';


class HomepageContoller extends GetxController {
  Rx<CheckingModel>userData =CheckingModel().obs;
  var isLoading = true.obs;
  Rx<String>data = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getUsers();
  }

  Future<void> getUsers() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      userData(CheckingModel.fromJson(jsonData));
      data(jsonData.toString());
      print(userData.value!.data![0].firstName);
      isLoading.value = false;
      update();
    } else {
      data('Error: ${response.statusCode}');
    }
  }
}
