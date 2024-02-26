import 'package:get/get.dart';

class SelectCarController extends GetxController {
  RxInt selectCar = 0.obs;
  RxList<CarModel> carList = <CarModel>[
    CarModel(
        image: "assets/png/car1.png",
        selectedImage: "assets/png/s_car1.png",
        title: "2 Roues, Mini, Clio, 208, Twingo, Polo, Focus..."),
    CarModel(
        image: "assets/png/car2.png",
        selectedImage: "assets/png/s_car2.png",
        title: "Mégane, 308, Scénic, C4, 508, Série 3l, Tiguan..."),
    CarModel(
        image: "assets/png/car3.png",
        selectedImage: "assets/png/s_car3.png",
        title: "Mercedes Vito, Mercedes Sprinter, Renault Master..."),
  ].obs;
}

class CarModel {
  String? image;
  String? selectedImage;
  String? title;
  CarModel({this.image, this.title, this.selectedImage});
}
