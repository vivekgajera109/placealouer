// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// final LatLngBounds sydneyBounds = LatLngBounds(
//   southwest: const LatLng(-34.022631, 150.620685),
//   northeast: const LatLng(-33.571835, 151.325952),
// );

// class MapUiPage extends GoogleMapExampleAppPage {
//   const MapUiPage({Key? key})
//       : super(const Icon(Icons.map), 'User interface', key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MapUiBody();
//   }
// }

// class MapUiBody extends StatefulWidget {
//   const MapUiBody({super.key});

//   @override
//   State<StatefulWidget> createState() => MapUiBodyState();
// }

// class MapUiBodyState extends State<MapUiBody> {
//   MapUiBodyState();

//   static const CameraPosition _kInitialPosition = CameraPosition(
//     target: LatLng(-33.852, 151.211),
//     zoom: 11.0,
//   );

//   CameraPosition _position = _kInitialPosition;
//   bool _isMapCreated = false;
//   final bool _isMoving = false;
//   bool _compassEnabled = true;
//   bool _mapToolbarEnabled = true;
//   CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
//   MinMaxZoomPreference _minMaxZoomPreference = MinMaxZoomPreference.unbounded;
//   MapType _mapType = MapType.normal;
//   bool _rotateGesturesEnabled = true;
//   bool _scrollGesturesEnabled = true;
//   bool _tiltGesturesEnabled = true;
//   bool _zoomControlsEnabled = false;
//   bool _zoomGesturesEnabled = true;
//   bool _indoorViewEnabled = true;
//   bool _myLocationEnabled = true;
//   bool _myTrafficEnabled = false;
//   bool _myLocationButtonEnabled = true;
//   bool _nightMode = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   Widget _compassToggler() {
//     return TextButton(
//       child: Text('${_compassEnabled ? 'disable' : 'enable'} compass'),
//       onPressed: () {
//         setState(() {
//           _compassEnabled = !_compassEnabled;
//         });
//       },
//     );
//   }

//   Widget _mapToolbarToggler() {
//     return TextButton(
//       child: Text('${_mapToolbarEnabled ? 'disable' : 'enable'} map toolbar'),
//       onPressed: () {
//         setState(() {
//           _mapToolbarEnabled = !_mapToolbarEnabled;
//         });
//       },
//     );
//   }

//   Widget _latLngBoundsToggler() {
//     return TextButton(
//       child: Text(
//         _cameraTargetBounds.bounds == null
//             ? 'bound camera target'
//             : 'release camera target',
//       ),
//       onPressed: () {
//         setState(() {
//           _cameraTargetBounds = _cameraTargetBounds.bounds == null
//               ? CameraTargetBounds(sydneyBounds)
//               : CameraTargetBounds.unbounded;
//         });
//       },
//     );
//   }

//   Widget _zoomBoundsToggler() {
//     return TextButton(
//       child: Text(_minMaxZoomPreference.minZoom == null
//           ? 'bound zoom'
//           : 'release zoom'),
//       onPressed: () {
//         setState(() {
//           _minMaxZoomPreference = _minMaxZoomPreference.minZoom == null
//               ? const MinMaxZoomPreference(12.0, 16.0)
//               : MinMaxZoomPreference.unbounded;
//         });
//       },
//     );
//   }

//   Widget _mapTypeCycler() {
//     final MapType nextType =
//         MapType.values[(_mapType.index + 1) % MapType.values.length];
//     return TextButton(
//       child: Text('change map type to $nextType'),
//       onPressed: () {
//         setState(() {
//           _mapType = nextType;
//         });
//       },
//     );
//   }

//   Widget _rotateToggler() {
//     return TextButton(
//       child: Text('${_rotateGesturesEnabled ? 'disable' : 'enable'} rotate'),
//       onPressed: () {
//         setState(() {
//           _rotateGesturesEnabled = !_rotateGesturesEnabled;
//         });
//       },
//     );
//   }

//   Widget _scrollToggler() {
//     return TextButton(
//       child: Text('${_scrollGesturesEnabled ? 'disable' : 'enable'} scroll'),
//       onPressed: () {
//         setState(() {
//           _scrollGesturesEnabled = !_scrollGesturesEnabled;
//         });
//       },
//     );
//   }

//   Widget _tiltToggler() {
//     return TextButton(
//       child: Text('${_tiltGesturesEnabled ? 'disable' : 'enable'} tilt'),
//       onPressed: () {
//         setState(() {
//           _tiltGesturesEnabled = !_tiltGesturesEnabled;
//         });
//       },
//     );
//   }

//   Widget _zoomToggler() {
//     return TextButton(
//       child: Text('${_zoomGesturesEnabled ? 'disable' : 'enable'} zoom'),
//       onPressed: () {
//         setState(() {
//           _zoomGesturesEnabled = !_zoomGesturesEnabled;
//         });
//       },
//     );
//   }

