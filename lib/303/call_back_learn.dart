import 'package:first/product/widget/button/answer_button.dart';
import 'package:flutter/material.dart';

import '../product/widget/button/loading_button.dart';
import '../product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: CallbackDropdown(onUserSelected: (CallbackUser user) {
            print(user);
          })),
          AnswerButton(
            onNumber: ((number) {
              return number % 3 == 1;
            }),
          ),
          LoadingButton(
              title: "Save",
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
              })
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final String id;

  CallbackUser(this.name, this.id);

  static List<CallbackUser> dummyUsers() {
    return [
      CallbackUser("Axeon", "IV"),
      CallbackUser("pneum", "L"),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallbackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
