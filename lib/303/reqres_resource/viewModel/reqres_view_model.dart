import 'package:dio/dio.dart';
import 'package:first/202/cache/shared_learn_cache.dart';
import 'package:first/303/reqres_resource/model/resource_model.dart';
import 'package:first/303/reqres_resource/service/reqres_service.dart';
import 'package:first/product/service/project_dio.dart';
import 'package:first/product/service/project_network_manager.dart';
import 'package:flutter/material.dart';

import '../view/reqres_view.dart';

abstract class ReqresViewModel extends LoadingState<ReqresView>
    with ProjectDioMixin {
  late final IReqresService reqresService;

  List<Data> resources = [];
  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeaderToToken("axeon");
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
