import 'package:ap_sec/network/app_strings.dart';
import 'package:ap_sec/routes/app_routes.dart';
import 'package:ap_sec/view_model/citizen/download_voter_slip_view_model.dart';
import 'package:ap_sec/view_model/citizen/voter_slip_details_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'routes/app_pages.dart';
import 'view_model/privacy_policy_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) async {
    runApp(EasyLocalization(
        child: MyApp(),
        supportedLocales: [Locale('en', 'US'), Locale('te', 'IN')],
        path: 'assets/translation',
        fallbackLocale: Locale('te', 'IN')));
  });
  //runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DownloadVoterSlipViewModel()),
        ChangeNotifierProvider(create: (_) => VoterSlipItemsListViewModel()),
        ChangeNotifierProvider(create: (_) => PrivacyPolicyViewModel()),
      ],
      child: MaterialApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: AppStrings.title,
        initialRoute: AppRoutes.initial,
        routes: AppPages.routes,
        theme: ThemeData(
          fontFamily: 'ElMessiri',
        ),
      ),
    );
  }
}
