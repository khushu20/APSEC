import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
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
