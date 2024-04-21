import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assurance/core/styles/style.dart';

class InputTextFormWidget extends StatelessWidget {
  const InputTextFormWidget(
      {super.key,
      this.isRequired = false,
      this.padding,
      this.validator,
      required this.label,
      this.keyboardType,
      this.onChanged,
      this.controller,
      this.maxLines,
      this.maxLength,
      this.prefixText,
      this.inputFormatters,
      this.visiblePrefix = false,
      this.onSaved,
      this.suffixIcon,
      this.prefixIcon,
      this.onSubmit,
      h});

  final bool isRequired;
  final EdgeInsetsGeometry? padding;
  final FormFieldValidator<String>? validator;
  final String label;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function(String?)? onSubmit;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final String? prefixText;
  final bool visiblePrefix;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Widget?
      prefixIcon; /* 
ScrollController controllerscroll = ScrollController(); */
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.fromLTRB(16, 3, 16, 6),
      margin: const EdgeInsets.all(8),
      decoration: raisedDecoration,
      child: TextField(
        /* scrollController: controllerscroll, */
        inputFormatters: inputFormatters,
        controller: controller,
        enableInteractiveSelection: true,
        enabled: true,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onSubmitted: onSubmit,
        scrollPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        decoration: InputDecoration(
          /* errorText: isRequired && validator == null   ? (value) => value == null || value.isEmpty ? '' : null
            : validator, */
          contentPadding: const EdgeInsets.only(
            right: 10,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: InputBorder.none,
          hintText: label,
          hintStyle: const TextStyle(
            color: Colors.black38,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