//   Widget _zoomControlsToggler() {
//     return TextButton(
//       child:
//           Text('${_zoomControlsEnabled ? 'disable' : 'enable'} zoom controls'),
//       onPressed: () {
//         setState(() {
//           _zoomControlsEnabled = !_zoomControlsEnabled;
//         });
//       },
//     );
//   }

//   Widget _indoorViewToggler() {
//     return TextButton(
//       child: Text('${_indoorViewEnabled ? 'disable' : 'enable'} indoor'),
//       onPressed: () {
//         setState(() {
//           _indoorViewEnabled = !_indoorViewEnabled;
//         });
//       },
//     );
//   }

//   Widget _myLocationToggler() {
//     return TextButton(
//       child: Text(
//           '${_myLocationEnabled ? 'disable' : 'enable'} my location marker'),
//       onPressed: () {
//         setState(() {
//           _myLocationEnabled = !_myLocationEnabled;
//         });
//       },
//     );
//   }

//   Widget _myLocationButtonToggler() {
//     return TextButton(
//       child: Text(
//           '${_myLocationButtonEnabled ? 'disable' : 'enable'} my location button'),
//       onPressed: () {
//         setState(() {
//           _myLocationButtonEnabled = !_myLocationButtonEnabled;
//         });
//       },
//     );
//   }

//   Widget _myTrafficToggler() {
//     return TextButton(
//       child: Text('${_myTrafficEnabled ? 'disable' : 'enable'} my traffic'),
//       onPressed: () {
//         setState(() {
//           _myTrafficEnabled = !_myTrafficEnabled;
//         });
//       },
//     );
//   }

//   // Should only be called if _isMapCreated is true.
//   Widget _nightModeToggler() {
//     assert(_isMapCreated);
//     return TextButton(
//       child: Text('${_nightMode ? 'disable' : 'enable'} night mode'),
//       onPressed: () async {
//         _nightMode = !_nightMode;
//         setState(() {});
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final GoogleMap googleMap = GoogleMap(
//       onMapCreated: onMapCreated,
//       initialCameraPosition: _kInitialPosition,
//       compassEnabled: _compassEnabled,
//       mapToolbarEnabled: _mapToolbarEnabled,
//       cameraTargetBounds: _cameraTargetBounds,
//       minMaxZoomPreference: _minMaxZoomPreference,
//       mapType: _mapType,
//       rotateGesturesEnabled: _rotateGesturesEnabled,
//       scrollGesturesEnabled: _scrollGesturesEnabled,
//       tiltGesturesEnabled: _tiltGesturesEnabled,
//       zoomGesturesEnabled: _zoomGesturesEnabled,
//       zoomControlsEnabled: _zoomControlsEnabled,
//       indoorViewEnabled: _indoorViewEnabled,
//       myLocationEnabled: _myLocationEnabled,
//       myLocationButtonEnabled: _myLocationButtonEnabled,
//       trafficEnabled: _myTrafficEnabled,
//       onCameraMove: _updateCameraPosition,
//     );

//     final List<Widget> columnChildren = <Widget>[
//       Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Center(
//           child: SizedBox(
//             width: 300.0,
//             height: 200.0,
//             child: googleMap,
//           ),
//         ),
//       ),
//     ];

//     if (_isMapCreated) {
//       columnChildren.add(
//         Expanded(
//           child: ListView(
//             children: <Widget>[
//               Text('camera bearing: ${_position.bearing}'),
//               Text(
//                   'camera target: ${_position.target.latitude.toStringAsFixed(4)},'
//                   '${_position.target.longitude.toStringAsFixed(4)}'),
//               Text('camera zoom: ${_position.zoom}'),
//               Text('camera tilt: ${_position.tilt}'),
//               Text(_isMoving ? '(Camera moving)' : '(Camera idle)'),
//               _compassToggler(),
//               _mapToolbarToggler(),
//               _latLngBoundsToggler(),
//               _mapTypeCycler(),
//               _zoomBoundsToggler(),
//               _rotateToggler(),
//               _scrollToggler(),
//               _tiltToggler(),
//               _zoomToggler(),
//               _zoomControlsToggler(),
//               _indoorViewToggler(),
//               _myLocationToggler(),
//               _myLocationButtonToggler(),
//               _myTrafficToggler(),
//               _nightModeToggler(),
//             ],
//           ),
//         ),
//       );
//     }
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: columnChildren,
//     );
//   }

//   void _updateCameraPosition(CameraPosition position) {
//     setState(() {
//       _position = position;
//     });
//   }

//   void onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _isMapCreated = true;
//     });
//     // Log any style errors to the console for debugging.
//     if (kDebugMode) {
//       // _controller.getStyleError().then((String? error) {
//       //   if (error != null) {
//       //     debugPrint(error);
//       //   }
//       // });
//     }
//   }
// }

// abstract class GoogleMapExampleAppPage extends StatelessWidget {
//   const GoogleMapExampleAppPage(this.leading, this.title, {super.key});

//   final Widget leading;
//   final String title;
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/view/main_home/search_view/annonces/annonces_screen.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: Get.height,
              color: containerColor,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: TextFormField(
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
