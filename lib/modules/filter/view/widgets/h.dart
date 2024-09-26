//   class SearchingController extends GetxController {

//   late CountryModel selectedCountry;
//   late String selectedSorted;
  
//   // List<CountryModel> countries = countriesList;
//   // List<String> sortedList = ['Newest', 'Oldest'];
//   List<Article> news = [];
//   List<Article> reversedNews = [];
//   TextEditingController search = TextEditingController();
//   // StatusRequest statusRequest = StatusRequest.none;
//   // NewsData newsData = NewsData(Get.find());
//   @override
//   void onInit() {
//     selectedCountry = countries[0];
//     selectedSorted = sortedList[0];
//     filterByCountry();
//     super.onInit();
//   }

//   changeCountry(CountryModel countryModel) {
//     selectedCountry = countryModel;
//     filterByCountry();
//     update();
//   }

//   changeSorted(String sorted) {
//     selectedSorted = sorted;
//     sortedBy(selectedSorted);
//     update();
//   }

//   filterByCountry() async {
//     print(selectedCountry.countryCode);
//     String query = 'country=${selectedCountry.countryCode}';
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await newsData.getNewsData(query: query);
//     statusRequest = handilingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == 'ok') {
//         List json = response['articles'];
//         news = json.map((e) => Article.fromJson(e)).toList();
//         reversedNews = news.reversed.toList();
//       }
//       statusRequest = StatusRequest.none;
//       update();
//     } else {
//       statusRequest = StatusRequest.faliure;
//       update();
//     }
//   }

//   sortedBy(String date) async {
//     if (date == 'Oldest') {
//       reversedNews = news.reversed.toList();
//       update();
//     } else {
//       news;
//       update();
//     }
//   }
// }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
//   child
  
  
  
  
  
  
  
  
  
  
  
  
  
//   : SearchFilter(
//                           filterBy: 'Country',
//                           onChanged: (val) {
//                             controller.changeCountry(val);
//                           },
//                           selectedValue: controller.selectedCountry,
//                          items=== list: controller.countries,
//                           isCountries: true,
//                         )),
//                     Expanded(
//                         flex: 1,
//                         child: SearchFilter(
//                           filterBy: 'Sorted By',
//                           onChanged: (val) {
//                             controller.changeSorted(val);
//                           },
//                           selectedValue: controller.selectedSorted,
//                           isCountries: false,
//                           sortList: controller.sortedList,
//                         ))
//                         // +++++++++++++++
//                          final String filterBy;
//   final dynamic selectedValue;
//   final void Function(dynamic)? onChanged;
//   final List<CountryModel>? list;//items
//   final List<String>? sortList;//stringList
//   final bool isCountries;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 2.5),
//       child: Row(
//         children: [
//           Text(
//             filterBy,
//             style: Theme.of(context)
//                 .textTheme
//                 .headline1!
//                 .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
//           ),
//           const SizedBox(
//             width: 3,
//           ),
//           Container(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               alignment: Alignment.centerRight,
//               height: 40,
//               width: AppSize.screenWidth / 3.5,
//               decoration: BoxDecoration(
//                   border: Border.all(color: AppColors.black),
//                   borderRadius: const BorderRadius.all(Radius.circular(5)),
//                   color: Theme.of(context).primaryColor),
//               child: DropdownButton(
//                 isExpanded: true,
//                 value: selectedValue,
//                 items: isCountries
//                     ? list!.map((CountryModel e) {
//                         return DropdownMenuItem(
//                           value: e,
//                           child: Text(e.country,
//                               style: Theme.of(context).textTheme.headline3),
//                         );
//                       }).toList()
//                     : sortList!
//                         .map((e) => DropdownMenuItem(
//                               value: e,
//                               child: Text(e,
//                                   style: Theme.of(context).textTheme.headline3),
//                             ))
//                         .toList(),
//                 onChanged: onChanged,
//               ))
//         ],
              //             ListView.builder(
              //               physics: const NeverScrollableScrollPhysics(),
              //               shrinkWrap: true,
              //               itemCount: controller.selectedSorted == 'Newest'
              //                   ? controller.news.length
              //                   : controller.reversedNews.length,
              //               itemBuilder: (context, index) => CategoriesCard(
              //                   onTap: () {
              //                     Get.toNamed(
              //                       AppRoute.newsDetails,
              //                       arguments: {
              //                         'NewsModel':
              //                             controller.selectedSorted == 'Newest'
              //                                 ? controller.news[index]
              //                                 : controller.reversedNews[index],
              //                       },
              //                     );
              //                   },
              //                   article: controller.selectedSorted == 'Newest'
              //                       ? controller.news[index]
              //                       : controller.reversedNews[index]))
              // ],