// // ignore_for_file: use_build_context_synchronously

// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:placealouer/constant/app_colors.dart';
// import 'package:placealouer/model/login_model.dart';
// import 'package:placealouer/model/signup_model.dart';
// import 'package:placealouer/utils/app_constants.dart';
// import 'package:placealouer/utils/common_methods.dart';
// import 'package:placealouer/utils/network_dio/network_dio.dart';

// NetworkRepository networkRepository = NetworkRepository();

// class NetworkRepository {
//   static final NetworkRepository _networkRepository =
//       NetworkRepository._internal();

//   factory NetworkRepository() {
//     return _networkRepository;
//   }

//   NetworkRepository._internal();

//   ///Authentication
//   Future<LoginModel> userLogin(context, authUserData) async {
//     try {
//       final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
//         context: context,
//         url: AppConstants.apiEndPoint + AppConstants.login,
//         data: authUserData,
//       );
//       return LoginModel.fromJson(
//         authUserResponse['body']
//           ..addAll(
//             {
//               "statusCode": authUserResponse["statusCode"],
//             },
//           ),
//       );
//     } catch (e) {
//       log("message--$e");
//       CommonMethod().getXSnackBar("Error", e.toString(), redContainerColor);
//       rethrow;
//     }
//   }

//   Future<SignupModel> userSignUp(context, authUserData) async {
//     try {
//       final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
//         context: context,
//         url: AppConstants.apiEndPoint + AppConstants.signup,
//         data: authUserData,
//       );
//       return SignupModel.fromJson(authUserResponse);
//     } catch (e) {
//       CommonMethod().getXSnackBar("Error", e.toString(), redContainerColor);

//       rethrow;
//     }
//   }

//   Future forgotrPassword(context, authUserData) async {
//     try {
//       final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
//         context: context,
//         url: AppConstants.apiEndPoint + AppConstants.forgot,
//         data: authUserData,
//       );
//       log("---->>> Forgot Password $authUserResponse");
//       return authUserResponse;
//     } catch (e) {
//       CommonMethod().getXSnackBar("Error", e.toString(), redContainerColor);

//       rethrow;
//     }
//   }

//   Future otpVerification(context, authUserData) async {
//     try {
//       final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
//         context: context,
//         url: AppConstants.apiEndPoint + AppConstants.otpVerification,
//         data: authUserData,
//       );
//       log("---->>> Forgot Password $authUserResponse");
//       return authUserResponse;
//     } catch (e) {
//       CommonMethod().getXSnackBar("Error", e.toString(), redContainerColor);

//       rethrow;
//     }
//   }

//   Future signupVerification(context, authUserData) async {
//     try {
//       final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
//         context: context,
//         url: AppConstants.apiEndPoint + AppConstants.signupVerification,
//         data: authUserData,
//       );
//       log("---->>> Forgot Password $authUserResponse");
//       return authUserResponse;
//     } catch (e) {
//       CommonMethod().getXSnackBar("Error", e.toString(), redContainerColor);

//       rethrow;
//     }
//   }

//   Future getParkings(context, pageData) async {
//     try {
//       final getParkingsResponse = await NetworkDioHttp.postDioHttpMethod(
//         context: context,
//         url: AppConstants.apiEndPoint + AppConstants.getParkings,
//         data: pageData,
//         header: Options(
//           method: 'POST',
//           headers: {
//             'Authorization':
//                 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjFiZWFlMjFlZmRmNjViY2NiZDA2ZjEiLCJmaXJzdE5hbWUiOiJyaWRkaGkiLCJsYXN0TmFtZSI6InlvcG1haWwiLCJlbWFpbCI6InJpZGRoaUB5b3BtYWlsLmNvbSIsInJvbGUiOjIsImV4cCI6MTcxNTA4MDQwOTkyMSwiZ2VuZXJhdGVkT24iOjE3MTQ5OTQwMDk5MjEsImlhdCI6MTcxNDk5NDAwOX0.Kro76lD0QjA-gC7ech8v6_NVlG3ecHEe5KPOApbfL28',
//             'Content-Type': 'application/json'
//           },
//         ),
//       );
//       log("---->>> getParkingsResponse $getParkingsResponse");
//       return getParkingsResponse;
//     } catch (e, st) {
//       log("--->>> $st");
//       CommonMethod().getXSnackBar("Error", e.toString(), redContainerColor);

