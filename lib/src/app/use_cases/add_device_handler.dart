import 'package:agrihub/src/utils/textfield_handler.dart';
import 'package:flutter/material.dart';

class AppendDeviceHandler {
  final TextEditingController formName;
  final TextEditingController formUID;

  AppendDeviceHandler(this.formName, this.formUID);

  void addDevice(void Function() setState) {
    if (TextFieldHandler.validatorName(formName.text) == null &&
        TextFieldHandler.validatorID(formUID.text) == null) {
      // TODO: Add device to database

      setState();
    }
  }
}
