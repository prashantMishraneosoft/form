import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:registeration_form/components/input_box.dart';
import 'package:registeration_form/cubit/base/base_state.dart';
import 'file:///F:/stateNeosoft/registerationForm/lib/cubit/registerCubit/registration_cubit.dart';
import 'file:///F:/stateNeosoft/registerationForm/lib/views/yourInfoScreen.dart';
import 'package:registeration_form/utils/appStrings.dart';
import 'package:registeration_form/utils/constants.dart';
import 'package:registeration_form/utils/validator.dart';

class Registrationscreen extends StatefulWidget {
  @override
  _RegistrationscreenState createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();
  List gender = ["Male", "Female"];
  RegistrationCubit _registerationCubit;


  String select;
  File _image;
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  _imgFromCamera() async {
    final pickedFile = (await _picker.getImage(source: ImageSource.camera));
    _image = File(pickedFile.path);
    setState(() {

    });
  }

  _imgFromGallery() async {
    final pickedFile = (await _picker.getImage(source: ImageSource.gallery));
    _image = File(pickedFile.path);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerationCubit= RegistrationCubit();
  }

  @override
  Widget build(BuildContext context) {
    return CubitProvider(
      create: (context) => _registerationCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Register',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: getBody(),
        bottomNavigationBar: nextButton(),
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
        child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  profilePhoto(),
                  InputBox(labelText: 'First Name*',
                  hintText: 'Enter your first name here',
                  controller:firstName,
                    validator: (value) {
                      return Validator.validateFormField(
                          value,
                          strErrorEmptyFirstName,
                          strInvalidFirstName,
                          Constants.NORMAL_VALIDATION);
                    },
                  prefixIcon: Icon(Icons.person,color: Color.fromRGBO(6, 58, 143, 1),),
                  ),
                  InputBox(labelText: 'Last Name*',
                    hintText: 'Enter your last name here',
                    controller: lastName,
                    validator: (value) {
                      return Validator.validateFormField(
                          value,
                          strErrorEmptyLastName,
                          strInvalidLastName,
                          Constants.NORMAL_VALIDATION);
                    },
                    prefixIcon: Icon(Icons.person,color: Color.fromRGBO(6, 58, 143, 1),),
                    ),
                  InputBox(labelText: 'Phone Number*',
                    hintText: 'Enter your 10 digit phone number',
                    controller: phoneNumber,
                    validator: (value) {
                      return Validator.validateFormField(
                          value,
                          strErrorEmptyPhone,
                          strInvalidPhone,
                          Constants.PHONE_VALIDATION);
                    },
                    maxLength:10,
                    prefixIcon: Icon(Icons.call,color: Color.fromRGBO(6, 58, 143, 1),),
                   ),
                  InputBox(labelText: 'Email*',
                    hintText: 'Your email goes here',
                    controller: email,
                    validator: (value) {
                      return Validator.validateFormField(
                          value,
                          strErrorEmptyEmail,
                          strInvalidEmail,
                          Constants.EMAIL_VALIDATION);
                    },
                    prefixIcon: Icon(Icons.email,color: Color.fromRGBO(6, 58, 143, 1),),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Gender*',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 'Male',
                              groupValue: select,
                              onChanged: (value) {
                                setState(() {
                                  print(value);
                                  select = value;
                                });
                              },
                            ),
                            Text('Male'),
                          ],
                        ),

                        Row(
                          children: [
                            Radio(
                              value: 'Female',
                              groupValue: select,
                              onChanged: (value) {
                                setState(() {
                                  print(value);
                                  select = value;
                                });
                              },
                            ),
                            Text('Female'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InputBox(labelText: 'Password*',
                    hintText: 'Password',
                    controller: password,
                    validator: (value) {
                      return Validator.validateFormField(
                          value,
                          strErrorEmptyPassword,
                          strInvalidPassword,
                          Constants.PASSWORD_VALIDATION);
                    },
                    prefixIcon: Icon(Icons.lock,color: Color.fromRGBO(6, 58, 143, 1),),
                   ),
                  InputBox(labelText: 'Confirm Password*',
                    hintText: 'Password',
                    controller: confirmPassword,
                    validator:(value) {
                      return Validator.validateFormField(
                          value,
                          strErrorEmptyRePassword,
                          strInvalidPassword,
                          Constants.NORMAL_VALIDATION);
                    } ,
                    prefixIcon: Icon(Icons.lock,color: Color.fromRGBO(6, 58, 143, 1),),
                    ),
                ],
              )),
      ),
    ),
        ));
  }

  profilePhoto() {
    return Container(
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          GestureDetector(
            onTap: (){
              _showPicker(context);
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50,
              child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        _image,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      width: 80,
                      height: 80,
                      child: Icon(
                        Icons.person,
                          color: Color.fromRGBO(6, 58, 143, 1)
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  nextButton() {
    return CubitBuilder<RegistrationCubit, BaseState>(
      builder: (context, state){
        return Padding(
          padding: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
          child: Container(
            child: FlatButton(color:Color.fromRGBO(6, 58, 143, 1),onPressed:() async {
              if(_formKey.currentState.validate()){
                if (password.text == confirmPassword.text){


                  context.cubit<RegistrationCubit>().saveData(firstName.text, lastName.text, phoneNumber, email,gender,password);

                  var info = {
                    "name":firstName.text,
                    "phone_number":phoneNumber.text,
                    "email":email.text,
                    "password":password.text,
                    "gender":select.toString()
                  };

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => YourInfo(info:info)));
                }

              }

            }, child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Text('Next',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),),
            )),
          ),
        );
      },

    );
  }
}
