import 'dart:ffi';

import 'package:first/202/cache/shared_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingState<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;
  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  void getDefaultValues() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? "");
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);

    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).scaffoldBackgroundColor))
              : const SizedBox()
        ],
        centerTitle: true,
        title: Text(_currentValue.toString()),
      ),
      body: TextField(
        onChanged: (value) {
          _onChangeValue(value);
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _removeValueButton(),
            _saveValueButton(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading;
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading;
      },
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading;
        await _manager.removeItem(SharedKeys.counter);
        changeLoading;
      },
      child: const Icon(Icons.remove),
    );
  }
}

abstract class LoadingState<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
