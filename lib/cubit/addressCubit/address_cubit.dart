import 'package:cubit/cubit.dart';
import 'package:registeration_form/cubit/base/base_state.dart';
import 'package:registeration_form/model/myInfo.dart';


class AddressCubit extends Cubit<BaseState>{
  var type ;
  AddressCubit({this.type}) : super(InitialState()){
    if(type !=null){
      getData();
    }
  }

  MyInfo _data= MyInfo();




  saveAddressData(address, landmark, city, pinCode){
    _data.address=address;
    _data.landmark=landmark;
    _data.city=city;
    _data.pinCode=pinCode;

  }

  getData(){
    emit(SuccessState<MyInfo>(response:_data));

  }



}