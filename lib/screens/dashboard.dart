import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:info/model/getDashboardContent.dart';
import 'package:info/screens/track_vehicle.dart';
import 'package:info/services/ApiProvider.dart';
import 'package:info/utils/app_utils.dart';
import 'package:info/utils/colors.dart';
import 'package:info/utils/shared_preff.dart';
import 'package:info/utils/strings.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  ApiProvider apiProvider = ApiProvider();
  bool isProfilePic = false;
  String userName = "",
      mobileNo = "",
      strVehicleModel = "",
      strMake = "",
      strVehiclePic = "",
      strPrefPolicyPic = "",
      strPrefExpiryDate = "",
      strPolicyNo = "",
      strLastPremium = "",  strDistance = "",profileUrl = "", strDuration = "", strTotalTrips = "", haCount = "", hbCount = "", htCount  = "", avgSafetyScore = "0", avgLastSafetyScore = "0", dayDriveCount = "", nightDriveCount = "";

  @override
  void initState() {
    // TODO: implement initState
    updateAppBar();
    funGetSharedPrefVal();
    Future.delayed(Duration.zero, () async {
      funGetDashboardContent();
    });
    super.initState();
  }

  void funGetSharedPrefVal() async {
    userName =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefUserName);
    mobileNo =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefMobileNo);
    profileUrl =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefProfileUrl);
    strVehicleModel = await StorageUtil.instance
        .getStringValue(AppStrings.strPrefVehicleModel);
    strMake = await StorageUtil.instance.getStringValue(AppStrings.strPrefMake);
    strVehiclePic =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefVehiclePic);
    strPrefPolicyPic =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefPolicyPic);
    strLastPremium =
        await StorageUtil.instance.getStringValue(AppStrings.strLastPremium);
    strPolicyNo =
        await StorageUtil.instance.getStringValue(AppStrings.strPolicyNo);
    strPrefExpiryDate =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefExpiryDate);
    setState(() {
      isProfilePic = true;
      userName = userName;
      mobileNo = mobileNo;
      profileUrl = profileUrl;
      strVehicleModel = strVehicleModel;
      strMake = strMake;
      strVehiclePic = strVehiclePic;
      strPrefPolicyPic = strPrefPolicyPic;
      strLastPremium = strLastPremium;
      strPolicyNo = strPolicyNo;
      strPrefExpiryDate = strPrefExpiryDate;
    });
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
    Widget moderateScoreWidget = CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 6.0,
      percent: int.parse(avgSafetyScore) / 100,
      center: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            avgSafetyScore,
            style:const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
           Text( AppStrings.txtModerateScore,
              style:const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 14)),
          RatingBar.builder(
            initialRating: 4,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 15,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
              size: 10,
            ),
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
      progressColor: AppColors.goldColor1,
    );

    Widget excScoreWidget = CircularPercentIndicator(
      radius: 120.0,
      lineWidth: 6.0,
      percent: int.parse(avgLastSafetyScore) / 100,
      center: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            avgLastSafetyScore,
            style:const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
           Text(AppStrings.txtExcellentScore,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 14)),
          RatingBar.builder(
            initialRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 20,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
              size: 10,
            ),
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
      progressColor: AppColors.greenClr,
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: AppColors.whiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.appSubColor,
                  ),
                ),
                title: ListTile(
                  leading:isProfilePic? CircleAvatar(
                    backgroundImage: NetworkImage(profileUrl),
                  ):const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user-icon.png"),
                  ),
                  title:  Text(
                    AppStrings.txtPolicyHolder,
                    style: const TextStyle(
                        color: AppColors.appSubColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal),
                  ),
                  subtitle: Text(
                    userName,
                    style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  trailing:  Text(
                    AppStrings.txtSos,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: AppColors.appSubColor,
                child:  Padding(
                  padding:const EdgeInsets.all(12.0),
                  child: Text(
                    AppStrings.txtPolicyDet,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      strVehicleModel,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            AppStrings.txtPolicyNo,
                            style:const TextStyle(
                                color: AppColors.appSubColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal),
                          ),
                          Text(
                            strPolicyNo,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal),
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        color: AppColors.blackColor,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            AppStrings.txtLastPremium,
                            style:const TextStyle(
                                color: AppColors.appSubColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal),
                          ),
                          Text(
                            strLastPremium,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal),
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        color: AppColors.blackColor,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            AppStrings.txtExpirationDate,
                            style: const TextStyle(
                                color: AppColors.appSubColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal),
                          ),
                          Text(
                            strPrefExpiryDate,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Container(
                    width: 60.0,
                    height: 100.0,
                    margin: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: NetworkImage(strVehiclePic, scale: 2),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: AppColors.appSubColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  title:  Text(
                    AppStrings.txtRegistrationNo,
                    style: const TextStyle(
                        color: AppColors.appSubColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal),
                  ),
                  subtitle: Text(
                    strMake,
                    style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  trailing: SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor: AppColors.bottomBackgroundColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TrackVehicle()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            AppStrings.strBtnViewDet,
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: AppColors.whiteColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: AppColors.appSubColor,
                child:  Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    AppStrings.txtTripDetails,
                    style:const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 140,
                          width: 120,
                          decoration: const BoxDecoration(
                            color: AppColors.appPrimaryColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 2),
                                color: AppColors.appSubColor,
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.calendar_month,
                                    color: AppColors.whiteColor,
                                    size: 40,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  Text(
                                    AppStrings.txtWeekly,
                                    style:const TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 0.3,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppStrings.txtMonthly,
                                    style: TextStyle(
                                        color: AppColors.whiteColor
                                            .withOpacity(0.5),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 0.3,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children:  [
                            const Icon(
                              Icons.calendar_month,
                              color: AppColors.appSubColor,
                            ),
                            Text(
                              AppStrings.txtDriverPerformance,
                              style:const TextStyle(
                                  color: AppColors.appSubColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.3),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              "1 JAN -  7 Jan 2020",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.3),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  moderateScoreWidget,
                  const SizedBox(
                    width: 5,
                  ),
                  excScoreWidget,
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 5, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: AppColors.bottomBackgroundColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TrackVehicle()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              AppStrings.strBtnViewDet,
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_drop_up_outlined,
                              color: AppColors.whiteColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 5, bottom: 0),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: const BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: AppColors.greyColor,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children:  [
                                    /*Image.asset("assets/images/car.png", scale: 15, color: AppColors.appSubColor,),*/
                                    const Icon(
                                      Icons.car_rental_outlined,
                                      color: AppColors.appSubColor,
                                    ),
                                    Text(
                                      AppStrings.txtTrips,
                                      style:const TextStyle(
                                          color: AppColors.appSubColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children:  [
                                    const Icon(
                                      Icons.route,
                                      color: AppColors.appSubColor,
                                    ),
                                    Text(
                                      AppStrings.txtDistance,
                                      style: const TextStyle(
                                          color: AppColors.appSubColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children:  [
                                    const  Icon(
                                      Icons.av_timer_outlined,
                                      color: AppColors.appSubColor,
                                    ),
                                    Text(
                                      AppStrings.txtDuration,
                                      style: const TextStyle(
                                          color: AppColors.appSubColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                             Text(
                                              strTotalTrips,
                                              style: const TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Image.asset(
                                              "assets/images/arrow_up.png",
                                              scale: 15,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.sunny,
                                                color: AppColors.goldColor1,
                                                size: 15),
                                             Text(
                                              dayDriveCount,
                                              style: const TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Image.asset(
                                              "assets/images/arrow_down.png",
                                              scale: 23,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.brightness_3,
                                              color: AppColors.goldColor1,
                                              size: 15,
                                            ),
                                             Text(
                                              nightDriveCount,
                                              style:const TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Image.asset(
                                              "assets/images/arrow_up.png",
                                              scale: 20,
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                           TextSpan(
                                            text: strDistance,
                                            style: const TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          WidgetSpan(
                                            child: Transform.translate(
                                              offset: const Offset(0.0, 1.0),
                                              child: const Text(
                                                'KM',
                                                style: TextStyle(fontSize: 13),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/arrow_down.png",
                                      scale: 23,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                           TextSpan(
                                            text: strDuration,
                                            style: const TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          WidgetSpan(
                                            child: Transform.translate(
                                              offset: const Offset(0.0, 1.0),
                                              child: const Text(
                                                'HR',
                                                style: TextStyle(fontSize: 13),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/arrow_down.png",
                                      scale: 23,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <LineSeries<SalesData, String>>[
                            LineSeries<SalesData, String>(
                                dataSource: <SalesData>[
                                  SalesData('1 Jan', 81),
                                  SalesData('2 Jan', 61),
                                  SalesData('3 Jan', 10),
                                  SalesData('4 Jan', 55),
                                  SalesData('5 Jan', 73),
                                  SalesData('6 Jan', 85),
                                  SalesData('7 Jan', 95),
                                ],
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales,
                                isVisible: true,
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true))
                          ]),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 180,
                    decoration: const BoxDecoration(
                      color: AppColors.greyColor,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: AppColors.greyColor,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text(
                                AppStrings.txtHarshAcceleration,
                                style: const TextStyle(
                                    color: AppColors.appSubColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.car_rental_rounded, color: AppColors.appSubColor,),
                              const SizedBox(width: 5,),
                                Text(
                                haCount,
                                style:const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Image.asset(
                                "assets/images/arrow_up.png",
                                scale: 15,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: const BoxDecoration(
                      color: AppColors.greyColor,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: AppColors.greyColor,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text(
                                AppStrings.txtHarshBreaking,
                                style: const TextStyle(
                                    color: AppColors.appSubColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.bike_scooter_outlined, color: AppColors.appSubColor,),
                              const SizedBox(width: 5,),
                               Text(
                                hbCount,
                                style: const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Image.asset(
                                "assets/images/arrow_down.png",
                                scale: 15,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    decoration: const BoxDecoration(
                      color: AppColors.greyColor,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: AppColors.greyColor,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text(
                                AppStrings.txtHarshTurn,
                                style: const TextStyle(
                                    color: AppColors.appSubColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.turn_right, color: AppColors.appSubColor,),
                              const SizedBox(width: 5,),
                               Text(
                                htCount,
                                style:const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Image.asset(
                                "assets/images/arrow_up.png",
                                scale: 15,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void funGetDashboardContent() async {
    AppUtils().showProgressDialog(context);
    await apiProvider.getDashboardContent().then((GetDashboardContent response) {
      if(response.status == "200"){
        AppUtils().hideDialog(context);
        setState(() {
          strTotalTrips = response.tripsCount.toString();
          strDistance = response.distance.toString();
          strDuration = response.duration.toString();
          haCount = response.haCount.toString();
          hbCount = response.hbCount.toString();
          htCount = response.htCount.toString();
          avgLastSafetyScore = response.avgLastSafetyScore.toString();
          avgSafetyScore = response.avgSafetyScore.toString();
          dayDriveCount = response.dayDriveCount.toString();
          nightDriveCount = response.nightDriveCount.toString();
        });
      }else{
        AppUtils().hideDialog(context);
        AppUtils().showErrorToastMsg(response.statusMessage.toString());
      }
    });
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
