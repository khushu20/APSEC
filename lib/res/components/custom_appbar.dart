import 'package:ap_sec/res/colors.dart';
import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? automaticallyImplyLeading;
  final List<Widget>? actions;
  final Widget? IconButton;

  GradientAppBar(
      {required this.title,
      this.automaticallyImplyLeading,
      this.actions,
      this.IconButton});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.reusableGradient),
      child: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        title: Center(
          child: Text(
            title,
            style: TextStyle(color: AppColors.white, fontSize: 18),
          ),
        ),
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0,
        leading: IconButton,
        // Remove the shadow
        actions: actions ??
            <Widget>[
              Icon(
                Icons.more_vert,
                color: Colors.transparent,
              ),
            ],
      ),
    );
  }
}
