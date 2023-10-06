import 'package:flutter/material.dart';

class RowComponent extends StatelessWidget {
  const RowComponent(
      {super.key,
      this.horizantalpadding,
      this.verticalpadding,
      this.data,
      this.value,
      this.width,
      this.dataflex,
      this.valueflex,
      this.color,
      this.fontsize,
      this.fontweight,
      this.iconflex,
      this.height,
      this.valueTextColor});
  final double? horizantalpadding;
  final double? verticalpadding;
  final String? data;
  final String? value;
  final double? width;
  final int? dataflex;
  final int? valueflex;
  final int? iconflex;
  final Color? color;
  final Color? valueTextColor;
  final double? fontsize;
  final FontWeight? fontweight;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizantalpadding ?? 0.0,
          vertical: verticalpadding ?? 2.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: dataflex ?? 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 4.0),
                  child: Text(
                    data ?? '',
                    style: TextStyle(
                      color: color,
                      fontSize: fontsize,
                      fontWeight: fontweight,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: valueflex ?? 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4.0),
                    child: Text(
                      value ?? '',
                      style: TextStyle(
                        color: valueTextColor ?? Colors.grey[800],
                        fontSize: fontsize,
                        fontWeight: fontweight,
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 3,
          )
        ],
      ),
    );
  }
}
