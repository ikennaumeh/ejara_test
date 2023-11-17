import 'package:ejara_test/ui/bottomsheets/app_bottom_sheet_vm.dart';
import 'package:ejara_test/ui/widgets/payment_option_card.dart';
import 'package:ejara_test/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomModal extends StatelessWidget {
  const CustomModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.select((AppBottomSheetVM model) => model.isBusy)) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  const Text(
                    "Select the mobile money method",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff494d86),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Builder(builder: (context) {
                final List paymentSettings = context.select((AppBottomSheetVM model) => model.paymentSettingsMethods);
                if (paymentSettings.isEmpty) {
                  return const Center(
                    child: Text("List is empty"),
                  );
                }
                return ListView.separated(
                  itemCount: paymentSettings.length,
                  itemBuilder: (c, i) {
                    return const PaymentOptionCard(
                      title: "Money",
                      subtitle: "Mobile money",
                    );
                  },
                  separatorBuilder: (c, i) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "Or",
                        style: TextStyle(color: const Color(0xff494d86).withOpacity(.7)),
                      ),
                    ),
                    const Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  key: const Key("text-button"),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context, true);
                    }
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xfff3f4fe),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xff888ef1),
                            size: 20,
                          ),
                          Text("Add another mobile money method", style: TextStyle(color: Color(0xff888ef1))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              PrimaryButton(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                buttonConfig: ButtonConfig(
                  text: "Continue",
                  action: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        );
     
  }
}
