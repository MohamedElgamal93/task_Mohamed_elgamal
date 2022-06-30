import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskproject/presentation/common_widgets/list_common_widget.dart';
import 'package:taskproject/presentation/screens/home_details_page.dart';
import '../../bussniess_logic/home_cubit.dart';
import '../../bussniess_logic/localization_cubit/localization_cubit.dart';
import '../../data/local_cache.dart';
import '../../data/model/home_details_modle/arguments_home_details.dart';
import '../../data/model/home_modle/home_reponse.dart';
import '../../util/applocalizations.dart';
import '../../util/colors.dart';
import '../../util/strings.dart';
import '../common_widgets/appbar.dart';
import '../common_widgets/center_progress_bar.dart';
import '../common_widgets/no_internet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppLocalizations localizations;

  List<HomeResponse>? homeResponse;
  var listData = [];
  bool isLoading = true;
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).fetchHomeData();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCommon(context,
            title: localizations.translate("Home_Page"),
            leadingWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: InkWell(
                    onTap: () {
                      if (AppLocalizations.instance!.locale.languageCode ==
                          englishLanguageCode) {
                        LocalCache localCache = LocalCache();
                        localCache.saveBool(isFirstRunKey, true);
                        Locale newLocale = const Locale(arabicLanguageCode, "");
                        AppLocalizations.instance!.seLocal = newLocale;
                        BlocProvider.of<LocalizationCubit>(context)
                            .setLocale(newLocale);
                        localCache.save(languageKey, arabicLanguageCode);
                      } else {
                        LocalCache localCache = LocalCache();
                        Locale newLocale =
                            const Locale(englishLanguageCode, "");
                        AppLocalizations.instance!.seLocal = newLocale;
                        localCache.saveBool(isFirstRunKey, true);
                        BlocProvider.of<LocalizationCubit>(context)
                            .setLocale(newLocale);
                        localCache.save(languageKey, englishLanguageCode);
                      }
                    },
                    child: Text(
                      localizations.translate("current_language"),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: ConstColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    )))),
        body: ConnectivityBuilder(
          builder: (BuildContext context, bool? isConnected,
              ConnectivityStatus? status) {
            if (isConnected == false) {
              return const NoInternetConnection();
            } else {
              return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                if (state is HomeLoaded) {
                  homeResponse = state.homeModel;
                  isLoading = false;
                }
                return isLoading == true
                    ? const CenterCircularProgressbar(
                        submitProgressVisibility: true,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: homeResponse!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePageDetails(),
                                          // Pass the arguments as part of the RouteSettings. The
                                          // DetailProject reads the arguments from these settings.
                                          settings: RouteSettings(
                                            arguments: ArgumentDetailsProject(
                                                homeResponse![index].name,
                                                homeResponse![index].name,
                                                homeResponse![index].thumbnailUrl),
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListCommonWidget(
                                        description: homeResponse?[index].name,
                                        image: homeResponse?[index].thumbnailUrl,
                                        supTitle: homeResponse?[index].userId)));
                          },
                        ));
              });
            }
          },
        ));
  }
}
