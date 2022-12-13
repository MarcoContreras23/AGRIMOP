import 'package:flutter/material.dart';


///information class to show the information of the onboarding
class InformationOnboarding extends StatelessWidget {
  const InformationOnboarding({
    Key? key,
    required this.label,
    required this.description,
  }) : super(key: key);

  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          key: Key(label),
          children: [
            _title(context),
            const SizedBox(height: 12),
            _desciption(),
          ],
        ),
      ),
    );
  }

  Widget _title(context) => Text(
        label,
        textAlign: TextAlign.center,
        style:  TextStyle(
          fontSize: 24,
          color:  Theme.of(context).primaryColor,
          fontWeight: FontWeight.w800,
        ),
      );

  Widget _desciption() => Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
      );
}
