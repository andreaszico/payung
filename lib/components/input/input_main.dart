import 'package:flutter/material.dart';

class IInputText extends StatelessWidget {
  final String label;
  final bool notNull;
  final TextEditingController? controller;

  const IInputText(
      {super.key, required this.label, this.notNull = false, this.controller});

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
        TextFormField(
          controller: controller,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38, width: 1),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
