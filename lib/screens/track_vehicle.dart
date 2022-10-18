import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:info/model/getCurrentLocation.dart';
import 'package:info/services/ApiProvider.dart';
import 'package:info/utils/colors.dart';
import 'package:info/utils/shared_preff.dart';
import 'package:info/utils/strings.dart';
import 'package:skeletons/skeletons.dart';

import '../utils/location_service.dart';

const kGoogleApiKey = AppStrings.googleMapKey;
const double cameraZoom = 16;
const double cameraTilt = 20;
const double cameraBearing = 10;

class TrackVehicle extends StatefulWidget {
  const TrackVehicle({Key? key}) : super(key: key);

  @override
  State<TrackVehicle> createState() => _TrackVehicleState();
}

class _TrackVehicleState extends State<TrackVehicle> {
  ApiProvider apiProvider = ApiProvider();
  late GoogleMapController _controller;
  LatLng? markerPos;
  LatLng? initPos;
  bool loadingMap = false;
  bool init = true;
  bool loadingAddressDetails = false;
  String addressTitle = '';
  String locality = '';
  String city = '';
  String state = '';
  String pincode = '', Address = "", strVehicleNo = "";
  MarkerId markerId = const MarkerId("YOUR-MARKER-ID");
  StreamController<LatLng> streamController = StreamController();
  final bool _enabled = false;
  CameraPosition? cameraPosition;

  void getLocation() async {
    strVehicleNo =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefVehicleNo);
    await apiProvider.getCurrentLocation().then((GetCurrentLocation res) async {
      if (res.status == "200") {
        initPos = LatLng(
            double.parse(res.lat.toString()), double.parse(res.lon.toString()));
        streamController.add(initPos as LatLng);
        setState(() {
          loadingMap = false;
          Address = res.location.toString();
        });
      } else {
        final service = LocationService();
        final position = await service.getUserPosition();
        initPos = LatLng(position.latitude, position.longitude);
        streamController.add(initPos as LatLng);
        setState(() {
          loadingMap = false;
          Address = res.location.toString();
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    loadingMap = true;
    getLocation();
    updateAppBar();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    streamController.close();
  }

  renderMap() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: (loadingMap)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              buildingsEnabled: true,
              indoorViewEnabled: false,
              onMapCreated: (controller) {
                _controller = controller;
              },
              onCameraMove: (CameraPosition pos) {
                streamController.add(pos.target);
                cameraPosition = pos;
              },
              onCameraIdle: () async {},
              initialCameraPosition: CameraPosition(
                target: initPos!,
                zoom: 16.4746,
              ),
              mapType: MapType.normal,
            ),
    );
  }

  void updateAppBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.appSubColor,
        systemNavigationBarColor: AppColors.appSubColor,
        systemNavigationBarIconBrightness: Brightness.light
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appSubColor,
          automaticallyImplyLeading: true,
          title: Text(
            strVehicleNo,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal),
          ),
        ),
        body: SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              renderMap(),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      boxShadow:  [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.grey,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        strVehicleNo,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.29,
                  child: Image.asset(
                    'assets/images/marker.png',
                    height: 30,
                    fit: BoxFit.cover,
                  )),
            ],
          ),
        ),
        bottomNavigationBar: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            height: 200,
            decoration: const BoxDecoration(
              color: AppColors.textColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2), topLeft: Radius.circular(2)),
            ),
            child: _enabled
                ? Center(
                    child: Skeleton(
                      duration: const Duration(milliseconds: 200),
                      shimmerGradient: const LinearGradient(
                        colors: [
                          Color(0xFFD8E3E7),
                          Color(0xFFC8D5DA),
                          Color(0xFFD8E3E7),
                        ],
                        stops: [
                          0.1,
                          0.5,
                          0.9,
                        ],
                      ),
                      darkShimmerGradient: const LinearGradient(
                        colors: [
                          Color(0xFF222222),
                          Color(0xFF242424),
                        ],
                        stops: [
                          0.0,
                          0.2,
                        ],
                        begin: Alignment(-2.4, -0.2),
                        end: Alignment(2.4, 0.2),
                        tileMode: TileMode.clamp,
                      ),
                      isLoading: _enabled,
                      skeleton: SkeletonListView(
                        itemCount: 1,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 8),
                              Expanded(
                                child: SkeletonParagraph(
                                  style: SkeletonParagraphStyle(
                                      lines: 1,
                                      spacing: 6,
                                      lineStyle: SkeletonLineStyle(
                                        height: 10,
                                        borderRadius: BorderRadius.circular(8),
                                        minLength:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        maxLength:
                                            MediaQuery.of(context).size.width /
                                                2,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Current Location",
                                  style: TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 250,
                                  child: StreamBuilder<LatLng>(
                                    stream: streamController.stream,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        //_updatePosition(snapshot.data!.latitude, snapshot.data!.longitude);
                                        return Text(
                                          Address,
                                          style: const TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.2,
                                              fontFamily: "Poppins",
                                              fontStyle: FontStyle.normal),
                                        );
                                      } else {
                                        return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              SizedBox(
                                                height: 10,
                                                width: 10,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: AppColors.whiteColor,
                                                  strokeWidth: 2.0,
                                                ),
                                              ),
                                            ]);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  /*void updatePinOnMap(String lat, String lng) async {
    CameraPosition cPosition = CameraPosition(
      zoom: cameraZoom,
      tilt: cameraTilt,
      bearing: cameraBearing,
      target: LatLng(double.parse(lat), double.parse(lng)),
    );
    _controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
  }*/
}
