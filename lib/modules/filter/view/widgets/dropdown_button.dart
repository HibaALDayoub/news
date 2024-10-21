import 'package:flutter/material.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../model/name_country_model.dart';

class CustomDropdownButton extends StatelessWidget {
  CustomDropdownButton(
      {super.key,
      this.items,
      required this.onChange,
      this.itemSelected,
      this.onTap,
      required this.isModel,
      this.stringList});
  final List<NameCountryModel>? items;
  final void Function(Object?) onChange;
  final dynamic itemSelected;
  void Function()? onTap;
  final bool isModel;
  final List<String>? stringList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, right: 0),
      height: 40,
      width: 110,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: AppColors.nightGrey),
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          onTap: onTap,
          padding: const EdgeInsets.all(5),
          items: isModel
              ? items!.map((NameCountryModel sel) {
                  return DropdownMenuItem(
                      value: sel,
                      child: Text(
                        sel.country,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: Theme.of(context).primaryColorLight),
                      ));
                }).toList()
              : stringList!
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  color: Theme.of(context).primaryColorLight),
                        ),
                      ))
                  .toList(),
          onChanged: onChange,
          value: itemSelected,
        ),
      ),
    );
  }
}
