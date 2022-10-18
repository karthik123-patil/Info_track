import 'package:flutter/material.dart';
import 'package:info/model/login.dart';
import 'package:info/screens/dashboard.dart';
import 'package:info/services/ApiProvider.dart';
import 'package:info/utils/app_utils.dart';
import 'package:info/utils/colors.dart';
import 'package:info/utils/shared_preff.dart';
import 'package:info/utils/strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  ApiProvider apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appSubColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.40,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  children: const [
                    Expanded(
                        child: Align(
                      alignment: Alignment(0, 0.1),
                      child: Text(
                        AppStrings.strInfoAssure,
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.2),
                        textAlign: TextAlign.center,
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
          // second section
          FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.65,
              child: Container(
                // all container
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            AppStrings.strLogin,
                            style: TextStyle(
                                color: AppColors.lightBlackColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            AppStrings.strMobileNo,
                            style: TextStyle(
                                color: AppColors.lightBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autofocus: true,
                        controller: mobileNoController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: AppColors.lightBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            AppStrings.strPin,
                            style: TextStyle(
                                color: AppColors.lightBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 100),
                        child: PinCodeTextField(
                          appContext: context,
                          length: 4,
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length != 4) {
                              return "Enter valid pin";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          //errorAnimationController: errorController,
                          controller: pinController,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            debugPrint("Completed");
                          },
                          onChanged: (value) {
                            setState(() {});
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            return true;
                          },
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.appSubColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        onPressed: () {
                          funLogin();
                        },
                        child: const Text(
                          AppStrings.strBtnLogin,
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                AppStrings.strFirstUser,
                                style: TextStyle(
                                    color: AppColors.lightBlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                AppStrings.strForgot,
                                style: TextStyle(
                                    color: AppColors.appSubColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                AppStrings.strPoweredBy,
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/images/app_logo.png",
                                  scale: 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void funLogin() async {
    if (mobileNoController.text.isEmpty) {
      AppUtils().showErrorToastMsg(AppStrings.strErrEptMobile);
    } else if (mobileNoController.text.length != 10) {
      AppUtils().showErrorToastMsg(AppStrings.strErrTenDigit);
    } else if (pinController.text.isEmpty) {
      AppUtils().showErrorToastMsg(AppStrings.strErrPin);
    } else {
      AppUtils().showProgressDialog(context);
      await apiProvider
          .login(mobileNoController.text, pinController.text)
          .then((Login response) {
        if (response.status == "200") {
          AppUtils().hideDialog(context);
          StorageUtil.instance.setStringValue(AppStrings.strPrefUserName, response.userName.toString());
          StorageUtil.instance.setStringValue(AppStrings.strPrefAuthToken, response.authToken.toString());
          StorageUtil.instance.setStringValue(AppStrings.strPrefMobileNo, response.mobileNumber.toString());
          StorageUtil.instance.setStringValue(AppStrings.strPrefProfileUrl, response.profilePicUrl.toString());
          for(int i=0; i < response.policyDetails!.length; i++) {
            StorageUtil.instance.setStringValue(AppStrings.strPrefVehicleId, response.policyDetails![i].vehicleId.toString());
            StorageUtil.instance.setStringValue(AppStrings.strPrefVehicleNo, response.policyDetails![i].vehicleNo.toString());
            StorageUtil.instance.setStringValue(AppStrings.strPrefMake, response.policyDetails![i].make.toString());
            StorageUtil.instance.setStringValue(AppStrings.strPrefVehicleModel, response.policyDetails![i].model.toString());
            StorageUtil.instance.setStringValue(AppStrings.strPrefVehiclePic, response.policyDetails![i].vehicleProfilePicUrl.toString());
            StorageUtil.instance.setStringValue(AppStrings.strPrefPolicyPic, response.policyDetails![i].policyDocImageUrl.toString());
            StorageUtil.instance.setStringValue(AppStrings.strPrefExpiryDate, response.policyDetails![i].policyExpiryDate.toString());
            StorageUtil.instance.setStringValue(AppStrings.strPolicyNo, response.policyDetails![i].policyNumber.toString());
            StorageUtil.instance.setStringValue(AppStrings.strLastPremium, response.policyDetails![i].totalpremium.toString());
          }
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DashboardScreen()));
        } else {
          AppUtils().hideDialog(context);
          AppUtils().showErrorToastMsg(response.statusMessage.toString());
        }
      });
    }
  }
}
