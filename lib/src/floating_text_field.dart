import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String? initialValue;
  final String? errorText;
  final Function(String)? onChanged;
  final bool isEnabled;
  final double? width;
  final double? height;
  final Color? errorBorderColor;
  final Color? borderColor;
  final double? borderWidth;
  final Color? focusedBorderColor;
  final Color? labelTextColor;
  final Color? textColor;
  final Color? focusLabelTextColor;
  final Color? focusTextColor;
  final Color? backGroundColor;
  final double? labelTextFontSize;
  final double? textFontSize;

  const CustomTextField(
      {super.key,
      required this.labelText,
      this.initialValue,
      this.errorText,
      this.onChanged,
      required this.isEnabled,
      this.width,
      this.height,
      this.borderColor,
      this.errorBorderColor,
      this.borderWidth,
      this.focusedBorderColor,
      this.labelTextColor,
      this.textColor,
      this.focusLabelTextColor,
      this.focusTextColor,
      this.backGroundColor,
      this.labelTextFontSize,
      this.textFontSize});

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.errorText != null ? 0 : 12,
        ),
        Container(
          width: widget.height ?? 326,
          height: widget.width ?? 56,
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          decoration: BoxDecoration(
            color: widget.backGroundColor ?? const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: widget.errorText != null
                  ? widget.errorBorderColor ?? Colors.red
                  : _isFocused
                      ? widget.focusedBorderColor ?? const Color(0xFF141414)
                      : !widget.isEnabled
                          ? widget.borderColor ?? const Color(0xFFDDDEE1)
                          : const Color(0xFFDDDEE1),
              width: widget.borderWidth ?? 1.0,
            ),
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: widget.onChanged,
            enabled: widget.isEnabled,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: widget.labelTextFontSize ?? 12,
                  color: _isFocused
                      ? widget.focusLabelTextColor ?? const Color(0xFF666666)
                      : widget.labelTextColor ?? const Color(0xFFA8A8A8),
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              errorBorder: InputBorder.none,
              border: InputBorder.none,
            ),
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: widget.textFontSize ?? 14,
                color: widget.isEnabled
                    ? widget.focusTextColor ?? const Color(0xFF1B1C1D)
                    : widget.textColor ?? const Color(0xFFA8A8A8),
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget.errorText != null ? 0 : 12,
        ),
        if (widget.errorText != null)
          Container(
            width: 326,
            padding: const EdgeInsets.fromLTRB(11.0, 4.0, 11.0, 0.0),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Iconerror.svg',
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    widget.errorText!,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: widget.textFontSize ?? 14,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      color: widget.errorText != null
                          ? widget.errorBorderColor ?? const Color(0xFFED3433)
                          : widget.borderColor ?? const Color(0xFF666666),
                    ),
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
