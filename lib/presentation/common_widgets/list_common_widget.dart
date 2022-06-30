import 'package:flutter/material.dart';
import 'package:taskproject/util/sizes.dart';
import '../../util/colors.dart';
import '../../util/images.dart';

@immutable
class ListCommonWidget extends StatelessWidget {
  final String? description;
  final int? supTitle;
  final String? image;

  const ListCommonWidget({
    Key? key,
    this.description,
    this.image,
    this.supTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: ConstColors.borderColor, width: .5),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            )),
        child: ListTile(
            title: Text(
              "$description",
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color: ConstColors.borderColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            subtitle: Text(
              "$supTitle",
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color: ConstColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            trailing: SizedBox(
              width: SizeConfig.width(context: context, pixels: 40),
              height: SizeConfig.height(context: context, pixels: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: FadeInImage(
                  image: NetworkImage(image ?? ''),
                  placeholder: const AssetImage(defaultImage),
                  placeholderErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(defaultImage),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(defaultImage),
                  width: SizeConfig.width(context: context, pixels: 40),
                  height: SizeConfig.height(context: context, pixels: 40),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            leading: const Icon(
              Icons.arrow_back_ios_rounded,
            )));
  }
}
