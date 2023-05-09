part of 'shared.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final bool isDisabled;
  final bool isLoading;
  final void Function() onPressed;
  final Color buttonColor;
  final Color labelColor;
  final double labelSize;
  final double height;
  final EdgeInsets? padding;
  final Color? borderColor;
  final double borderRadius;
  final double elevation;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.buttonColor = AppColors.black,
    this.labelColor = Colors.white,
    this.labelSize = 14,
    this.height = 44,
    this.padding,
    this.borderColor,
    this.borderRadius = 0,
    this.elevation = 1,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        padding: MaterialStateProperty.all(padding),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return buttonColor.withOpacity(0.2);
            }
            return buttonColor;
          },
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
      ),
      onPressed: isDisabled
          ? null
          : isLoading
              ? null
              : onPressed,
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: Center(
          child: isLoading
              ? const LoadingIndicator(
                  color: AppColors.white,
                )
              : Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: labelSize,
                  ),
                ),
        ),
      ),
    );
  }
}
