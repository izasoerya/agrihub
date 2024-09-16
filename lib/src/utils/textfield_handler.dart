import 'package:flutter/material.dart';

class TextFieldHandler {
  void clearTextField(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      controller.clear();
    }
  }

  static get validatorEmail => email;
  static get validatorPassword => password;
  static get validatorName => name;
  static get validatorID => id;

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? id(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your ID';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
