import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:registeration_form/cubit/addressCubit/address_cubit.dart';
import 'package:registeration_form/cubit/base/base_state.dart';
import 'file:///F:/stateNeosoft/registerationForm/lib/cubit/registerCubit/registration_cubit.dart';
import 'file:///F:/stateNeosoft/registerationForm/lib/views/reviewScreen.dart';
import 'package:registeration_form/utils/appStrings.dart';
import 'package:registeration_form/utils/constants.dart';
import 'package:registeration_form/utils/validator.dart';
class YourAddressScreen extends StatefulWidget {
  dynamic experienceInfo;

  YourAddressScreen({@required this.experienceInfo});


  @override
  _YourAddressScreenState createState() => _YourAddressScreenState();
}

class _YourAddressScreenState extends State<YourAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController address = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pinCode = TextEditingController();

  String stateValue='Select Your State';
  AddressCubit _addressCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addressCubit= AddressCubit();
  }
  @override
  Widget build(BuildContext context) {
    return CubitProvider(
      create: (context) => _addressCubit,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_rounded,
              color: Color.fromRGBO(6, 58, 143, 1)),
              onPressed: (){
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Your Address',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: getBody(),

      ),
    );
  }

  getBody() {
    return SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Center(
                child: Form(
                    key: _formKey,
                    child: ListView(
                      shrinkWrap: true,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: TextFormField(
                              controller: address,
                              validator: (value) {
                                return Validator.validateFormField(
                                    value,
                                    strErrorEmptyAddress,
                                    strInvalidAddress,
                                    Constants.NORMAL_VALIDATION);
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.streetAddress,
                              maxLines: 1,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                prefixIcon: Icon(Icons.local_convenience_store,color: Color.fromRGBO(6, 58, 143, 1)),
                                hintText: "Address",
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 32.0),
                                ),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: TextFormField(
                              controller: landmark,
                              validator: (value) {
                                return Validator.validateFormField(
                                    value,
                                    strErrorEmptyLandmark,
                                    strInvalidLandmark,
                                    Constants.NORMAL_VALIDATION);
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.streetAddress,
                              maxLines: 1,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                prefixIcon: Icon(Icons.local_convenience_store,color: Color.fromRGBO(6, 58, 143, 1)),
                                hintText: "Landmark",
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 32.0),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top:10,
                          ),
                          child: TextFormField(
                              controller: city,
                              validator: (value) {
                                return Validator.validateFormField(
                                    value,
                                    strErrorEmptyCity,
                                    strInvalidCity,
                                    Constants.NORMAL_VALIDATION);
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              maxLines: 1,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                prefixIcon: Icon(Icons.local_convenience_store,color: Color.fromRGBO(6, 58, 143, 1)),
                                hintText: "City",
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 32.0),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(stateValue),
                                ),
                                items: <String>['Maharashtra', "Gujarat", 'Karnataka', 'Madhya Pradesh',
                                  'Delhi', 'Others'].map<DropdownMenuItem<String>>((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value,style:TextStyle(color:Colors.black)),
                                  );
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    stateValue = value;
                                  });

                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: TextFormField(
                              controller: pinCode,
                              validator: (value) {
                                return Validator.validateFormField(
                                    value,
                                    strErrorEmptyZipCode,
                                    strInvalidZipCode,
                                    Constants.ZIP_VALIDATION);
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                prefixIcon: Icon(Icons.local_convenience_store,color: Color.fromRGBO(6, 58, 143, 1)),
                                hintText: "Pin Code",
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 32.0),
                                ),
                              )),
                        ),
                        CubitBuilder<AddressCubit, BaseState>(
                          builder: (context, state){
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                child: FlatButton(color:Color.fromRGBO(6, 58, 143, 1),onPressed:()async{
                                  if(_formKey.currentState.validate()){

                                    context.cubit<AddressCubit>().saveAddressData(address.text, landmark.text, city.text, pinCode.text);

                                    var addressInfo = {
                                      "address": address.text,
                                      "landmark": landmark.text,
                                      "city": city.text,
                                      "pinCode": pinCode.text,
                                      "secondScreenInfo":widget.experienceInfo,
                                    };

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (c) => ReviewScreen(addressInfo:addressInfo)));


                                  }
                                }, child: Text('Submit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),)),
                              ),
                            );
                          },
                        ),


                      ],
                    )),
              ),
            ),
          ),
        ));
  }


}
