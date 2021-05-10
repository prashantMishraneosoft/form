import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:image_picker/image_picker.dart';
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'First Name*',
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
                    child: TextFormField(
                      controller: firstName,
                        textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                        maxLines: 1,
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            prefixIcon: Icon(Icons.person,color: Color.fromRGBO(6, 58, 143, 1),),
                            hintText: "Enter your first name here",
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 32.0),
                            ),
                            ),
                      validator: (value) {
                        return Validator.validateFormField(
                            value,
                            strErrorEmptyFirstName,
                            strInvalidFirstName,
                            Constants.NORMAL_VALIDATION);
                      },
                   ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Last Name*',
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
                    child: TextFormField(
                      controller: lastName,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            prefixIcon: Icon(Icons.person,color: Color.fromRGBO(6, 58, 143, 1),),
                            hintText: "Enter your last name here",
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 32.0),
                            ),
                            ),
                    validator: (value) {
                  return Validator.validateFormField(
                  value,
                  strErrorEmptyLastName,
                  strInvalidLastName,
                  Constants.NORMAL_VALIDATION);
                  }, ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Phone Number*',
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
                    child: TextFormField(
                      controller: phoneNumber,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        maxLength: 10,
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            prefixIcon: Icon(Icons.phone,color: Color.fromRGBO(6, 58, 143, 1),),
                            hintText: "Enter your 10 digit phone number",
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 32.0),
                            ),
                            ),
                      validator: (value) {
                  return Validator.validateFormField(
                  value,
                  strErrorEmptyPhone,
                  strInvalidPhone,
                  Constants.PHONE_VALIDATION);
                  },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Email*',
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
                    child: TextFormField(
                      controller: email,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            prefixIcon: Icon(Icons.email,color: Color.fromRGBO(6, 58, 143, 1),),
                            hintText: "Your email goes here",
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 32.0),
                            ),

                        ),
                     validator: (value) {
                  return Validator.validateFormField(
                  value,
                  strErrorEmptyEmail,
                  strInvalidEmail,
                  Constants.EMAIL_VALIDATION);
                  },),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Password*',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: password,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 1,
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            suffixIcon: Icon(Icons.remove_red_eye,color: Color.fromRGBO(6, 58, 143, 1)),
                            prefixIcon: Icon(Icons.lock,color: Color.fromRGBO(6, 58, 143, 1)),
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 32.0),
                            ),
                            ),
                      validator: (value) {
                        return Validator.validateFormField(
                            value,
                            strErrorEmptyPassword,
                            strInvalidPassword,
                            Constants.PASSWORD_VALIDATION);
                      },),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Confirm-Password*',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      obscureText: true,
                      controller: confirmPassword,

                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 1,
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

                            prefixIcon: Icon(Icons.lock,color: Color.fromRGBO(6, 58, 143, 1)),
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 32.0),
                            ),

                           ),
                    validator:(value) {
                      return Validator.validateFormField(
                          value,
                          strErrorEmptyRePassword,
                          strInvalidPassword,
                          Constants.NORMAL_VALIDATION);
                    } ,),
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
