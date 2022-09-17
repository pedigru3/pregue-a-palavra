import 'package:get/get.dart';

class ValueController extends GetxController {
  RxString definedValue = ''.obs;

  RxString name = ''.obs;

  RxBool isLoading = false.obs;

  void setValue(String newValue) async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 3));

    definedValue.value = newValue;
    isLoading.value = false;
  }

  void boasVindas(String name) async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 5));
    
    isLoading.value = false;

    this.name.value = 'Olá, $name! Seja muito bem vindo!';
  }
}
