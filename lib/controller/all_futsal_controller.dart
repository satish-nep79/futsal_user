import 'package:flutter/material.dart';
import 'package:futsoul_user/repo/general/favorite_repo.dart';
import 'package:futsoul_user/repo/general/futsals_repo.dart';
import 'package:get/state_manager.dart';

import '../models/futsals.dart';

class AllFutsalController extends GetxController{

  RxList<Futsal> futsals = RxList<Futsal>();
  RxBool isLoading = RxBool(false);
  RxnInt nextPage = RxnInt();

  final ScrollController scrollController = ScrollController();


  

  @override
  void onInit() {
    scrollListner();
    getFutsals();
    super.onInit();
  }

  void scrollListner() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (nextPage.value != null) getMoreFutsals();
      }
    });
  }

  void getFutsals() async {
    isLoading.value = true;
    futsals.clear();
    await FutsalRepo.getFutsals(
      onSuccess: (futsals, nextPage) {
        isLoading.value = false;
        this.futsals.addAll(futsals);
        this.nextPage.value = nextPage;
      },
      onError: (message) {},
    );
  }

  void getMoreFutsals() async {
    await FutsalRepo.getFutsals(
      currentPage: nextPage.value,
      onSuccess: (futsals, nextPage) {
        this.futsals.addAll(futsals);
        this.nextPage.value = nextPage;
      },
      onError: (message) {},
    );
  }

}