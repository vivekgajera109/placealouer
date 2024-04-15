import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';

import '../constant/app_style.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split('_')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class CommonMethod {
  String amountDisplay(String number) {
    String amount = '';
    if (int.parse(number) >= 1000000000) {
      amount = '${(int.parse(number) / 1000000000).toStringAsFixed(1)} b';
      // return '${(int.parse(amount) / 1000000000).toStringAsFixed(1)} bil';
    } else if (int.parse(number) >= 1000000) {
      amount = '${(int.parse(number) / 1000000).toStringAsFixed(1)} m';
      // return '${(int.parse(amount) / 1000000).toStringAsFixed(1)} mil';
    } else if (int.parse(number) >= 1000) {
      amount = '${(int.parse(number) / 1000).toStringAsFixed(1)} k';
      // return '${(int.parse(amount) / 1000).toStringAsFixed(1)} k';
    } else {
      // return number.toString();
      amount = number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    }

    return amount;
  }

  String insertSubstring(
    String original,
    String toInsert,
  ) {
    List dd = original.split("/");
    for (int i = 0; i < dd.length; i++) {
      if ((dd.length - 1) == i) {
        if (toInsert == "thumbnail_") {
          var rDJ = dd[i].substring(0, 0) + toInsert + dd[i].substring(0);
          dd[i] = rDJ.toString().replaceAll('.mp4', '.png');
          // log("thumbnail to insert --> $modifiedString");
        } else {
          dd[i] = dd[i].substring(0, 0) + toInsert + dd[i].substring(0);
        }
      }
    }

    // log("final string --->${ApiAppConstants.imageDisplayBaseUrl}${dd.join("/")}");
    // log("final string --->${dd.join("/")}");
    String modifiedString = dd.join("/");

    return modifiedString;
  }

  void showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void getXSnackBar(String title, String message, Color? color) {
    Get.snackbar(
      title,
      message,
      backgroundColor: color,
      colorText: appWhiteColor,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      barBlur: 10,
    );
  }

  String getTenancyStatus(int code) {
    String status = '';
    switch (code) {
      case 0:
        status = 'Booked';
        break;
      case 1:
        status = 'Active';
        break;
      case 2:
        status = 'Expiring';
        break;
      case 3:
        status = 'Ended';
        break;
      case 4:
        status = 'Renewed';
        break;
      case 5:
        status = 'Terminated';
        break;
    }
    return status;
  }

  String getFileExtensionUsingImage(String code) {
    String img = '';
    switch (code) {
      case 'pdf':
        img = 'assets/png/icons/ic_pdf.png';
        break;
      case 'jpg':
        img = 'assets/png/icons/ic_jpg.png';
        break;
      case 'png':
        img = 'assets/png/icons/ic_jpg.png';
        break;
      case 'doc':
        img = 'assets/png/icons/ic_doc.png';
        break;
      case 'csv':
        img = 'assets/png/icons/ic_csv.png';
        break;
    }
    return img;
  }

  /// get request move in - out
  String getTenantMoveStatus(int code) {
    String status = '';
    switch (code) {
      case 0:
        status = 'Requested';
        break;
      case 1:
        status = 'Approved';
        break;
      case 2:
        status = 'Approved (Rescheduled)';
        break;
      case 3:
        status = 'Rejected';
        break;
      case 4:
        status = 'Cancelled';
        break;
    }
    return status;
  }

  // tenancy payment status
  String getTenancyPaymentMethod(int code) {
    String status = '';
    switch (code) {
      case 0:
        status = 'Card';
        break;
      case 1:
        status = 'Cheque';
        break;
      case 2:
        status = 'Bank Transfer';
        break;
      case 3:
        status = 'Cash';
        break;
    }
    return status;
  }

  // tenancy payment icon
  String getTenancyPaymentMethodIcon(int code) {
    String status = '';
    switch (code) {
      case 0:
        status = 'assets/png/images/ic_credit_card.png';
        break;
      case 1:
        status = 'assets/png/images/ic_cheque.png';
        break;
      case 2:
        status = 'assets/png/images/ic_bank.png';
        break;
      case 3:
        status = 'assets/png/images/ic_cash.png';
        break;
    }
    return status;
  }

  // tenancy payment rent status
  String getTenancyPaymentRentType(int code) {
    String status = '';
    switch (code) {
      case 0:
        status = 'Rent';
        break;
      case 1:
        status = 'Security Deposit';
        break;
      case 2:
        status = 'Booking';
        break;
      case 3:
        status = 'Other';
        break;
    }
    return status;
  }

  // tenancy payment status
  String getTenancyPaymentStatus(int code) {
    String status = '';
    switch (code) {
      case 0:
        status = 'Upcoming';
        break;
      case 1:
        status = 'Paid';
        break;
      case 2:
        status = 'Overdue';
        break;
      case 3:
        status = 'PartiallyPaid';
        break;
    }
    return status;
  }

  // tenancy payment status
  String getPaymentStatus(int code) {
    String status = '';
    switch (code) {
      case 0:
        status = 'UnPaid';
        break;
      case 1:
        status = 'Paid';
        break;
      case 2:
        status = 'PartiallyPaid';
        break;
    }
    return status;
  }

  Color getTenantMoveStatusColor(int code) {
    Color? textColor;
    switch (code) {
      case 0:
        textColor = Colors.orange;
        break;
      case 1:
        textColor = Colors.green;
        break;
      case 2:
        textColor = Colors.green;
        break;
      case 3:
        textColor = Colors.red;
        break;
      case 4:
        textColor = Colors.grey;
        break;
    }
    return textColor!;
  }

  /// get maintenance color
  Color getMaintenanceStatusColor(int code) {
    Color? textColor;
    switch (code) {
      case 0:
        textColor = Colors.orange;
        break;
      case 1:
        textColor = Colors.green;
        break;
      case 2:
        textColor = Colors.red;
        break;
      case 3:
        textColor = Colors.grey;
        break;
    }
    return textColor!;
  }

  /// get tenancy renewal request status
  String getTenancyRenewalStatus(int code) {
    String status = '';
    // Request 0
    // Reject 3
    // Renewal submitted 1
    // Tenant cancelled 4
    // tenant_approved 2
    // tenant_rejected 5
    switch (code) {
      case 0:
        status = 'Requested';
        break;
      case 1:
        status = 'Renewal Submitted';
        break;
      case 2:
        status = 'Tenant Approved';
        break;
      case 3:
        status = 'Reject';
        break;
      case 4:
        status = 'Tenant Cancelled';
        break;
      case 5:
        status = 'Tenant Rejected';
        break;
    }
    return status;
  }

  /// get tenancy complain status
  String getGeneralComplainStatus(int code) {
    String status = '';
    switch (code) {
      case 0:
        status = 'Requested';
        break;
      case 1:
        status = 'In Progress';
        break;
      case 2:
        status = 'Resolved';
        break;
    }
    return status;
  }

  /// get tenancy Maintenance status
  String getMaintenanceStatus(int code) {
    String status = '';
    switch (code) {
      case 0:
        status = 'Requested';
        break;
      case 1:
        status = 'In Progress';
        break;
      case 2:
        status = 'Complete';
        break;
      case 4:
        status = 'Cancelled';
        break;
    }
    return status;
  }

  /// get corprorate Maintenance status
  String getCorprorateMaintenanceStatus(int code) {
    String status = '';
    switch (code) {
      case 0:
        status = 'Received';
        break;
      case 1:
        status = 'In Progress';
        break;
      case 2:
        status = 'Complete';
        break;
      case 4:
        status = 'Cancelled';
        break;
    }
    return status;
  }

  /// get tenancy termination request status
  String getTenancyTerminationStatus(int code) {
    String status = '';
    // Request 0
    // Rejected 3
    // Termination submitted 1
    // Tenant cancelled 4
    // tenant_approved 2
    // tenant_rejected 5
    switch (code) {
      case 0:
        status = 'Requested';
        break;
      case 1:
        status = 'Termination Submitted';
        break;
      case 2:
        status = 'Tenant Approved';
        break;
      case 3:
        status = 'Rejected';
        break;
      case 4:
        status = 'Tenant Cancelled';
        break;
      case 5:
        status = 'Tenant Rejected';
        break;
    }
    return status;
  }

  // request according status return
  String getRequestAccordingStatus(int requestCode, int requestStatus) {
    String status = '';
    switch (requestCode) {
      case 0:
        status = getTenantMoveStatus(requestStatus);
        break;
      case 1:
        status = getTenantMoveStatus(requestStatus);
        break;
      case 2:
        status = getTenancyRenewalStatus(requestStatus);
        break;
      case 3:
        status = getTenancyTerminationStatus(requestStatus);
        break;
      case 4:
        status = getGeneralComplainStatus(requestStatus);
        break;
      case 5:
        status = getGeneralComplainStatus(requestStatus);
        break;
      case 6:
        status = getMaintenanceStatus(requestStatus);
        break;
      case 7:
        status = getMaintenanceStatus(requestStatus);
        break;
    }
    return status;
  }

  String getUnitTypeIcon(String type) {
    String status = '';
    switch (type) {
      case 'building':
        status = 'assets/svg/icons/ic_building.svg';
        break;
      case 'apartment':
        status = 'assets/svg/icons/ic_apartment.svg';
        break;
      case 'penthouse':
        status = 'assets/svg/icons/ic_pent_house.svg';
        break;
      case 'common_area':
        status = 'assets/svg/icons/ic_common_area.svg';
        break;
      case 'town_house':
        status = 'assets/svg/icons/ic_town_house.svg';
        break;
      case 'villa':
        status = 'assets/svg/icons/ic_villa.svg';
        break;
      case 'other':
        status = 'assets/svg/icons/ic_villa.svg';
        break;
      default:
        status = 'assets/svg/icons/ic_other.svg';
        break;
    }
    return status;
  }

  String getUnitTypeWhiteIcon(String type) {
    String status = '';
    switch (type) {
      case 'building':
        status = 'assets/svg/icons/ic_building_white.svg';
        break;
      case 'apartment':
        status = 'assets/svg/icons/ic_building_white.svg';
        break;
      case 'penthouse':
        status = 'assets/svg/icons/ic_pent_house_white.svg';
        break;
      case 'common_area':
        status = 'assets/svg/icons/ic_common_area_white.svg';
        break;
      case 'town_house':
        status = 'assets/svg/icons/ic_town_house_white.svg';
        break;
      case 'villa':
        status = 'assets/svg/icons/ic_villa_white.svg';
        break;
      default:
        status = 'assets/svg/icons/ic_other.svg';
        break;
    }
    return status;
  }

  String troubleShootStatus(int status) {
    //  "notStarted": 0,
    //     "underReview": 1,
    //     "pendingUserConfirmation": 2,
    //     "resolved": 3
    String statusText = '';
    switch (status) {
      case 0:
        statusText = "Not Started";
        break;
      case 1:
        statusText = "Under Review";
        break;
      case 2:
        statusText = "Pending User Confirmation";
        break;
      case 3:
        statusText = "Resolved";
        break;
    }
    return statusText;
  }

  /// Checks if string is an video file.
  static bool isVideo(String filePath) {
    var ext = filePath.toLowerCase();

    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".mov") ||
        ext.endsWith(".MOV") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".webm") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  // timer picker
  Future showCuperTimePicker(
    BuildContext ctx, {
    DateTime? initialDate,
    DateTime? minimumDate,
    bool? isPassDate = true,
  }) {
    return showModalBottomSheet<DateTime>(
      context: ctx,
      backgroundColor: Theme.of(ctx).scaffoldBackgroundColor,
      builder: (context) {
        DateTime? tempPickedDate;
        return SizedBox(
          height: 250,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Get.back();
                      // Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () {
                      if (tempPickedDate == null &&
                          DateTime.now().isBefore(
                            DateTime(DateTime.now().year, DateTime.now().month,
                                DateTime.now().day, 16, 0),
                          )) {
                        tempPickedDate = DateTime.now();
                        Get.back(result: tempPickedDate);
                      } else {
                        Get.back(result: tempPickedDate);
                      }
                    },
                  ),
                ],
              ),
              const Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                        color: Theme.of(context).textTheme.headline1!.color,
                      ),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    minuteInterval: 5,
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: initialDate ??
                        DateTime.now().add(
                            Duration(minutes: 5 - DateTime.now().minute % 5)),
                    minimumDate: isPassDate!
                        ? DateTime(DateTime.now().year, DateTime.now().month,
                            DateTime.now().day, 9, 0)
                        : DateTime.now(),
                    maximumDate: DateTime(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day, 16, 0),
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // date picker
  Future<DateTime?> selectDatePick({
    BuildContext? context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    return await showDatePicker(
      context: context!,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2035),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Theme.of(context)
                .scaffoldBackgroundColor, // days/years gridView
            textTheme: TextTheme(
              headlineSmall: AppTextStyle.normalRegularBold12.copyWith(
                color: Theme.of(context).textTheme.displayLarge!.color,
              ), // Selected Date landscape
              titleLarge: AppTextStyle.normalRegularBold12.copyWith(
                color: Theme.of(context).textTheme.displayLarge!.color,
              ), // Selected Date portrait
              labelSmall: AppTextStyle.normalRegularBold12.copyWith(
                color: Theme.of(context).textTheme.displayLarge!.color,
              ), // Title - SELECT DATE
              bodyLarge: AppTextStyle.normalRegularBold12.copyWith(
                color: Theme.of(context).textTheme.displayLarge!.color,
              ), // year gridbview picker
              titleMedium: AppTextStyle.normalRegularBold12.copyWith(
                color: Theme.of(context).textTheme.headline1!.color,
              ), // input
              titleSmall: AppTextStyle.normalRegularBold12.copyWith(
                color: Theme.of(context).textTheme.headline1!.color,
              ), // month/year picker
              bodySmall: AppTextStyle.normalRegularBold12.copyWith(
                color: Theme.of(context).textTheme.headline1!.color,
              ), // days
            ),
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: blueColor,
                  onSurface: Theme.of(context).textTheme.headline1!.color!,
                  onPrimary: Colors.white,
                ),
            // Buttons
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle:
                    AppTextStyle.normalRegularBold12.copyWith(color: blueColor),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: AppTextStyle.normalRegularBold12
                  .copyWith(color: appWhiteColor),
              // Input label
            ),
          ),
          child: child!,
        );
        // return Theme(
        //   data: ThemeData(
        //     fontFamily: "Regular",
        //     primaryColor: darkGreenColor,
        //     dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //     // scaffoldBackgroundColor: Theme.of(context)
        //     //     .scaffoldBackgroundColor,
        //     primarySwatch: appPrimaryColor,
        //     colorScheme: ColorScheme.dark(
        //       primary: appPrimaryColor,
        //       onPrimary: Theme.of(context).textTheme.headline1!.color!,
        //       surface: appPrimaryColor,
        //       onSurface: Theme.of(context).textTheme.headline1!.color!,
        //     ),
        //     // accentColor: const Color(0xFF8CE7F1),
        //     buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),

        //     /// old code
        //     // primarySwatch: appPrimaryColor,
        //     // primaryColor: appPrimaryColor,
        //     // primaryColorDark: appPrimaryColor,
        //     // accentColor: appPrimaryColor,
        //     // scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //     // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //     // textTheme: TextTheme(
        //     //   headline5: AppTextStyle.normalRegularBold12.copyWith(
        //     //     color: Theme.of(context).textTheme.headline1!.color,
        //     //   ), // Selected Date landscape
        //     //   headline6: AppTextStyle.normalRegularBold12.copyWith(
        //     //     color: Theme.of(context).textTheme.headline1!.color,
        //     //   ), // Selected Date portrait
        //     //   overline: AppTextStyle.normalRegularBold12.copyWith(
        //     //     color: Theme.of(context).textTheme.headline1!.color,
        //     //   ), // Title - SELECT DATE
        //     //   bodyText1: AppTextStyle.normalRegularBold12.copyWith(
        //     //     color: Theme.of(context).textTheme.headline1!.color,
        //     //   ), // year gridbview picker
        //     //   subtitle1: AppTextStyle.normalRegularBold12.copyWith(
        //     //     color: Theme.of(context).textTheme.headline1!.color,
        //     //   ), // input
        //     //   subtitle2: AppTextStyle.normalRegularBold12.copyWith(
        //     //     color: Theme.of(context).textTheme.headline1!.color,
        //     //   ), // month/year picker
        //     //   caption: AppTextStyle.normalRegularBold12.copyWith(
        //     //     color: Theme.of(context).textTheme.headline1!.color,
        //     //   ), // days
        //     // ),
        //     // textButtonTheme: TextButtonThemeData(
        //     //   style: TextButton.styleFrom(
        //     //     textStyle:
        //     //         AppTextStyle.normalRegularBold12.copyWith(color: appColor),
        //     //   ),
        //     // ),
        //     // // Input
        //     // inputDecorationTheme: InputDecorationTheme(
        //     //   labelStyle:
        //     //       AppTextStyle.normalRegularBold12.copyWith(color: whiteColor),
        //     //   // Input label
        //     // ),
        //   ),
        //   child: child!,
        // );
      },
    );
  }

  void showImagePicker({
    required BuildContext context,
    required Function() onTapGallery,
    required Function() onTapCamera,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      builder: (BuildContext buildcontext) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                leading: Icon(
                  Icons.photo_library_outlined,
                  color: Theme.of(context).textTheme.headline1!.color,
                ),
                visualDensity:
                    const VisualDensity(horizontal: -2, vertical: -2),
                title: Text(
                  "Photo Gallery",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
                onTap: onTapGallery,
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                visualDensity:
                    const VisualDensity(horizontal: -2, vertical: -2),
                leading: Icon(
                  Icons.photo_camera_outlined,
                  color: Theme.of(context).textTheme.headline1!.color,
                ),
                title: Text(
                  "Camera",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
                onTap: onTapCamera,
              )
            ],
          ),
        );
      },
    );
  }

  // Future getImageFromSource(ImageSource source) async {
  //   final XFile? pickedFile = await ImagePicker().pickImage(source: source);

  //   if (pickedFile != null) {
  //     return pickedFile.path;
  //   } else {
  //     debugPrint("please selected an image");
  //   }
  //   Get.back();
  // }

  // Future onGalleryTap(context) async {
  //   var status = await Permission.photos.status;

  //   try {
  //     if (status.isGranted || status.isDenied) {
  //       var dd = await getImageFromSource(ImageSource.gallery);

  //       return dd;
  //     } else {
  //       showSettingDialog(context, 'Photo',
  //           'This app needs photos access to choose pictures for upload user profile photo');
  //     }
  //   } catch (e) {
  //     CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }

  // Future onCameraTap(context) async {
  //   var status = await Permission.camera.status;

  //   try {
  //     if (status.isGranted || status.isDenied) {
  //       return await getImageFromSource(ImageSource.camera);
  //     } else {
  //       showSettingDialog(context, 'Camera',
  //           'This app needs camera access to take pictures for upload user profile photo');
  //     }
  //   } catch (e) {
  //     CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }

  /// encrypt and decrypt
  ////-------
}
