import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import '../../data/model/home_details_modle/arguments_home_details.dart';
import '../../util/colors.dart';
import '../../util/sizes.dart';
import '../common_widgets/appbar.dart';
import '../common_widgets/no_internet.dart';

class HomePageDetails extends StatefulWidget {
  const HomePageDetails({Key? key}) : super(key: key);

  @override
  State<HomePageDetails> createState() => _HomePageDetails();
}

class _HomePageDetails extends State<HomePageDetails> {
  ArgumentDetailsProject? projectMain;

  @override
  void didChangeDependencies() {
    projectMain =
        ModalRoute.of(context)!.settings.arguments as ArgumentDetailsProject;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstColors.whiteColor,
        appBar: appBarCommon(context,
            haveBack: true,
            title: projectMain!.projectName,
            systemOverlayColor: ConstColors.secondaryColor),
        body: ConnectivityBuilder(
          builder: (BuildContext context, bool? isConnected,
              ConnectivityStatus? status) {
            if (isConnected == false) {
              return const NoInternetConnection();
            } else {
              return Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .76,
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical:
                                SizeConfig.height(context: context, pixels: 30),
                            horizontal:
                                SizeConfig.width(context: context, pixels: 20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: SizeConfig.height(
                                    context: context, pixels: 300),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        projectMain!.image,
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(
                                height: SizeConfig.height(
                                    context: context, pixels: 40),
                              ),
                              Text(
                                projectMain!.projectDescription,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
