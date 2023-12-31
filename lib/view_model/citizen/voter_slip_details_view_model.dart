import 'dart:io';
import 'package:ap_sec/res/components/toast.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import '../../routes/app_routes.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;

class VoterSlipItemsListViewModel with ChangeNotifier {
  bool isLoading = false;
  get getIsLoadingStatus => isLoading;
  setIsLoadingStatus(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void saveScreenshot(String screenshotName,
      ScreenshotController screenshotController, BuildContext context) async {
    if (Platform.isAndroid) {
      final plugin = DeviceInfoPlugin();
      final android = await plugin.androidInfo;

      PermissionStatus status = android.version.sdkInt < 33
          ? await Permission.storage.request()
          : PermissionStatus.granted;
      if (status.isGranted) {
        setIsLoadingStatus(true);
        Uint8List? image = await screenshotController.capture();
        if (image != null) {
          Directory? externalDir;

          if (Platform.isIOS) {
            externalDir = await getApplicationDocumentsDirectory();
            print('External Storage Directory ios: ${externalDir.path}');
          } else {
            externalDir = Directory('/storage/emulated/0/Pictures');
            print('External Storage Directory: ${externalDir.path}');
          }

          int counter = 0;
          String fileName = screenshotName.replaceAll(" ", "");
          String baseFileName = screenshotName.replaceAll(" ", "");
          print(
              ":::: ${await File('${externalDir.path}/$fileName.jpg').exists()}");
          while (await File('${externalDir.path}/$fileName.jpg').exists()) {
            counter++;
            String extension = path.extension(baseFileName);
            String fileNameWithoutExtension =
                path.basenameWithoutExtension(baseFileName);
            fileName = '$fileNameWithoutExtension($counter)$extension';
          }
          final result =
              await ImageGallerySaver.saveImage(image, name: fileName);
          print(result);
          if (result['isSuccess']) {
            String savedFilePath = result['filePath'];
            showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  return WillPopScope(
                    onWillPop: () {
                      return Future.value(false);
                    },
                    child: CupertinoAlertDialog(
                      title: Row(
                        children: [
                          ImageIcon(
                            AssetImage(ImageConstants.appIcon),
                          ),
                          SizedBox(width: 10),
                          Text("app_name".tr()),
                        ],
                      ),
                      content: Text("img_saved_successfully".tr() +
                          " to\n" +
                          "${savedFilePath}"),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            setIsLoadingStatus(false);
                            Navigator.of(context).pop();
                            OpenFile.open(Uri.parse(savedFilePath).path);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            setIsLoadingStatus(false);
            ShowToasts.showToast(result['errorMessage']);
          }
        }
      } else {
        PermissionStatus status = await Permission.storage.request();
        if (status.isGranted) {
          setIsLoadingStatus(true);
          Uint8List? image = await screenshotController.capture();
          if (image != null) {
            Directory? externalDir;

            if (Platform.isIOS) {
              externalDir = await getApplicationDocumentsDirectory();
              print('External Storage Directory ios: ${externalDir.path}');
            } else {
              externalDir = Directory('/storage/emulated/0/Pictures');
              print('External Storage Directory: ${externalDir.path}');
            }

            int counter = 0;
            String fileName = screenshotName.replaceAll(" ", "");
            String baseFileName = screenshotName.replaceAll(" ", "");
            print(
                ":::: ${await File('${externalDir.path}/$fileName.jpg').exists()}");
            while (await File('${externalDir.path}/$fileName.jpg').exists()) {
              counter++;
              String extension = path.extension(baseFileName);
              String fileNameWithoutExtension =
                  path.basenameWithoutExtension(baseFileName);
              fileName = '$fileNameWithoutExtension($counter)$extension';
            }
            final result =
                await ImageGallerySaver.saveImage(image, name: fileName);
            print(result);
            if (result['isSuccess']) {
              String savedFilePath = result['filePath'];
              showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return WillPopScope(
                      onWillPop: () {
                        return Future.value(false);
                      },
                      child: CupertinoAlertDialog(
                        title: Row(
                          children: [
                            ImageIcon(
                              AssetImage(ImageConstants.appIcon),
                            ),
                            SizedBox(width: 10),
                            Text("app_name".tr()),
                          ],
                        ),
                        content: Text("img_saved_successfully".tr() +
                            " to\n" +
                            "${savedFilePath}"),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            onPressed: () {
                              setIsLoadingStatus(false);
                              Navigator.of(context).pop();
                              OpenFile.open(Uri.parse(savedFilePath).path);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              setIsLoadingStatus(false);
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
      PermissionStatus status = await Permission.photos.request();
      if (status.isGranted) {
        setIsLoadingStatus(true);
        Uint8List? image = await screenshotController.capture();
        if (image != null) {
          Directory? externalDir;

          if (Platform.isIOS) {
            externalDir = await getApplicationDocumentsDirectory();
            print('External Storage Directory ios: ${externalDir.path}');
          } else {
            externalDir = Directory('/storage/emulated/0/Pictures');
            print('External Storage Directory: ${externalDir.path}');
          }

          int counter = 0;
          String fileName = screenshotName.replaceAll(" ", "");
          String baseFileName = screenshotName.replaceAll(" ", "");
          print(
              ":::: ${await File('${externalDir.path}/$fileName.jpg').exists()}");
          while (await File('${externalDir.path}/$fileName.jpg').exists()) {
            counter++;
            String extension = path.extension(baseFileName);
            String fileNameWithoutExtension =
                path.basenameWithoutExtension(baseFileName);
            fileName = '$fileNameWithoutExtension($counter)$extension';
          }
          final result =
              await ImageGallerySaver.saveImage(image, name: fileName);
          print(result);
          if (result['isSuccess']) {
            String savedFilePath = result['filePath'];
            showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  return WillPopScope(
                    onWillPop: () {
                      return Future.value(false);
                    },
                    child: CupertinoAlertDialog(
                      title: Row(
                        children: [
                          ImageIcon(
                            AssetImage(ImageConstants.appIcon),
                          ),
                          SizedBox(width: 10),
                          Text("app_name".tr()),
                        ],
                      ),
                      content: Text("img_saved_successfully".tr() +
                          " to\n" +
                          "${savedFilePath}"),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            setIsLoadingStatus(false);
                            Navigator.of(context).pop();
                            OpenFile.open(Uri.parse(savedFilePath).path);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            setIsLoadingStatus(false);
            ShowToasts.showToast(result['errorMessage']);
          }
        }
      } else {
        PermissionStatus status = await Permission.photos.request();
        if (status.isGranted) {
          setIsLoadingStatus(true);
          Uint8List? image = await screenshotController.capture();
          if (image != null) {
            Directory? externalDir;

            if (Platform.isIOS) {
              externalDir = await getApplicationDocumentsDirectory();
              print('External Storage Directory ios: ${externalDir.path}');
            } else {
              externalDir = Directory('/storage/emulated/0/Pictures');
              print('External Storage Directory: ${externalDir.path}');
            }

            int counter = 0;
            String fileName = screenshotName.replaceAll(" ", "");
            String baseFileName = screenshotName.replaceAll(" ", "");
            print(
                ":::: ${await File('${externalDir.path}/$fileName.jpg').exists()}");
            while (await File('${externalDir.path}/$fileName.jpg').exists()) {
              counter++;
              String extension = path.extension(baseFileName);
              String fileNameWithoutExtension =
                  path.basenameWithoutExtension(baseFileName);
              fileName = '$fileNameWithoutExtension($counter)$extension';
            }
            final result =
                await ImageGallerySaver.saveImage(image, name: fileName);
            print(result);
            if (result['isSuccess']) {
              String savedFilePath = result['filePath'];
              showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return WillPopScope(
                      onWillPop: () {
                        return Future.value(false);
                      },
                      child: CupertinoAlertDialog(
                        title: Row(
                          children: [
                            ImageIcon(
                              AssetImage(ImageConstants.appIcon),
                            ),
                            SizedBox(width: 10),
                            Text("app_name".tr()),
                          ],
                        ),
                        content: Text("img_saved_successfully".tr() +
                            " to\n" +
                            "${savedFilePath}"),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            onPressed: () {
                              setIsLoadingStatus(false);
                              Navigator.of(context).pop();
                              OpenFile.open(Uri.parse(savedFilePath).path);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              setIsLoadingStatus(false);
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
                                await Permission.photos.request();
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
        Directory? externalDir;

        if (Platform.isIOS) {
          externalDir = await getApplicationDocumentsDirectory();
          print('External Storage Directory ios: ${externalDir.path}');
        } else {
          externalDir = Directory('/storage/emulated/0/Pictures');
          print('External Storage Directory: ${externalDir.path}');
        }

        int counter = 0;
        String fileName = screenshotName.replaceAll(" ", "");
        String baseFileName = screenshotName.replaceAll(" ", "");
        print(
            ":::: ${await File('${externalDir.path}/$fileName.jpg').exists()}");
        while (await File('${externalDir.path}/$fileName.jpg').exists()) {
          counter++;
          String extension = path.extension(baseFileName);
          String fileNameWithoutExtension =
              path.basenameWithoutExtension(baseFileName);
          fileName = '$fileNameWithoutExtension($counter)$extension';
        }
        final result =
            await ImageGallerySaver.saveImage(image, name: screenshotName);
        print(result);
        if (result['isSuccess']) {
          String savedFilePath = result['filePath'];
          showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return WillPopScope(
                  onWillPop: () {
                    return Future.value(false);
                  },
                  child: CupertinoAlertDialog(
                    title: Row(
                      children: [
                        ImageIcon(
                          AssetImage(ImageConstants.appIcon),
                        ),
                        SizedBox(width: 10),
                        Text("app_name".tr()),
                      ],
                    ),
                    content: Text("img_saved_successfully".tr() +
                        " to\n" +
                        "${savedFilePath}"),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () {
                          setIsLoadingStatus(false);
                          Navigator.of(context).pop();
                          OpenFile.open(Uri.parse(savedFilePath).path);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              });
        } else {
          setIsLoadingStatus(false);
          ShowToasts.showToast(result['errorMessage']);
        }
      }
    }
  }
}
