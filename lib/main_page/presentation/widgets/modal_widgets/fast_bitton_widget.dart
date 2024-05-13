import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FastButtonWidget extends StatelessWidget {
  final String iconPath;
  final Color backgroundColor;
  final String text;
  final VoidCallback onTap;

  const FastButtonWidget({super.key,
    required this.iconPath,
    required this.backgroundColor,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: backgroundColor,
            ),
            height: 48,
            width: 48,
            child: SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(height: 8,),
          Text(text, style: Theme.of(context).textTheme.displaySmall),
        ],
      ),
    );
  }
}
