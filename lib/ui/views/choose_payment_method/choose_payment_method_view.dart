import 'package:ejara_test/ui/bottomsheets/app_bottom_sheet.dart';
import 'package:ejara_test/ui/views/choose_payment_method/choose_payment_method_vm.dart';
import 'package:ejara_test/ui/widgets/one_action_app_bar.dart';
import 'package:ejara_test/ui/widgets/payment_method_tile.dart';
import 'package:ejara_test/ui/widgets/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoosePaymentMethodView extends StatefulWidget {
  const ChoosePaymentMethodView({super.key});

  @override
  State<ChoosePaymentMethodView> createState() => _ChoosePaymentMethodViewState();
}

class _ChoosePaymentMethodViewState extends State<ChoosePaymentMethodView> with AppBottomSheet {
  late ChoosePaymentMethodVM viewModel;

  @override
  void initState() {
    viewModel = ChoosePaymentMethodVM();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9fb),
      body: ChangeNotifierProvider<ChoosePaymentMethodVM>(
        create: (_) => viewModel,
        child: Consumer<ChoosePaymentMethodVM>(builder: (_, model, __) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const OneActionAppBar(),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Choose a payment \nmethod",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 27,
                      color: Color(0xff494d86),
                    ),
                  ),
                  const WalletCard(),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select a payment method",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xff494d86),
                        ),
                      ),
                    ),
                  ),
                  const PaymentMethodTile(
                    title: "Cash payment",
                    subtitle: "Fees: Offer",
                    icon: Icons.currency_bitcoin_rounded,
                  ),
                  PaymentMethodTile(
                    title: "Mobile money",
                    subtitle: "Fees: 200CFA",
                    icon: Icons.phone_android,
                    ontap: () async {
                      final result = await showAppBottomSheet();
                      if (result == true) {
                        model.routeToNextScreen();
                      }
                    },
                  ),
                  const PaymentMethodTile(
                    title: "Bank transfer",
                    subtitle: "Fees: Variable",
                    icon: Icons.account_balance,
                  ),
                  const PaymentMethodTile(
                    title: "Credit card",
                    subtitle: "Fees: Variable",
                    icon: Icons.credit_card,
                  ),
                  const PaymentMethodTile(
                    title: "Crypto-currency",
                    subtitle: "Fees:",
                    icon: Icons.wallet,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

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
