import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// This is a customizable text box widget which  displays a Cupertino (iOS) picker to select a date.
class CustomizableCupertinoDateTextBox extends StatefulWidget {
  CustomizableCupertinoDateTextBox({
    @required this.initialValue,
    @required this.onDateChange,
    @required this.hintText,
    this.pickerBackgroundColor = CupertinoColors.systemBackground,
    this.prefixIcon,
    this.controller,
    this.dateFormatter,
    this.width,
    this.height,
    this.hintTextStyle,
    this.textFieldTextStyle,
    this.minimumYear,
    this.maximumYear,
    this.textFieldFillColor,
  });

  /// The initial value which will be displayed in the text box
  final DateTime initialValue;

  /// The initial minimum year in the picker
  final int minimumYear;

  /// The initial maximum year in the picker
  final int maximumYear;

  /// The function to be called if the selected date changes
  final Function onDateChange;

  /// The text to be displayed if no initial value is given
  final String hintText;

  /// Width of the TextField
  final double width;

  /// Height of the TextField
  final double height;

  /// The color of the text within the text box
  final Color textFieldFillColor;

  /// The background color of the cupertino picker
  final Color pickerBackgroundColor;

  /// The lead icon (Prefix)
  final Icon prefixIcon;

  /// This is the controller which will be used to get/set (Control) the Field
  final TextEditingController controller;

  /// Specifies the format of the Date
  final DateFormat dateFormatter;

  /// Specifies the TextStyle of the TextField hint
  final TextStyle hintTextStyle;

  /// Specifies the TextStyle of the TextField Text
  final TextStyle textFieldTextStyle;

  @override
  _CustomizableCupertinoDateTextBoxState createState() =>
      _CustomizableCupertinoDateTextBoxState();
}

class _CustomizableCupertinoDateTextBoxState
    extends State<CustomizableCupertinoDateTextBox> {
  /// Dimensions
  double _width;
  double _height;

  /// Date
  int _minimumYear;
  int _maximumYear;
  DateFormat _dateFormat;
  String _currentDate;

  /// Style
  Icon _prefixIcon;
  Color _pickerBackgroundColor;
  Color _textFieldFillColor;
  TextStyle _hintTextStyle;
  TextStyle _textFieldTextStyle;

  /// Functions
  TextEditingController _controller;
  Function _onDateChanged;

  @override
  void initState() {
    super.initState();
    _checkDimensions(widget.height, widget.width);
    _checkColors(widget.pickerBackgroundColor, widget.textFieldFillColor);
    _checkIfControllerProvided(widget.controller);
    _checkDateFormatter(widget.dateFormatter);
    _checkInitialDate(widget.initialValue);
    _checkPrefixIcon(widget.prefixIcon);
    _setDateInterval(widget.minimumYear, widget.maximumYear);
    _onDateChang(widget.onDateChange);
    _checkTextStyles(widget.hintTextStyle, widget.textFieldTextStyle);
  }

  void callCallback() {
    widget.onDateChange(_currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      child: TextField(
        readOnly: true,
        controller: _controller,
        onTap: () async {
          FocusScope.of(context).requestFocus(new FocusNode());
          showModalBottomSheet(
              context: context,
              builder: (BuildContext builder) {
                return Container(
                    height: MediaQuery.of(context).copyWith().size.height / 3,
                    child: CupertinoDatePicker(
                      backgroundColor: _pickerBackgroundColor,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: _onDateChanged,
                      minimumYear: _minimumYear,
                      maximumYear: _maximumYear,
                      mode: CupertinoDatePickerMode.date,
                    ));
              });
        },
        style: _textFieldTextStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          labelText: widget.hintText,
          labelStyle: _hintTextStyle,
          filled: true,
          fillColor: _textFieldFillColor,
          prefixIcon: _prefixIcon,
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black45)),
        ),
      ),
    );
  }

  ///****** Check the provided parameters and fallback to default if needed ******///

  String _formatDate(DateTime dateTime) {
    return _dateFormat.format(dateTime).toString();
  }

  void _checkInitialDate(DateTime dateTime) {
    if (dateTime == null) {
      _currentDate = _formatDate(DateTime.now()).toString();
    } else {
      _currentDate = _formatDate(dateTime);
    }
  }

  void _checkDateFormatter(DateFormat dateFormat) {
    if (dateFormat == null) {
      _dateFormat = DateFormat('yyyy-MM-dd');
    } else {
      _dateFormat = dateFormat;
    }
  }

  void _checkIfControllerProvided(TextEditingController controller) {
    if (controller == null) {
      _controller = TextEditingController();
    } else {
      _controller = controller;
    }
  }

  void _checkDimensions(double height, double width) {
    // Check for dimensions
    if (height == null && width == null) {
      // Fallback to default
      _height = 60.0;
      _width = 250.0;
    } else {
      _height = height;
      _width = width;
    }
  }

  void _checkColors(Color pickerBackgroundColor, Color textFieldFillColor) {
    if (pickerBackgroundColor == null) {
      _pickerBackgroundColor = CupertinoColors.systemBackground;
    } else {
      _pickerBackgroundColor = pickerBackgroundColor;
    }

    if (textFieldFillColor != null) {
      _textFieldFillColor = textFieldFillColor;
    }
  }

  void _checkPrefixIcon(Icon prefixIcon) {
    if (prefixIcon == null) {
      _prefixIcon = Icon(
        CupertinoIcons.calendar,
        size: 20,
        color: Colors.black,
      );
    } else {
      _prefixIcon = prefixIcon;
    }
  }

  void _setDateInterval(int minimumYear, int maximumYear) {
    if (minimumYear == null) {
      _minimumYear = 1950;
    } else {
      _minimumYear = minimumYear;
    }

    if (maximumYear == null) {
      _maximumYear = 2100;
    } else {
      _maximumYear = maximumYear;
    }
  }

  void _onSelectedDate(DateTime date) {
    setState(() {
      _controller.text = _formatDate(date);
    });
  }

  void _onDateChang(Function onDateChange) {
    if (onDateChange == null) {
      _onDateChanged = (DateTime pickedDate) {
        _onSelectedDate(pickedDate);
      };
    } else {
      _onDateChanged = onDateChange;
    }
  }

  void _checkTextStyles(TextStyle hintTextStyle, TextStyle textFieldTextStyle) {
    if (hintTextStyle == null) {
      _hintTextStyle = TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal);
    } else {
      _hintTextStyle = hintTextStyle;
    }

    if (textFieldTextStyle == null) {
    } else {
      _textFieldTextStyle = textFieldTextStyle;
    }
  }
}
