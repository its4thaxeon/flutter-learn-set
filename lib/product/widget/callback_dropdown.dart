import 'package:flutter/material.dart';

import '../../303/call_back_learn.dart';

class CallbackDropdown extends StatefulWidget {
  const CallbackDropdown({Key? key, required this.onUserSelected})
      : super(key: key);

  final void Function(CallbackUser user) onUserSelected;
  @override
  State<CallbackDropdown> createState() => _CallbackDropdownState();
}

class _CallbackDropdownState extends State<CallbackDropdown> {
  CallbackUser? _user;

  void _updateUser(CallbackUser? item) {
    setState(() {
      _user = item;
    });
    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallbackUser>(
        hint: const Text("Change character"),
        value: _user,
        items: CallbackUser.dummyUsers().map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(
              e.name,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontSize: 24, fontWeight: FontWeight.w300),
            ),
          );
        }).toList(),
        onChanged: _updateUser);
  }
}
