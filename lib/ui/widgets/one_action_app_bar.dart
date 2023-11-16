import 'package:flutter/material.dart';

class OneActionAppBar extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onActionPress;
  final double height;
  final bool hasBackBtnShadow;
  final bool hide;

  const OneActionAppBar(
      {super.key, this.iconData = Icons.arrow_back_ios_new_rounded,
      this.onActionPress,
      this.height = 56,
      this.hide = false,
      this.hasBackBtnShadow = true});

  @override
  Widget build(BuildContext context) {
    if (hide) {
      return SizedBox(
        height: height,
      );
    }
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.transparent,
      padding: const EdgeInsets.only(left: 0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          List<Widget> children = [
            BackButton(
              iconData: iconData,
              onBackPress: onActionPress,
              hasShadow: hasBackBtnShadow,
            )
          ];

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
        },
      ),
    );
  }
}

class BackButton extends StatelessWidget {
    final IconData? iconData;
  final VoidCallback? onBackPress;
  final bool hasShadow;


  const BackButton({super.key, this.iconData, this.onBackPress, this.hasShadow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xfff1f1fa),
      ),
      margin: const EdgeInsets.only(left: 20.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            onBackPress?.call();

            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Icon(
              iconData ?? Icons.arrow_back_rounded,
              size: 20,
              color: const Color(0xffa0a5f2),
            ),
          ),
        ),
      ),
    );
  }
}