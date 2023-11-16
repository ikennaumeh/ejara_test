

import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final List<T> listData;
  final ValueChanged<T?> onChanged;
  final FocusNode? focusNode;
  final T? initialValue, selectedValue;
  final ValueNotifier<T?>? valueController;
  final FormFieldValidator<T>? validator;

  const CustomDropDown(
      {Key? key,
      required this.hintText,
      required this.listData,
      required this.onChanged,
      this.focusNode,
      this.initialValue,
      this.valueController,
      this.validator,
      this.selectedValue,
      this.labelText})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  ValueNotifier<T?>? valueController;
  T? _selectedValue;

  @override
  void initState() {
    _selectedValue = widget.selectedValue;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          value: _selectedValue,
          dropdownColor: Colors.white,
          enableFeedback: true,
          borderRadius: BorderRadius.circular(15),
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          icon: const SizedBox.shrink(),
          isExpanded: true,
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.labelText,
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xff494d86),
              size: 24,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xffb3b4cd),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xffb3b4cd),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffb3b4cd),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          items: widget.listData.map<DropdownMenuItem<T>>((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                item.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            );
          }).toList(),
          onChanged: (T? value) {
            if (value == null) {
              return;
            }

            if (value == _selectedValue) {
              return;
            }

            valueController?.value = value;
            setState(() {
              _selectedValue = value;
            });

            widget.onChanged(value);
          },
          focusNode: widget.focusNode,
        ),
      ),
    );
  }
}