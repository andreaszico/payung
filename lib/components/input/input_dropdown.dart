import 'package:flutter/material.dart';

class InputDropdown extends StatelessWidget {
  final List<String> option;
  final String label;
  final String selected;
  final Function(String)? onChange;

  final bool notNull;

  const InputDropdown(
      {super.key,
      required this.option,
      required this.label,
      required this.selected,
      this.onChange,
      this.notNull = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              if (notNull) ...[
                const TextSpan(
                  text: "* ",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Colors.red,
                  ),
                ),
              ],
              TextSpan(
                text: label.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        DropdownButtonFormField<String>(
          value: selected,
          onChanged: (String? value) {
            onChange!(value!);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38, width: 1),
            ),
          ),
          items: option.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
