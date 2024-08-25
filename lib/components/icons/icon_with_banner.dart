import 'package:flutter/material.dart';

class IconWithBanner extends StatelessWidget {
  final String? banner;
  final Icon icon;
  final double borderRadius;
  final double? width;
  final double? fontSize;
  final EdgeInsetsGeometry? paddingBanner;

  const IconWithBanner({
    super.key,
    required this.icon,
    this.banner = "",
    this.borderRadius = 12,
    this.width,
    this.fontSize,
    this.paddingBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        icon,
        if (banner!.isNotEmpty)
          Positioned(
            left: 10,
            top: -5,
            child: Container(
              width: width,
              height: 16,
              padding: paddingBanner,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(
                child: Text(
                  "$banner",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize ?? 12,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
