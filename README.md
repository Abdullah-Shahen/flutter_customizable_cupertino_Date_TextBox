# Customizable Flutter Cupertino Date TextBox

<img src="https://user-images.githubusercontent.com/33698941/103181723-8b124980-48a4-11eb-9c20-9e35198aa0ae.png" width="300"/> 
<img src="https://user-images.githubusercontent.com/33698941/103181731-9f564680-48a4-11eb-8551-cc9eac9762cb.png" width="300"/>

This is a customizable flutter Cupertino text box which can be used to select a date with CupertinoDatePicker.

This library provides you with the following:
- Text Box / Text Field with multiple features to customize its style (e.g. Dimensions, Style, Icon, etc.)
- Date callback can be used to get result date value

## Usage

Provide the two required parameters of `CustomizableCupertinoDateTextBox` and you're good to go, e.g.:
```dart
CustomizableCupertinoDateTextBox(
    initialValue: DateTime.now(),
    hintText: 'Hint Text')
    );
```

## Parameters documentation
All optinal values will be set to default if nothing provided.
|     Parameter     |      Type     |  Description                                               |  Required  |
|:-------------------|:-------------|:------------------------------------------------------------|:------------|
| initialValue      |  DateTime     |  initial value which will be displayed in the text box     |  YES       |
| hintText          |  String       |  text to be displayed if no initial value is given |  YES       |
| onDateChange      |  Function     |  function to be called if the selected date changes        |  YES       |
| pickerBackgroundColor  |  Color       |  background color of the cupertino picker |  Optional       |
| textFieldFillColor |  Color       |  color of the text within the text box |  Optional       |
| prefixIcon  |  Icon       |  lead icon (Prefix) which will be displayed on the left side of the text box |  Optional       |
| controller  |  TextEditingController       |  controller which will be used to get/set (Control) the Field |  Optional       |
| dateFormatter |  DateFormat       |  Specifies the format of the Date e.g. (ddMMyyyy)|  Optional  |
| hintTextStyle |  TextStyle       |  Specifies the TextStyle of the TextField hint      |  Optional |
| textFieldTextStyle  |  TextStyle       |  Specifies the TextStyle of the TextField Text |  Optional |
| width |  int       | Width of the TextField  |  Optional       |
| height |  int       | height of the TextField  |  Optional       |

## Usage Example
Here you can find the usage example: [Demo-App](https://github.com/Abdullah-Benomar-Shahen/flutter_customizable_cupertino_Date_TextBox/blob/main/example/lib/main.dart)

## Bugs & Future Requests
If you run into problems, feel free to open an issue.<br/>That library is missing a feature? please create an issue on Github and I'll take a look at it.
<br/>Pull request are always welcome.

------
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
