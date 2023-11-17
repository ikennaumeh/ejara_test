import 'package:ejara_test/ui/views/add_mobile_money/add_mobile_money_vm.dart';
import 'package:ejara_test/ui/widgets/custom_drop_down.dart';
import 'package:ejara_test/ui/widgets/one_action_app_bar.dart';
import 'package:ejara_test/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMobileMoneyView extends StatefulWidget {
  const AddMobileMoneyView({super.key});

  @override
  State<AddMobileMoneyView> createState() => _AddMobileMoneyViewState();
}

class _AddMobileMoneyViewState extends State<AddMobileMoneyView> {
  late AddMobileMoneyVM viewModel;

  @override
  void initState() {
    viewModel = AddMobileMoneyVM();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ChangeNotifierProvider<AddMobileMoneyVM>(
          create: (_) => viewModel,
          child: Consumer<AddMobileMoneyVM>(builder: (_, model, __) {
            List<Widget> stackedChildren = [content, footer];

            return Stack(
              alignment: Alignment.bottomCenter,
              children: stackedChildren,
            );
          }),
        ),
      ),
    );
  }

  Widget get content {
    return SafeArea(
      child: ListView(children: [
        const OneActionAppBar(
          iconData: Icons.close,
        ),
        const SizedBox(
          height: 15,
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "New mobile money",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 27,
              color: Color(0xff393e7c),
            ),
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Choose the mobile operator",
            style: TextStyle(color: Color(0xffabafc8), fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        CustomDropDown(
          hintText: "Select item",
          listData: const ["Orange Money", "MTN Mobile Money"],
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Phone number",
            style: TextStyle(color: Color(0xffabafc8), fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              keyboardType: TextInputType.number,
            )),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Full name",
            style: TextStyle(color: Color(0xffabafc8), fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              keyboardType: TextInputType.name,
            )),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Switch.adaptive(
                activeColor: const Color(0xff393e7c),
                value: viewModel.value,
                onChanged: viewModel.toggleSwitch,
              ),
            ),
            const Text("Save as payment method"),
          ],
        ),
      ]),
    );
  }

  Widget get footer {
    var queryData = MediaQuery.of(context);
    var bottomInset = queryData.viewInsets.bottom;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Builder(builder: (context) {
        if (bottomInset != 0) {
          return const SizedBox.shrink();
        }
        return PrimaryButton(
          margin: const EdgeInsets.all(20),
          buttonConfig: ButtonConfig(
              text: "Continue",
              action: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              }),
        );
      }),
    );
  }
}
