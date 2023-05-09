part of 'shared.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  final bool secureText;
  final Function? onTapTrailingIcon;
  final Widget? leadingIcon;
  final void Function(String value)? onSubmit;
  final void Function(String value)? onChanged;
  final TextInputType keyboardType;
  final bool isRequired;
  final bool isInputArea;
  final bool isDisabled;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool withHorizontalPadding;
  final bool isError;
  final String errorMsg;
  final bool isLabel;

  const CustomInput({
    super.key,
    this.controller,
    this.label,
    this.placeholder,
    this.secureText = false,
    this.onTapTrailingIcon,
    this.leadingIcon,
    this.onSubmit,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isRequired = false,
    this.isDisabled = false,
    this.isInputArea = false,
    this.formatter,
    this.validator,
    this.initialValue,
    this.withHorizontalPadding = false,
    this.isError = false,
    this.errorMsg = '',
    this.isLabel = true,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool showValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isLabel
            ? widget.label != null
                ? Column(
                    children: [
                      Text(widget.label!),
                      const SizedBox(height: 8),
                    ],
                  )
                : const SizedBox()
            : const SizedBox(),
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: widget.isDisabled ? Colors.grey[200] : Colors.black12,
            borderRadius: BorderRadius.circular(4),
            // border: Border.all(color: Colors.red, width: 1),
          ),
          //height: widget.isInputArea ? null : 40,
          child: TextFormField(
            enabled: !widget.isDisabled,
            onChanged: widget.onChanged,
            obscureText: widget.secureText ? showValue : false,
            // style: Theme.of(context).textTheme.bodyText1,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            onFieldSubmitted: widget.onSubmit,
            minLines: widget.isInputArea ? 4 : 1,
            maxLines: widget.isInputArea ? 4 : 1,
            decoration: widget.isLabel
                ? InputDecoration(
                    hintText: widget.placeholder,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: widget.withHorizontalPadding ? 6 : 0,
                      vertical: 6,
                    ),
                    //labelText: widget.label,
                    //border: const OutlineInputBorder(),
                    border: InputBorder.none,
                    prefixIcon: widget.leadingIcon,
                    suffixIcon: widget.secureText
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                showValue = !showValue;
                              });
                            },
                            child: showValue
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: AppColors.primary,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: AppColors.primary,
                                  ),
                          )
                        : null,
                  )
                : InputDecoration(
                    hintText: widget.placeholder,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: widget.withHorizontalPadding ? 6 : 0,
                      vertical: 6,
                    ),
                    labelText: widget.label,
                    //border: const OutlineInputBorder(),
                    border: InputBorder.none,
                    prefixIcon: widget.leadingIcon,
                    suffixIcon: widget.secureText
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                showValue = !showValue;
                              });
                            },
                            child: showValue
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: AppColors.primary,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: AppColors.primary,
                                  ),
                          )
                        : null,
                  ),
          ),
        ),
        widget.isError
            ? Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  widget.errorMsg,
                  style: CustomTextStyles.remark,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
