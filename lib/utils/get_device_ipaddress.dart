import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class GetDeviceIpAddress {
  var deviceInfo = DeviceInfoPlugin();
  GetIp() async {
    if (Platform.isIOS) {
      for (var interface in await NetworkInterface.list()) {
        if (interface.name == 'en0' || interface.name == 'en1') {
          for (var addr in interface.addresses) {
            if (addr.type == InternetAddressType.IPv4) {
              //  AppConstants.ipAddress = "${addr.address}";
              return "${addr.address}";
            }
          }
        }
        return '';
      }
    } else if (Platform.isAndroid) {
      for (var interface in await NetworkInterface.list()) {
        print('== Interface: ${interface.name} ==');
        for (var addr in interface.addresses) {
          print(
              '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
          // AppConstants.ipAddress = "${addr.address}";
          return "${addr.address}";
        }
      }
    }
    return null;
  }
}
