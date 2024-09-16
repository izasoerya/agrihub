import 'package:agrihub/src/domain/entities/e_device.dart';
import 'package:agrihub/src/domain/services/s_device.dart';
import 'package:agrihub/src/utils/account.dart';
import 'package:agrihub/src/utils/textfield_handler.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AppendDeviceHandler {
  final TextEditingController formName;
  final TextEditingController formUID;
  final Uuid _uuid = Uuid();
  AppendDeviceHandler(this.formName, this.formUID);

  void addDevice(void Function() setState) {
    if (TextFieldHandler.validatorName(formName.text) == null &&
        TextFieldHandler.validatorID(formUID.text) == null) {
      DeviceService().addDevice(EntitiesDevice(
        uid: _uuid.v4(),
        userUID: userLoggedIn.uid,
        displayName: formName.text,
        plantUID: [formUID.text],
      ));
      setState();
    }
  }
}
