import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.buttonConfig,
    this.margin,
  });
  final ButtonConfig buttonConfig;
  final EdgeInsets? margin;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: margin,
      decoration: BoxDecoration(
        color: buttonConfig.disabled ? Colors.grey : const Color(0xff494d86),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: buttonConfig.disabled ? null : buttonConfig.action,
          borderRadius: BorderRadius.circular(10),
          highlightColor: buttonConfig.disabled
              ? null
              : const Color(0xff494d86).withOpacity(0.3),
          child: Center(
            child: Text(
                  buttonConfig.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
          ),
        ),
      ),
    );
  }
}

class ButtonConfig {
  ButtonConfig({
    required this.text,
    required this.action,
    this.disabled = false,
  });
  final String text;
  final bool disabled;
  final VoidCallback action;
}
