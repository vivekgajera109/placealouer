import 'package:get/get.dart';

class DurationController extends GetxController {
  RxList<WeekModel> weekName = <WeekModel>[
    WeekModel(
      name: "Lundi de",
      startedAt: "10:00",
      endedAt: "11:00",
      key: 0,
    ),
    WeekModel(
      name: "Mardi de",
      startedAt: "10:00",
      endedAt: "11:00",
      key: 1,
    ),
    WeekModel(
      name: "Mercredi de",
      startedAt: "10:00",
      endedAt: "11:00",
      key: 2,
    ),
    WeekModel(
      name: "Jeudi de",
      startedAt: "10:00",
      endedAt: "11:00",
      key: 3,
    ),
    WeekModel(
      name: "Vendredi de",
      startedAt: "10:00",
      endedAt: "11:00",
      key: 4,
    ),
    WeekModel(
      name: "Samedi de",
      startedAt: "10:00",
      endedAt: "11:00",
      key: 5,
    ),
    WeekModel(
      name: "Dimanche de",
      startedAt: "10:00",
      endedAt: "11:00",
      key: 6,
    ),
  ].obs;
  RxList<WeekModel> selectedWeek = <WeekModel>[].obs;
}

class WeekModel {
  String? name;
  String? startedAt;
  String? endedAt;
  int key;

  WeekModel({this.name, this.startedAt, this.endedAt, required this.key});
}
