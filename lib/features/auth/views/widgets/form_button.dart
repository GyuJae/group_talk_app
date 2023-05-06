import 'package:flutter/material.dart';
import 'package:group_talk_app/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool _isFormValid;
  final String _text;
  final bool _isLoading;

  const FormButton({
    super.key,
    required bool isFormValid,
    required String text,
    required bool isLoading,
  })  : _isFormValid = isFormValid,
        _text = text,
        _isLoading = isLoading;

  final Duration duration = const Duration(
    milliseconds: 300,
  );

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: duration,
        height: Sizes.size48,
        decoration: BoxDecoration(
          color: _isFormValid
              ? Theme.of(context).primaryColor
              : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(Sizes.size8),
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: duration,
            style: TextStyle(
              color: _isFormValid ? Colors.white : Colors.grey.shade500,
              fontWeight: FontWeight.bold,
            ),
            child: _isLoading
                ? const Center(
                    child: SizedBox(
                      width: Sizes.size18,
                      height: Sizes.size18,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    ),
                  )
                : Text(
                    _text,
                  ),
          ),
        ),
      ),
    );
  }
}
