import 'package:flutter/material.dart';

class PaymentOptionCard extends StatelessWidget {
  final String title, subtitle;

  const PaymentOptionCard({
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(.1), spreadRadius: 1, blurRadius: 10, offset: const Offset(1, 3))
      ]),
      child: Row(
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xff494d86),
                )),
            margin: const EdgeInsets.only(left: 5, right: 10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: const Color(0xff494d86).withOpacity(.7), fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xffa5a7c3), fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}