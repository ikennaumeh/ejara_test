import 'package:flutter/material.dart';

class PaymentMethodTile extends StatelessWidget {
  final String? title, subtitle;
  final IconData icon;
  final VoidCallback? ontap;

  const PaymentMethodTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xfff1f1fa),
              ),
              margin: const EdgeInsets.only(left: 20.0, right: 10),
              child: Icon(
                icon,
                size: 20,
                color: const Color(0xffa0a5f2),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "--",
                  style: TextStyle(
                    color: const Color(0xff494d86).withOpacity(.7),
                     fontSize: 15, 
                     fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subtitle ?? "--",
                  style: const TextStyle(color: Color(0xffa5a7c3), fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}