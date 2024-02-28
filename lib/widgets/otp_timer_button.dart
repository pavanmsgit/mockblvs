import 'dart:async';
import 'package:flutter/material.dart';

enum ButtonState { enable_button, timer }


class OtpTimerButton extends StatefulWidget {

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The button text
  final Text text;

  /// the loading indicator
  final ProgressIndicator? loadingIndicator;

  /// Length of the timer in second
  final int duration;

  /// Manual control button state [ButtonState]
  ///
  /// When controller is not null auto start timer is disabled on pressed button
  final OtpTimerButtonController? controller;

  /// Height of the button
  final double? height;

  /// Background color of the button
  final Color? backgroundColor;

  /// Color of the text
  final Color? textColor;

  /// Color of the loading indicator
  final Color? loadingIndicatorColor;


  /// The radius of the button border
  final double? radius;

  const OtpTimerButton(
      {Key? key,
        required this.onPressed,
        required this.text,
        this.loadingIndicator,
        required this.duration,
        this.controller,
        this.height,
        this.backgroundColor,
        this.textColor,
        this.loadingIndicatorColor,

        this.radius})
      : super(key: key);

  @override
  _OtpTimerButtonState createState() => _OtpTimerButtonState();
}

class _OtpTimerButtonState extends State<OtpTimerButton> {
  Timer? _timer;
  int _counter = 0;
  ButtonState _state = ButtonState.timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    widget.controller?._addListeners(_startTimer, _enableButton);
  }

  _startTimer() {
    _timer?.cancel();
    _state = ButtonState.timer;
    _counter = widget.duration;

    setState(() {});

    _timer = new Timer.periodic(
      Duration(seconds: 1),
          (Timer timer) {
        if (_counter == 0) {
          _state = ButtonState.enable_button;
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _counter--;
          });
        }
      },
    );
  }


  _enableButton() {
    _state = ButtonState.enable_button;
    setState(() {});
  }

  _childBuilder() {
    switch (_state) {
      case ButtonState.enable_button:
        return widget.text;

      case ButtonState.timer:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.text,
            Text(
              ' in $_counter',
              style: widget.text.style,
            ),
          ],
        );
    }
  }

  _roundedRectangleBorder() {
    if (widget.radius != null) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.radius!),
      );
    } else {
      return null;
    }
  }

  _onPressedButton() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
    if (widget.controller == null) {
      _startTimer();
    }
  }

  _buildButton() {
    return GestureDetector(
      onTap: _state == ButtonState.enable_button ? _onPressedButton : null,
      child: _childBuilder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: _buildButton(),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class OtpTimerButtonController {
  late VoidCallback _startTimerListener;
  late VoidCallback _loadingListener;
  late VoidCallback _enableButtonListener;

  _addListeners(startTimerListener, enableButtonListener) {
    this._startTimerListener = startTimerListener;
    this._enableButtonListener = enableButtonListener;
  }

  /// Notify listener to start the timer
  startTimer() {
    _startTimerListener();
  }


  /// Notify listener to enable button
  enableButton() {
    _enableButtonListener();
  }
}