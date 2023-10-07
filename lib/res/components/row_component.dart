import 'package:flutter/material.dart';

class RowComponent extends StatelessWidget {
  const RowComponent({
    super.key,
    this.horizantalpadding,
    this.verticalpadding,
    this.data,
    this.value,
    this.dataflex,
    this.valueflex,
    this.color,
    this.fontsize,
    this.fontweight,
  });
  final double? horizantalpadding;
  final double? verticalpadding;
  final String? data;
  final String? value;
  final int? dataflex;
  final int? valueflex;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontweight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${data ?? ''}",
                    style: TextStyle(
                      color: color,
                      fontSize: fontsize,
                      fontWeight: fontweight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(":"),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Text(
                  value ?? '',
                  style: TextStyle(
                    color: color,
                    fontSize: fontsize,
                    fontWeight: fontweight,
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
