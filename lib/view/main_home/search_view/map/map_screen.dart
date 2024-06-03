// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/controller/mes_annonces_controller/mes_annonces_controller.dart';
import 'package:placealouer/view/main_home/search_view/annonces/annonces_screen.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  MesAnnoncesController mesAnnoncesController =
      Get.put(MesAnnoncesController());

  @override
  void initState() {
    mesAnnoncesController.getParkings(context: context, searchValue: "");
    mesAnnoncesController.getCurrentPosition();

    super.initState();
  }

  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // log("message---->>> 1 ${_markers.length}");
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() {
              return GoogleMap(
                markers: mesAnnoncesController.markers.value,
                style: '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#263c3f"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6b9a76"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#38414e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#212a37"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9ca5b3"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#1f2835"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#f3d19c"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2f3948"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#515c6d"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  }
]''',
                initialCameraPosition: mesAnnoncesController.kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  // _controller.complete(controller);
                  mesAnnoncesController.mapController = controller;
                  mesAnnoncesController.getCurrentPosition();
                },
              );
            }),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: GooglePlacesAutoCompleteTextFormField(
                // countries: const ["fr"],
                getPlaceDetailWithLatLng: (postalCodeResponse) {
                  searchController.text = postalCodeResponse.description ?? "";
                  mesAnnoncesController.getPlaceDetailWithLatLng(
                    LatLng(
                      double.parse(postalCodeResponse.lat ?? ""),
                      double.parse(postalCodeResponse.lng ?? ""),
                    ),
                  );

                  setState(() {});
                },
                itmClick: (postalCodeResponse) {},
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: appBlackColor.withOpacity(0.6),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  hintStyle: TextStyle(
                    color: appBlackColor.withOpacity(0.6),
                  ),
                  hintText: "Entrer une adresse",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: textFormFieldColor,
                ),
                maxLines: 1,
                textEditingController: searchController,
                googleAPIKey:
                    'AIzaSyCnJtHObJe38cInWUFvseMcJPfC3fA_va4&libraries=places&language=fr',
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: CommonButton(
                  onTap: () {
                    Get.to(() => const AnnoncesScreen());
                  },
                  title: "ANNONCES",
                  buttonColor: buttonColor,
                  borderColor: buttonColor,
                  titleColor: appWhiteColor,
                  margin: const EdgeInsets.only(bottom: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
