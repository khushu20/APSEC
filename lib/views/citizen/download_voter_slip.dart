import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/utils/internet_check.dart';
import 'package:ap_sec/view_model/citizen/download_voter_slip_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import '../../network/app_strings.dart';
import '../../res/app_alerts/exit_app_alert.dart';
import '../../res/colors.dart';
import '../../res/components/custom_appbar.dart';
import '../../res/components/internet_check_alert.dart';
import '../../res/components/loader.dart';
import '../../res/components/toast.dart';
import 'side_menu_citizen.dart';

class DownloadVoterSlipView extends StatefulWidget {
  const DownloadVoterSlipView({super.key});

  @override
  State<DownloadVoterSlipView> createState() => _DownloadVoterSlipViewState();
}

class _DownloadVoterSlipViewState extends State<DownloadVoterSlipView> {
  final _formKey = GlobalKey<FormState>();
  String? selectedDistrict;
  String selectedId = '00';
  TextEditingController epicNoController = TextEditingController();
  List<String> telanganaDistricts = [
    "--Select--",
    "Adilabad",
    "Komaram Bheem",
    "Mancherial",
    "Nirmal",
    "Nizamabad",
    "Jagtial",
    "Peddapalli",
    "Jayashankar",
    "Bhadradri",
    "Mahabubabad",
    "Warangal Rural",
    "Warangal Urban",
    "Karimnagar",
    "Rajanna Sircilla",
    "Kamareddy",
    "Sangareddy",
    "Medak",
    "Siddipet",
    "Jangaon",
    "Yadadri Bhongiri",
    "Medchal-Malkajgiri",
    "Hyderabad",
    "Rangareddy",
    "Vikarabad",
    "Mahabubnagar",
    "Jogulamba Gadwal",
    "Wanaparthy",
    "Nagarkurnool",
    "Nalgonda",
    "Suryapet",
    "Khammam",
    "Mulugu",
    "Narayanpet"
  ];
  ValueNotifier<int> select_language = ValueNotifier<int>(1);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final downloadVoterSlipProvider =
        Provider.of<DownloadVoterSlipViewModel>(context);
    double logoSizeHeight =
        (MediaQuery.of(context).size.height / 3 * 2 / 30) * 15;
    double logoSizeWidth =
        (MediaQuery.of(context).size.width / 3 * 2 / 30) * 15;
    return WillPopScope(
      onWillPop: () async {
        if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
          _scaffoldKey.currentState?.closeDrawer(); // Close the drawer
          return false; // Do not exit the app
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ExitAppAlert();
            },
          );
          return false; // Do not exit the app
        }
      },
      child: Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
            drawer: SideMenuCitizen(),
            appBar: GradientAppBar(
              title: "app_name".tr(),
              actions: [
                IconButton(
                  icon: Icon(Icons.language),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          content: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "select_language".tr(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Icon(Icons.close),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RadioListTile(
                                  activeColor: Colors.pink,
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "ENGLISH",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  value: 1,
                                  visualDensity: VisualDensity(
                                      horizontal: -4, vertical: -4),
                                  groupValue: select_language.value,
                                  onChanged: (value) {
                                    select_language.value = value ?? 1;
                                    Navigator.pop(dialogContext);
                                    context.setLocale(
                                      Locale('en', 'US'),
                                    );
                                  },
                                ),
                                RadioListTile(
                                  activeColor: Colors.pink,
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "తెలుగు",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  value: 2,
                                  visualDensity: VisualDensity(
                                      horizontal: -4, vertical: -4),
                                  groupValue: select_language.value,
                                  onChanged: (value) {
                                    select_language.value = value ?? 1;
                                    Navigator.pop(dialogContext);
                                    context.setLocale(
                                      Locale('te', 'IN'),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(221, 200, 204, 232),
                              radius: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  ImageConstants.appIcon,
                                  height: logoSizeHeight,
                                  width: logoSizeWidth,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 30,
                              child: Marquee(
                                text: 'WELCOME TO DASHBOARD',
                                style: TextStyle(fontSize: 20.0),
                                scrollAxis: Axis.horizontal,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                blankSpace: 20.0,
                                velocity: 50.0,
                                pauseAfterRound: Duration(seconds: 1),
                                startPadding: 10.0,
                                accelerationDuration: Duration(seconds: 1),
                                accelerationCurve: Curves.linear,
                                decelerationDuration:
                                    Duration(milliseconds: 500),
                                decelerationCurve: Curves.easeOut,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Color.fromARGB(221, 200, 204, 232),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40,
                                          ),
                                          Center(
                                            child: Text(
                                              "dwnld_voter_slip".tr(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40,
                                          ),
                                          Container(
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.0),
                                                      child: DropdownButton<
                                                          String>(
                                                        isExpanded: true,
                                                        itemHeight:
                                                            kMinInteractiveDimension,
                                                        value: selectedDistrict,
                                                        onChanged:
                                                            (String? newValue) {
                                                          setState(() {
                                                            selectedDistrict =
                                                                newValue ??
                                                                    'select_district'
                                                                        .tr();
                                                            selectedId = AppStrings
                                                                    .DistrictsIDs[
                                                                telanganaDistricts
                                                                    .indexOf(
                                                                        selectedDistrict ??
                                                                            '00')];
                                                          });
                                                        },
                                                        items:
                                                            telanganaDistricts
                                                                .map((String
                                                                    district) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: district,
                                                            child: Text(
                                                                district.tr(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40,
                                          ),
                                          Container(
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  inputFormatters: [],
                                                  controller: epicNoController,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  maxLength: 50,
                                                  maxLines: 1,
                                                  cursorColor: Color.fromARGB(
                                                      255, 33, 184, 166),
                                                  decoration: InputDecoration(
                                                    counterText: '',
                                                    hintText: "epic_no".tr(),
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40,
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              FocusScope.of(context).unfocus();
                                              bool isConnected =
                                                  await InternetCheck()
                                                      .hasInternetConnection();
                                              if (selectedDistrict ==
                                                      'select_district'.tr() ||
                                                  selectedDistrict ==
                                                      "select".tr() ||
                                                  selectedId == "00") {
                                                ShowToasts.showToast(
                                                    "please_select_district"
                                                        .tr());
                                              } else if (epicNoController
                                                  .text.isEmpty) {
                                                ShowToasts.showToast(
                                                    "please_select_epincNo"
                                                        .tr());
                                              } else {
                                                if (isConnected) {
                                                  downloadVoterSlipProvider
                                                      .setIsLoadingStatus(true);
                                                  print(
                                                      "Spinner val1 ${selectedDistrict}");
                                                  print(
                                                      "Spinner districtID ${selectedId}");
                                                  await downloadVoterSlipProvider
                                                      .getVoterSlipDetails(
                                                          selectedId,
                                                          epicNoController.text
                                                              .trim(),
                                                          context,
                                                          context.locale
                                                              .languageCode);
                                                } else {
                                                  showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return InternetCheckAlert();
                                                      });
                                                }
                                              }
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                              child: Text(
                                                "search".tr(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.buttoncolor,
                                              textStyle:
                                                  TextStyle(fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
            bottomNavigationBar: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.sampleGradient,
                ),
                child: Image.asset(
                  ImageConstants.footerwhite,
                  width: double.infinity,
                  height: 40,
                ),
              ),
            ),
          ),
          if (downloadVoterSlipProvider.getIsLoadingStatus) LoaderComponent(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedDistrict = telanganaDistricts[0];
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final language = context.locale;
      int languageValue = _extractLanguageValue(language);

      // Update the select_language ValueNotifier
      select_language.value = languageValue;
      print(select_language.value);
    });
  }

  int _extractLanguageValue(Locale locale) {
    Map<String, int> languageCodeMap = {
      'en': 1, // English
      'te': 2, // Telugu
    };

    return languageCodeMap[locale.languageCode] ??
        1; // Default to 1 if not found
  }
}
