import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(
                  top: 15,
                  bottom: 12
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffaeb5ff)
                ),
                child: const Center(
                  child: Icon(Icons.folder_outlined, color: Colors.white,),
                ),
              ),
              const Text(
                "Ejara flex",
                style: TextStyle(
                  color: Color(0xff9598ba),
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 10,),
              const Text.rich(
                TextSpan(
                  text: "20,000",
                  style: TextStyle(
                    color: Color(0xff393e7c),
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                  children: [
                    TextSpan(
                      text: "CFA",
                      style: TextStyle(
                        color: Color(0xff9598ba),
                        fontSize: 22,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Divider(
            thickness: 2,
            color: Color(0xfff9f9fb),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Earnings per day",
                  style: TextStyle(
                    color: Color(0xffcecfde),
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  "10,000CFA",
                  style: TextStyle(
                    color: Color(0xffa7a9c4),
                    fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}