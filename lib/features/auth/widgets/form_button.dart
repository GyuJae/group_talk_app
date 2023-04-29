import 'package:flutter/material.dart';
import 'package:group_talk_app/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required bool isFormValid,
    required String text,
  })  : _isFormValid = isFormValid,
        _text = text;

  final bool _isFormValid;
  final String _text;

  final Duration duration = const Duration(
    milliseconds: 300,
  );

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: duration,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          color: _isFormValid
              ? Theme.of(context).primaryColor
              : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(Sizes.size8),
        ),
        child: AnimatedDefaultTextStyle(
          duration: duration,
          style: TextStyle(
            color: _isFormValid ? Colors.white : Colors.grey.shade500,
            fontWeight: FontWeight.bold,
          ),
          child: Text(
            _text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
