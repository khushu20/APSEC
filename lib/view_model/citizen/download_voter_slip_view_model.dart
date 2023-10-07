import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../models/downloadSlipVoterResponse.dart';
import '../../repository/download_voter_slip_repository.dart';
import '../../routes/app_routes.dart';

class DownloadVoterSlipViewModel with ChangeNotifier {
  final _downloadVoterSlipRepository = VoterSlipRepository();
  VoterResponse voterSlipResponse = VoterResponse();

  getVoterSlipDetails(String selectedDistrictId, String epicNo,
      BuildContext context, String languageCode) async {
    final requestTelugu = {
      "districtId": int.parse(selectedDistrictId),
      "epic": epicNo,
      "source": "Mobile",
    };
    final response = await _downloadVoterSlipRepository
        .getVoterSlipTelugu(context, requestTelugu);
    if (response != null) {
      if (response.statusCode == "" || response.statusCode == null) {
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text("app_name".tr()),
                content: Text("${response.statusMessage}"),
                actions: [
                  CupertinoDialogAction(
                    child: Text("ok".tr()),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      } else {
        voterSlipResponse = response;
        Navigator.pushNamed(context, AppRoutes.voterSlipDetails,
            arguments: voterSlipResponse);
      }
    }
  }
}
