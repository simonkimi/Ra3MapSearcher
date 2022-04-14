import 'package:flutter/cupertino.dart';

Future<bool?> showCupertinoConfirmDialog({
  required BuildContext context,
  String? title,
  String? content,
  bool showCancel = false,
  String? confineText = '确认',
  String? cancelText = '取消',
}) {
  return showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: [
          if (showCancel)
            CupertinoDialogAction(
              child: Text(cancelText ?? '取消'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          CupertinoDialogAction(
            child: Text(confineText ?? '确认'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
