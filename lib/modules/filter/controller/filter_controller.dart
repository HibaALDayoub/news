import 'package:get/get.dart';
import 'package:news_project/core/classes/status_request.dart';
import 'package:news_project/modules/filter/data/filter_data_imp.dart';

import '../../home/model/article_model.dart';
import '../data/name_country_static_data.dart';
import '../model/name_country_model.dart';

class FilterController extends GetxController {
  var firstSelected;
  dynamic secondSelected;
  List<NameCountryModel> countries = countriesList;
  List<ArticleModel> articlesByCountries = [];
  List<ArticleModel> articlesReverse = [];
  List<String> sortedList = ['Newest', 'Oldest'];
  // List<Article> news = [];
//صرت هون==========================
  FilterDataImp filterDataImp = FilterDataImp(httpMethods: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  filterByCountry() async {
    print(firstSelected.countryCode);
    String query = 'country=${firstSelected.countryCode}';

    statusRequest = StatusRequest.loading;
    update();
    var res = await filterDataImp.viewFilterData(query);
    update();
    res.fold((l) => statusRequest = StatusRequest.failure, (r) {
      statusRequest = StatusRequest.none;
      update();
      if (r["status"] == "ok") {
        List resCountriesList = r["articles"];
        articlesByCountries =
            resCountriesList.map((e) => ArticleModel.fromJson(e)).toList();
        articlesReverse = articlesByCountries.reversed.toList();
        update();
        print(resCountriesList);
      }
    });
  }

// changeSorted(String sorted) {
//     secondSelected = sorted;
//     sortedBy(selectedSorted);
//     update();
//   }
  @override
  void onInit() {
    firstSelected = countries[0];
    secondSelected = sortedList[0];
    filterByCountry();
    super.onInit();
  }
}
