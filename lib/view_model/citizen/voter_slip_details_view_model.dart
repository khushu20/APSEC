import 'dart:io';
import 'package:ap_sec/res/components/toast.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import '../../routes/app_routes.dart';

class VoterSlipItemsListViewModel with ChangeNotifier {
  void saveScreenshot(String screenshotName,
      ScreenshotController screenshotController, BuildContext context) async {
    if (Platform.isAndroid) {
      final plugin = DeviceInfoPlugin();
      final android = await plugin.androidInfo;

      PermissionStatus status = android.version.sdkInt < 33
          ? await Permission.storage.request()
          : PermissionStatus.granted;
      if (status.isGranted) {
        Uint8List? image = await screenshotController.capture();
        if (image != null) {
          final result = await ImageGallerySaver.saveImage(image,
              name: "${screenshotName.replaceAll(" ", "").toString()}");
          print(result);
          if (result['isSuccess']) {
            String savedFilePath = result['filePath'];
            File savedFile = File(savedFilePath);
            String directory = savedFile.parent.path;
            String originalFilePath =
                '$directory/${screenshotName.replaceAll(" ", "").toString()}.jpg';
            ShowToasts.showToast(
                "img_saved_successfully".tr() + "${originalFilePath}");
          } else {
            ShowToasts.showToast(result['errorMessage']);
          }
        }
      } else {
        PermissionStatus status = await Permission.storage.request();
        if (status.isGranted) {
          Uint8List? image = await screenshotController.capture();
          if (image != null) {
            final result = await ImageGallerySaver.saveImage(image,
                name: screenshotName.replaceAll(" ", ""));
            print(result);
            if (result['isSuccess']) {
              String savedFilePath = result['filePath'];
              File savedFile = File(savedFilePath);
              String directory = savedFile.parent.path;
              String originalFilePath =
                  '$directory/${screenshotName.replaceAll(" ", "").toString()}.jpg';
              ShowToasts.showToast(
                  "img_saved_successfully".tr() + "${originalFilePath}");
            } else {
              ShowToasts.showToast(result['errorMessage']);
            }
          }
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Row(
                    children: [
                      ImageIcon(
                        AssetImage(ImageConstants.appIcon),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("app_name".tr())
                    ],
                  ),
                  content: Text(
                    "permission_denied".tr() + "permission_denied_msg".tr(),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          openAppSettings();
                        },
                        child: Text("ok".tr()))
                  ],
                );
              });
        }
      }
    } else if (Platform.isIOS) {
      PermissionStatus status = await Permission.photosAddOnly.request();
      if (status.isGranted) {
        Uint8List? image = await screenshotController.capture();
        if (image != null) {
          final result = await ImageGallerySaver.saveImage(image,
              name: screenshotName.replaceAll(" ", ""));
          print(result);
          if (result['isSuccess']) {
            ShowToasts.showToast("img_saved_successfully".tr() +
                "${screenshotName.replaceAll(" ", "").toString()}.jpg");
          } else {
            ShowToasts.showToast(result['errorMessage']);
          }
        }
      } else {
        PermissionStatus status = await Permission.photosAddOnly.request();
        if (status.isGranted) {
          Uint8List? image = await screenshotController.capture();
          if (image != null) {
            final result = await ImageGallerySaver.saveImage(image,
                name: screenshotName.replaceAll(" ", ""));
            print(result);
            if (result['isSuccess']) {
              ShowToasts.showToast("img_saved_successfully".tr() +
                  "${screenshotName.replaceAll(" ", "").toString()}.jpg");
            } else {
              ShowToasts.showToast(result['errorMessage']);
            }
          }
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Row(
                    children: [
                      ImageIcon(
                        AssetImage(ImageConstants.appIcon),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("app_name".tr())
                    ],
                  ),
                  content: Text(
                    "permission_denied".tr() + "permission_denied_msg".tr(),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () async {
                          await openAppSettings().then((value) async {
                            PermissionStatus status =
                                await Permission.photosAddOnly.request();
                            if (status.isGranted) {
                              Navigator.pop(context);
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.downloadVoterSlip);
                            }
                          });
                        },
                        child: Text("ok".tr()))
                  ],
                );
              });
        }
      }
    } else {
      Uint8List? image = await screenshotController.capture();
      if (image != null) {
        final result =
            await ImageGallerySaver.saveImage(image, name: screenshotName);
        print(result);
        if (result['isSuccess']) {
          ShowToasts.showToast("img_saved_successfully".tr() +
              "${screenshotName.replaceAll(" ", "").toString()}.jpg");
        } else {
          ShowToasts.showToast(result['errorMessage']);
        }
      }
    }
  }
  //version update service call
}
