/* import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';



class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
    WebViewController privacyPolicy_controller = WebViewController();
  WebViewController termsAndConditions_controller = WebViewController();
  WebViewController copyrights_controller = WebViewController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        title: Text(TextConstants.privacyPolicy,style: TextStyle(color: AppColors.white),),
        backgroundColor: AppColors.appThemeColor,
      ),
      body: Container(
        child: ContainedTabBarView(
          tabBarProperties: TabBarProperties(
              indicatorColor: AppColors.bgcolor, indicatorWeight: 3.0),
          tabs: [
            Text(
              TextConstants.privacyPolicy,
              style: TextStyle(fontSize: 14, color: AppColors.black),
            ),
            Text(
               TextConstants.termsAndConditions,
              style: TextStyle(fontSize: 14, color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            Text(
              TextConstants.copyrightPolicy,
              style: TextStyle(fontSize: 14, color: AppColors.black),
            )
          ],
          views: [
                Container(
                  child: WebViewWidget(
                  controller: privacyPolicy_controller
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..setBackgroundColor(const Color(0x00000000))
                    ..setNavigationDelegate(
                      NavigationDelegate(
                        onWebResourceError: (WebResourceError error) {},
                      ),
                    )
                    ..loadRequest(Uri.parse(
                        'https://www.cgg.gov.in/mgov-privacy-policy/?depot_name=Centre for Good Governance (CGG), Govt. of Telangana')),
                  gestureRecognizers: Set()
                    ..add(Factory<VerticalDragGestureRecognizer>(
                        () => VerticalDragGestureRecognizer())),
                              ),
                ),
            
             Container(
               child: WebViewWidget(
                  controller: termsAndConditions_controller
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..setBackgroundColor(const Color(0x00000000))
                    ..setNavigationDelegate(
                      NavigationDelegate(
                        onWebResourceError: (WebResourceError error) {},
                      ),
                    )
                    ..loadRequest(Uri.parse(
                        'https://www.cgg.gov.in/mgov-terms-conditions/?depot_name=Centre for Good Governance (CGG), Govt. of Telangana&capital=Hyderabad, Telangana')),
                  gestureRecognizers: Set()
                    ..add(Factory<VerticalDragGestureRecognizer>(
                        () => VerticalDragGestureRecognizer())),
                ),
             ),
            
             Container(
              child: WebViewWidget(
                controller: copyrights_controller
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setBackgroundColor(const Color(0x00000000))
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onWebResourceError: (WebResourceError error) {},
                    ),
                  )
                  ..loadRequest(Uri.parse(
                      'https://www.cgg.gov.in/mgov-copyright-policy/?depot_name=Centre for Good Governance (CGG), Govt. of Telangana&depot_email=info@cgg.gov.in')),
                gestureRecognizers: Set()
                  ..add(Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
              ),
                       ),
           
         
          ],
        ),
      ),
    );
  }
}
 */

import 'package:ap_sec/res/components/custom_appbar.dart';
import 'package:ap_sec/res/components/loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import '../res/colors.dart';
import '../view_model/privacy_policy_viewmodel.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  WebViewController privacyPolicy_controller = WebViewController();
  WebViewController termsAndConditions_controller = WebViewController();
  WebViewController copyrights_controller = WebViewController();

  @override
  Widget build(BuildContext context) {
    final privacyPolicyProvider = Provider.of<PrivacyPolicyViewModel>(context);
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: GradientAppBar(
              title: "privacy_policy".tr(),
            ),
            body: Container(
              color: AppColors.white,
              child: ContainedTabBarView(
                tabBarProperties: TabBarProperties(
                    indicatorColor: AppColors.red, indicatorWeight: 3.0),
                tabs: [
                  Text(
                    "privacy_policy".tr(),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    "terms_and_conditions".tr(),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "copy_rights_policy".tr(),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )
                ],
                views: [
                  Container(
                    child: WebViewWidget(
                      controller: privacyPolicy_controller
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..setBackgroundColor(const Color(0x00000000))
                        ..setNavigationDelegate(
                          NavigationDelegate(
                            onPageFinished: (url) {
                              if (privacyPolicyProvider.getIsLoadingStatus)
                                privacyPolicyProvider.setIsLoadingStatus(false);
                            },
                          ),
                        )
                        ..loadRequest(Uri.parse(
                            'https://www.cgg.gov.in/mgov-privacy-policy/?depot_name=Centre%20for%20Good%20Governance%20(CGG),%20Govt.%20of%20Telangana')),
                      gestureRecognizers: Set()
                        ..add(Factory<VerticalDragGestureRecognizer>(
                            () => VerticalDragGestureRecognizer())),
                    ),
                  ),
                  Container(
                    child: WebViewWidget(
                      controller: termsAndConditions_controller
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..setBackgroundColor(const Color(0x00000000))
                        ..setNavigationDelegate(
                          NavigationDelegate(
                            onPageFinished: (url) {
                              if (privacyPolicyProvider.getIsLoadingStatus)
                                privacyPolicyProvider.setIsLoadingStatus(false);
                            },
                          ),
                        )
                        ..loadRequest(Uri.parse(
                            'https://www.cgg.gov.in/mgov-terms-conditions/?depot_name=Centre%20for%20Good%20Governance%20(CGG),%20Govt.%20of%20Telangana&capital=Hyderabad,%20Telangana')),
                      gestureRecognizers: Set()
                        ..add(Factory<VerticalDragGestureRecognizer>(
                            () => VerticalDragGestureRecognizer())),
                    ),
                  ),
                  Container(
                    child: WebViewWidget(
                      controller: copyrights_controller
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..setBackgroundColor(const Color(0x00000000))
                        ..setNavigationDelegate(
                          NavigationDelegate(
                            onPageFinished: (url) {
                              if (privacyPolicyProvider.getIsLoadingStatus)
                                privacyPolicyProvider.setIsLoadingStatus(false);
                            },
                          ),
                        )
                        ..loadRequest(Uri.parse(
                            'https://www.cgg.gov.in/mgov-copyright-policy/?depot_name=Centre%20for%20Good%20Governance%20(CGG),%20Govt.%20of%20Telangana&depot_email=info@cgg.gov.in')),
                      gestureRecognizers: Set()
                        ..add(Factory<VerticalDragGestureRecognizer>(
                            () => VerticalDragGestureRecognizer())),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (privacyPolicyProvider.getIsLoadingStatus) LoaderComponent(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final privacyPolicyProvider =
          Provider.of<PrivacyPolicyViewModel>(context, listen: false);
      privacyPolicyProvider.setIsLoadingStatus(true);
    });
  }
}
