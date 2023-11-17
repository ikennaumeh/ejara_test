import 'package:ejara_test/ui/bottomsheets/app_bottom_sheet.dart';
import 'package:ejara_test/ui/views/choose_payment_method/choose_payment_method_vm.dart';
import 'package:ejara_test/ui/widgets/full_screen_loading_indicator.dart';
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
    viewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<ChoosePaymentMethodVM>(
        create: (_) => viewModel,
        child: Consumer<ChoosePaymentMethodVM>(builder: (_, model, __) {
          if (model.isBusy) {
            return const FullScreenLoadingIndicator();
          }
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                 const SliverToBoxAdapter(
                  child: Column(
                    children: [
                    OneActionAppBar(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Choose a payment \nmethod",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 27,
                        color: Color(0xff393e7c),
                      ),
                    ),
                    WalletCard(),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(                          
                          "Select a payment method",
                          key: Key("select-a-payment-method"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff393e7c),
                          ),
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (model.paymentTypeList.isEmpty) {
                        return const SliverToBoxAdapter(child:  Padding(padding: EdgeInsets.only(top: 80), child: Text("Empty list")));
                      } else if (model.hasError) {
                        return SliverToBoxAdapter(child: Text(model.modelError));
                      }
                    return SliverList.separated(
                      itemCount: viewModel.paymentTypeList.length,
                      itemBuilder: (c, i) {
                          final payment = model.paymentTypeList.elementAt(i);
                          return PaymentMethodTile(
                            title: payment.titleEn,
                            subtitle: payment.descriptionEn,
                            icon: switch (i) {
                              0 => Icons.currency_bitcoin_sharp,
                              1 => Icons.phone_android_outlined,
                              _ => Icons.account_balance
                            },
                            ontap: () async {
                              final result = await showAppBottomSheet();
                              if (result == true) {
                                model.routeToNextScreen();
                              }
                            },
                          );
                        },
                        separatorBuilder: (c, i) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          );
                        },
                    );
                  }
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
