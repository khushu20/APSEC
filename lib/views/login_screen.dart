import 'package:ap_sec/res/app_alerts/custom_error_alert.dart';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:ap_sec/routes/app_routes.dart';
import 'package:ap_sec/utils/internet_check.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TabController? tabController;
  final mobileNoController = TextEditingController();

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          body: Container(
            color: AppColors.appThemeColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TabBar(
                                  unselectedLabelColor: Colors.black,
                                  tabs: const [
                                    Tab(
                                      text: "Citizen",
                                    ),
                                    Tab(text: "Officer"),
                                  ],
                                  controller: tabController,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: tabController,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30.0,
                                              left: 10.0,
                                              right: 10.0,
                                              bottom: 8.0),
                                          child: TextField(
                                            controller: mobileNoController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.phone),
                                              labelText: TextConstants.mobileNo,
                                              hintText: TextConstants.mobileNo,
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: AppColors.ash),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: ElevatedButton(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15),
                                                child: Text(
                                                  TextConstants.login,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: AppColors.white),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                backgroundColor:
                                                    AppColors.appThemeColor,
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                              onPressed: () async {
                                                if (userValidations(context)) if (await InternetCheck()
                                                    .hasInternetConnection()) {
                                                 
                                                } else {
                                                  showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return CustomErrorAlert(
                                                        descriptions: TextConstants
                                                            .plz_check_internet,
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(children: [
                                                        Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 8.0, right: 8.0, bottom: 8.0),
                  child: TextField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: TextConstants.userId,
                      hintText: TextConstants.userId,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.ash),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    obscureText: _obscurePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword =
                                !_obscurePassword; // Toggle the visibility of the password.
                          });
                        },
                        child: Icon(
                          _obscurePassword ? Icons.lock : Icons.lock_open,
                        ),
                      ),
                      labelText: TextConstants.password,
                      hintText: TextConstants.password,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.ash),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          TextConstants.login,
                          style:
                              TextStyle(fontSize: 18, color: AppColors.white),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        backgroundColor:   AppColors.appThemeColor,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontStyle: FontStyle.normal),
                      ),
                      onPressed: () async {
                        if (userValidations(context)) if (await InternetCheck()
                            .hasInternetConnection()) {
                              Navigator.pushReplacementNamed(context, AppRoutes.officerdashboard);
                         /*  loginViewmodel.officerLoginMobileService(
                              context,
                              _userNameController.text.toString().trim(),
                              _passwordController.text.toString().trim()); */
                        } else {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return CustomErrorAlert(
                                descriptions: TextConstants.plz_check_internet,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
                                    ],)
                    
               
               
                                  ],
                                ),
                              ),
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
        ));
  }

  bool userValidations(BuildContext context) {
    /* if (_userNameController.text.toString().isEmpty) {
      if (_userNameController.text.isEmpty) {
        ValidationIoSAlert().showAlert(context, TextConstants.plz_enter_uname);

        return false;
      } else if (_passwordController.text.isEmpty) {
        ValidationIoSAlert().showAlert(context, TextConstants.plz_enter_pwd);

        return false;
      }
    } */
    return true;
  }
}
