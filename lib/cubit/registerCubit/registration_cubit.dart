import 'package:cubit/cubit.dart';
import 'package:registeration_form/cubit/base/base_state.dart';
import 'package:registeration_form/model/myInfo.dart';

class RegistrationCubit extends Cubit<BaseState>{
  var type ;
  RegistrationCubit({this.type}) : super(InitialState()){
    if(type !=null){
      getData();
    }
  }

  MyInfo _data= MyInfo();


  saveData(firstName, lastName, phoneNumber, email,gender,password){
    _data.first=firstName;
    _data.last=lastName;
    _data.phone=phoneNumber;
    _data.email=email;
    _data.gender=gender;
    _data.password=password;
  }



  getData(){
    emit(SuccessState<MyInfo>(response:_data));

  }



}