import 'package:flutter/material.dart';
import '../../util/colors.dart';
import '../../util/images.dart';
import '../../util/sizes.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.height(context: context, pixels: 160),
                    ),
                    height: SizeConfig.height(context: context, pixels: 209),
                    width: SizeConfig.width(context: context, pixels: 245),
                    child: Image.asset(noInternet)),
                SizedBox(
                  height: SizeConfig.height(context: context, pixels: 40),
                ),
                Text(
                  "no Connection",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: ConstColors.textSecondaryColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
