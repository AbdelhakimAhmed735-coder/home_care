import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProviderExperinceFiled extends StatelessWidget {
  const ProviderExperinceFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            hintText: 'Enter your experience',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
