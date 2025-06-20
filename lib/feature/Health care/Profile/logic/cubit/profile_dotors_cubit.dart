import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thi/feature/Health%20care/Profile/data/dateilsByIDDotors.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

part 'profile_dotors_state.dart';

class ProfileDotorsCubit extends Cubit<ProfileDotorsState> {
  ProfileDotorsCubit() : super(ProfileDotorsInitial());

  static ProfileDotorsCubit getObject(context) => BlocProvider.of(context);

  DetailsByIdDoctorsModel? detailsByIdDoctorsModel;
  void getallDoctors({required int Id_Doctor}) {
    emit(ProfileDotorsLoading());
    DioHelper.getDataClub(
            endpoint: "getDoctorByIDUser/${Id_Doctor}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      detailsByIdDoctorsModel = DetailsByIdDoctorsModel.fromJson(value.data);
      emit(ProfileDotorsSeccessfuly());
    }).catchError((onError) {
      emit(ProfileDotorsError());
    });
  }
}
