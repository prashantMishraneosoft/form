import 'package:cubit/cubit.dart';
import 'package:registeration_form/cubit/base/base_state.dart';
import 'package:registeration_form/model/myInfo.dart';


class InfoCubit extends Cubit<BaseState>{
  var type ;
  InfoCubit({this.type}) : super(InitialState()){
    if(type !=null){
      getData();
    }
  }

  MyInfo _data= MyInfo();




  saveInfoData(educationValue, yearOfPassing, grade, experience, designation,domain){
    _data.educationValue=educationValue;
    _data.yearOfPassing=yearOfPassing;
    _data.grade=grade;
    _data.experience=experience;
    _data.designation=designation;
    _data.domain=domain;
  }


  getData(){
    emit(SuccessState<MyInfo>(response:_data));

  }



}