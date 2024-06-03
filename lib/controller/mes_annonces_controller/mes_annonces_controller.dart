import 'dart:developer';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/model/get_parking_model.dart';
import 'package:placealouer/utils/network/repo.dart';
import 'package:placealouer/view/main_home/search_view/annonces/annonces_detail_screen.dart';

class MesAnnoncesController extends GetxController {
  RxBool isActive = false.obs;
  RxList<Parking> parking = <Parking>[].obs;
  RxSet<Marker> markers = <Marker>{}.obs;
  GoogleMapController? mapController;
  void getPlaceDetailWithLatLng(LatLng latLng) async {
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latLng.latitude, latLng.longitude),
          zoom: 14.4746,
        ),
      ),
    );
  }

  Position? position;

  void getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setCurrentPosition(position);
    getPlaceDetailWithLatLng(LatLng(position!.latitude, position!.longitude));
    // setCurrentPosition(position);
  }

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(46.2276, 2.2137),
    zoom: 14.4746,
  );
  void setCurrentPosition(Position? position) {
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position.longitude),
      zoom: 14.4746,
    );
  }

  Future<Uint8List> getBytesFromAsset(String path) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: 100);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  TextEditingController searchController = TextEditingController();
  Future<GetParkingModel?> getParkings(
      {BuildContext? context, required String searchValue}) async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/png/Map pin.png');

// final Uint8List markerIcon =
//         await File("aassets/png/Map pin.png").readAsBytes();

    var res = await ApiRepo.getParkings<GetParkingModel>({
      "page": 1,
      "limit": 100,
      "search": searchValue,
    });
    parking.value = res.data?.data?.parking?.obs ?? [];
    log("message : ${parking[0].vendor?.avgRating}");
    parking.refresh();
    update();
    // parking.value.
    context == null
        ? null
        : markers.addAll(parking.map(
            (e) {
              return Marker(
                icon: BitmapDescriptor.fromBytes(markerIcon),
                markerId: MarkerId(e.id ?? "marker_1"),
                onTap: () {
                  modalBottomSheetMenu(context, e);
                },
                position: LatLng(double.parse(e.latitude ?? ""),
                    double.parse(e.longitude ?? "")),
                infoWindow: InfoWindow(title: e.parkingName ?? "marker_1"),
              );
            },
          ).toSet());
    markers.refresh();
    return res.data;
  }

  Future getConversationId(BuildContext context, String receiverId) async {
    var res = await ApiRepo.getConversationId(receiverId, context);
    log("message : ${res.data}");
    return res.data;
  }

  void modalBottomSheetMenu(BuildContext context, Parking parking) {
    log("message : ${parking.id} ==>");
    try {
      showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            // height: 250.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 5,
                    width: 50,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Text(
                    parking.parkingName?.toUpperCase() ?? "",
                    style: AppTextStyle.regularBold20
                        .copyWith(color: appBlackColor),
                  ),
                  height10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Adresse:- ",
                        style: AppTextStyle.regularBold15
                            .copyWith(color: appBlackColor),
                      ),
                      Expanded(
                        child: Text(
                          "${parking.address?.address}, ${parking.address?.city}, ${parking.address?.state}, ${parking.address?.zip}",
                          style: AppTextStyle.normalRegularBold15
                              .copyWith(color: appBlackColor),
                        ),
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Durée:-      ",
                        style: AppTextStyle.regularBold15
                            .copyWith(color: appBlackColor),
                      ),
                      Expanded(
                        child: Text(
                          "à 1.4 km",
                          style: AppTextStyle.normalRegularBold15
                              .copyWith(color: appBlackColor),
                        ),
                      ),
                    ],
                  ),
                  height10,
                  height10,
                  CommonButton(
                    onTap: () {
                      Get.back();
                      Get.to(
                        () => AnnoncesDetailScreen(
                          parkingId: parking.id.toString(),
                        ),
                      );
                    },
                    title: "VOIR PLUS",
                    buttonColor: buttonColor,
                    borderColor: buttonColor,
                    titleColor: appWhiteColor,
                    height: 35,
                    margin: const EdgeInsets.only(bottom: 20),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e, st) {
      log("----=-=-=--> $e");
      log("----=-=-=--> $st");
      rethrow;
    }
  }

  RxInt imageIndex = 0.obs;
  void changeIndex(int index) {
    imageIndex.value = index;
  }

  Rx<Parking> parkingDetails = Parking().obs;
  Future<GetParkingModel?> getParkingsId(String parkingId) async {
    var res = await ApiRepo.getParkingsID<GetParkingModel>(parkingId);
    parkingDetails.value = res.data?.data?.parking?.first ?? Parking();
    return res.data;
  }
}
