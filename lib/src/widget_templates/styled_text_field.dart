import 'package:flutter/material.dart';

class StyledTextField extends StatefulWidget {
  final String label;
  final String value;
  final String errorMessage;
  final TextChangedCallBack onTextChanged;

  const StyledTextField({
    Key key,
    this.label,
    this.value = '',
    this.errorMessage = '',
    this.onTextChanged,
  }) : super(key: key);

  @override
  _StyledTextFieldState createState() => _StyledTextFieldState();
}

class _StyledTextFieldState extends State<StyledTextField> {
  TextEditingController controller = TextEditingController();
  bool hasError;
  var _errorText = '';
  @override
  void initState() {
    controller.text = widget.value;
    hasError = false;
    _errorText = '${widget.errorMessage}';
    super.initState();
  }

  @override
  void didUpdateWidget(StyledTextField oldWidget) {
    controller.text = widget.value;
    hasError = widget.errorMessage.isNotEmpty;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              setState(() {
                if (widget.errorMessage.isNotEmpty && value.isEmpty) {
                  _errorText = '${widget.errorMessage}';
                  hasError = true;
                } else {
                  _errorText = '';
                  hasError = false;
                }
                widget.onTextChanged(value, hasError);
              });
            },
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(12.0),
                ),
              ),
              filled: true,
              hintText: widget.label,
              fillColor: Colors.white,
              labelText: widget.label,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, top: 3),
          child: hasError
              ? Text(
                  _errorText,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
              : Text(''),
        )
      ],
    ));
  }
}

typedef TextChangedCallBack = void Function(String text, bool hasError);
