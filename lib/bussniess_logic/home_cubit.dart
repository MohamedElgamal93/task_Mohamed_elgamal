import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data/model/home_modle/home_reponse.dart';
import '../data/repositorys/reositories.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repositories) : super(HomeInitial());
  final Repositories repositories;

  dynamic fetchHomeData() {
 List<HomeResponse>? homeModel;
    if (state is HomeLoading) emit(HomeLoading(true));
    repositories.getHomeData().then((terms) {
      homeModel = (terms as List).map((i) => HomeResponse.fromJson(i)).cast<HomeResponse>().toList();   
      emit(HomeLoaded(homeModel));
    });

    return homeModel;
  }
}
