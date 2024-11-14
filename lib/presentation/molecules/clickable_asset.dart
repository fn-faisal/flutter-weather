import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClickableAsset extends StatelessWidget {
  final VoidCallback onTap;
  final String assetPath;
  final Color? color;

  const ClickableAsset({
    super.key, 
    required this.onTap, 
    required this.assetPath,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        assetPath,
        colorFilter: color != null ? ColorFilter.mode(
          color!, 
          BlendMode.srcIn
        ) : null,
      ),
    );
  }
}