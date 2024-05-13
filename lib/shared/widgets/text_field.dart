import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double padding;
  final VoidCallback? onTap;
  final void Function(String)? onSubmitted;
  final ValueChanged<String>? onChanged;

  const CustomTextField({super.key,
    required this.controller,
    required this.hintText,
    this.padding = 0.0,
    this.onTap,
    this.onSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onSubmitted: (v) {
        onSubmitted?.call(v);
      },
      keyboardType: TextInputType.text,
      enableInteractiveSelection: false,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^[\u0400-\u04FF\u0500-\u052F\u2DE0-\u2DFF\u2E80-\u2EFF\u0600-\u06FF\s\-]+$')),
      ],
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
        decorationThickness: 0,
      ),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: padding),
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displayMedium
            ?.copyWith(color: const Color(0xFF9F9F9F)),
      ),
      onTap: onTap,
    );
  }
}
