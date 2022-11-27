import 'package:first/product/extension/string_extension.dart';
import 'package:flutter/material.dart';

import '../viewModel/reqres_view_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({super.key});

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: isLoading ? const CircularProgressIndicator() : null),
      body: ListView.builder(
          itemCount: resources.length,
          itemBuilder: ((context, index) {
            return Card(
                color: Color(resources[index].color?.colorValue ?? 0),
                child: Text(isLoading ? "" : (resources[index].name ?? "")));
          })),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            changeLoading();
            await Future.delayed(const Duration(milliseconds: 500));
            changeLoading();
          },
          child: const Icon(Icons.refresh_outlined)),
    );
  }
}
