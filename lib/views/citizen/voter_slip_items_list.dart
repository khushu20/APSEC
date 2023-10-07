import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/view_model/citizen/voter_slip_details_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../models/downloadSlipVoterResponse.dart';
import '../../res/colors.dart';
import '../../res/components/row_component.dart';
import '../../routes/app_routes.dart';

class VoterSlipItemsList extends StatefulWidget {
  const VoterSlipItemsList({super.key});

  @override
  State<VoterSlipItemsList> createState() =>
      _VoterSlipItemsListState();
}

class _VoterSlipItemsListState extends State<VoterSlipItemsList> {
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    final voterSlipResponse =
        ModalRoute.of(context)?.settings.arguments as VoterResponse;
    final voterSlipProvider =
        Provider.of<VoterSlipItemsListViewModel>(context);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          Navigator.pushReplacementNamed(
              context, AppRoutes.downloadVoterSlip);
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: AppColors.appThemeColor,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: AppColors.appbarcolor,
            title: Text("app_name".tr()),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Screenshot(
                  controller: screenshotController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 2.0),
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Center(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 50,
                                    child: Image.network(
                                      "https://upload.wikimedia.org/wikipedia/en/9/92/Telangana_State_Election_Commission_Logo.png",
                                      height: 90,
                                      width: 90,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          ImageConstants.exit,
                                          height: 150.0,
                                          width: 100.0,
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        (context.locale.languageCode == "en")
                                            ? (voterSlipResponse
                                                    .electionTypeTitleEn ??
                                                "")
                                            : (voterSlipResponse
                                                    .electionTypeTitleTe ??
                                                ""),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text("voter_slip".tr()),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.blue.shade100,
                                    Colors.blue.shade200,
                                    Colors.blue.shade100,
                                  ],
                                ),
                                border: Border.all(
                                  color: Colors.grey, // Border color
                                  width: 1.0, // Border width
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ), // Border radius
                              child: Column(
                                children: [
                                  ...(voterSlipResponse.voterData)!.map((e) {
                                    return Column(
                                      children: [
                                        RowComponent(
                                          data: (context.locale.languageCode ==
                                                  "en")
                                              ? e.labelNameEn
                                              : e.labelNameTe,
                                          value: (context.locale.languageCode ==
                                                  "en")
                                              ? e.valueEn
                                              : e.valueTe,
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                (context.locale.languageCode == "en")
                                    ? voterSlipResponse.noteEn ?? ""
                                    : voterSlipResponse.noteTe ?? "",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                      right: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          ImageConstants.downloadIcon,
                          height: 25,
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    voterSlipProvider.saveScreenshot(
                        "voterSlip", screenshotController, context);
                  },
                )
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: AppColors.appbarcolor,
            child: Image.asset(
              ImageConstants.footerwhite,
              width: double.infinity,
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
