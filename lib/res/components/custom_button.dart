import 'package:flutter/material.dart';

//Create a Stateless or Stateful Class
class CustomButton extends StatelessWidget {
  //declare Required Vairables
  final String? buttonText;
  final VoidCallback? onPressed;
  final bool? loading;
  final Color? buttonColor;

  //constructor
  CustomButton(
      {this.buttonText, this.onPressed, this.loading, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: buttonColor ?? Colors.blue),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  splashColor: Colors.white,
                  onTap: onPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                        child: loading == true
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )
                            : Text(
                                buttonText.toString(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
