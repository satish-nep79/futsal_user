import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:futsoul_user/models/futsals.dart';
import 'package:futsoul_user/utils/constants/colors.dart';
import 'package:futsoul_user/utils/constants/custom_text_styles.dart';
import 'package:futsoul_user/utils/constants/image_path.dart';
import 'package:futsoul_user/widget/custom/elevated_button.dart';
import 'package:get/get.dart';

class FutsalList extends StatelessWidget {
  final Futsal futsal;
  final VoidCallback onTap;
  const FutsalList({
    super.key,
    required this.onTap,
    required this.futsal,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: theme.colorScheme.background,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: theme.colorScheme.shadow,
                offset: const Offset(1, 1),
                blurRadius: 8,
                spreadRadius: 1)
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: futsal.image??"",
              fit: BoxFit.cover,
              height: 120,
              width: 120,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset(
                ImagePath.imagePlaceholder,
                fit: BoxFit.cover,
                height: 120,
                width: 120,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${futsal.futsalName}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.f16W600(),
                ),
                Text(
                  "${futsal.location}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.f16W300(),
                ),
                Text(
                  "Rs. ${futsal.price} per hour",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      CustomTextStyles.f16W600(color: AppColors.primaryColor),
                ),
                SizedBox(
                  width: Get.width - 195,
                  child: CustomElevatedButton(
                    title: "Show Details",
                    height: 40,
                    onTap: onTap,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
