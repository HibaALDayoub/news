import 'package:get/get.dart';
import 'package:news_project/core/classes/status_request.dart';
import '../../home/model/article_model.dart';
import '../data/category_data_imp.dart';

class CategoryController extends GetxController {
  String categoryName = Get.arguments["categoryName"];
  CategoryDataImp categoryDataImp = CategoryDataImp(httpMethods: Get.find());
  List<ArticleModel> articles = [];
  StatusRequest statusRequest = StatusRequest.none;

  // HomeController controller = Get.find();
  getNewsData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoryDataImp.viewCategoryData(categoryName);
    update();
    print("_____________________________$response");
    response.fold((l) {
      print("_____________________________${l.message}");
      statusRequest = StatusRequest.failure;
      update();
    }, (r) {
      statusRequest = StatusRequest.none;
      update();
      if (r["status"] == "ok") {
        List responseHomeList = r["articles"];
        articles =
            responseHomeList.map((e) => ArticleModel.fromJson(e)).toList();
        update();

        print("_____________________________${responseHomeList.length}");
        // update();
      }
    });
  }

  @override
  void onInit() {
    getNewsData();
    super.onInit();
  }
}