//       rethrow;
//     }
//   }

//   Future resetPassword(context, authUserData) async {
//     try {
//       final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
//         context: context,
//         url: AppConstants.apiEndPoint + AppConstants.resetPassword,
//         data: authUserData,
//       );
//       log("---->>> Forgot Password $authUserResponse");
//       return authUserResponse;
//     } catch (e) {
//       CommonMethod().getXSnackBar("Error", e.toString(), redContainerColor);

//       rethrow;
//     }
//   }
// }

// Future<void> checkResponse(response, modelResponse) async {
//   if (response["error"] == null || response["error"] == 'null') {
//     if (response['body']['status'] == 200 ||
//         response['body']['status'] == "200") {
//       return modelResponse;
//     } else if (response['body']['status'] == 400 ||
//         response['body']['status'] == "400") {
//       return response['body'];
//     } else if (response['body']['status'] == 403 ||
//         response['body']['status'] == "403") {
//       return response['body'];
//     } else if (response['body']['status'] == 500 ||
//         response['body']['status'] == "500") {
//       return modelResponse;
//     } else {
//       showErrorDialog(message: response['body']['message']);
//     }
//   } else {
//     if (response['body']['status'] == 401 ||
//         response['body']['status'] == '401') {
//       showErrorDialog(message: response['body']['message']);
//       // Future.delayed(const Duration(seconds: 2), () {
//       //   Get.to(const LoginScreen());
//       // });
//     } else {
//       showErrorDialog(message: response['body']['message']);
//     }
//   }
// }

// Future<void> checkResponse2(
//     {BuildContext? context, response, Duration? duration}) async {
//   if (response["error_description"] == null ||
//       response["error_description"] == 'null') {
//     if (response['body']['status'] == 200 ||
//         response['body']['status'] == "200") {
//       return response['body'];
//     } else if (response['body']['status'] == 400 ||
//         response['body']['status'] == "400") {
//       return response['body'];
//     } else if (response['body']['status'] == 403 ||
//         response['body']['status'] == "403") {
//       showErrorDialog(message: response['body']['message']);
//       return response['body'];
//     } else if (response['body']['status'] == 500 ||
//         response['body']['status'] == "500") {
//       showErrorDialog(message: response['body']['message']);
//       return response['body'];
//     } else {
//       showErrorDialog(message: response['body']['message']);
//     }
//   } else {
//     if (response['error_description'] != null) {
//       if (context != null) {
//         showErrorDialog(
//             message: response['error_description'], duration: duration);
//       }
//     } else if (response['error'] != null) {
//       showErrorDialog(message: response['error']);
//     } else {
//       showErrorDialog(message: response['body']['message']);
//     }
//   }
// }

// // Future uploadImage({context, selectedImage, uploadType}) async {
// //   String url = '${AppConstants.apiEndPoint}/upload/compress/$uploadType';
// //   var request = http.MultipartRequest(
// //     "POST",
// //     Uri.parse(url),
// //   );
// //   final token = await NetworkDioHttp.getHeaders();
// //   request.headers.addAll(token);
// //   request.files.add(
// //       await http.MultipartFile.fromPath("image", selectedImage.toString()));
// //   if (context != null) Circle().show(context);
// //   var response = await request.send();
// //   var responseData = await response.stream.toBytes();
// //   var responseString = String.fromCharCodes(responseData);
// //   var parsedJson = await json.decode(responseString);
// //   if (context != null) Circle().hide(context);
// //   if (response.statusCode == 200) {
// //   } else {
// //     return '';
// //   }
// // }

// void showErrorDialog({required String message, Duration? duration}) {
//   if (message == "We can't find tokens in header!") {
//     return;
//   }
//   // CommonMethod().getXSnackBar("Error", message.toString(), red, duration: duration);
// }
