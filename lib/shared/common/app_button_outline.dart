import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/enums.dart';
import 'app_button.dart';

class AppButtonOutline extends StatefulWidget {
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final Function onTapButton;
  final double width;
  final double? height;
  final ButtonType buttonType;
  final Widget? prefixIcon;
  final Widget? suffixIcons;
  final Color? buttonColor;
  final Color? textColor;
  final bool? hasBorder;
  final AppButtonController? controller; // ✅ New controller

  AppButtonOutline({
    super.key,
    required this.buttonText,
    required this.onTapButton,
    this.width = 0,
    this.height,
    this.prefixIcon,
    this.suffixIcons,
    this.buttonColor,
    this.buttonTextStyle,
    this.textColor,
    this.hasBorder = false,
    this.controller,
    this.buttonType = ButtonType.ENABLED,
  });

  @override
  State<AppButtonOutline> createState() => _AppButtonOutlineState();
}

class _AppButtonOutlineState extends State<AppButtonOutline> {
  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = widget.controller?.isLoading ?? false;

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        if (widget.buttonType == ButtonType.ENABLED && !isLoading) {
          widget.onTapButton();
        }
      },
      child: Container(
        height: widget.height ?? 40.h,
        width: widget.width == 0 ? double.infinity : widget.width,
        decoration: BoxDecoration(
          border: widget.hasBorder == true
              ? Border.all(color: AppColors.initColors().primaryColor, width: 1)
              : null,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          color: Colors.transparent,
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 25.w,
                  height: 25.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      widget.textColor ?? AppColors.initColors().primaryColor,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.prefixIcon ?? const SizedBox.shrink(),
                    Flexible(
                      child: Text(
                        widget.buttonText,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style:
                            widget.buttonTextStyle ??
                            TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: AppDimensions.kFontSize12,
                              height: AppDimensions.kLineHeight12(24),
                              letterSpacing: AppDimensions.kLetterSpacing12(
                                -2.5,
                              ),
                              color: AppColors.initColors().textBlackColor1,
                            ),
                      ),
                    ),
                    widget.suffixIcons ?? const SizedBox.shrink(),
                  ],
                ),
        ),
      ),
    );
  }
}
