import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:registeration_form/cubit/base/base_state.dart';
import 'package:registeration_form/cubit/infoCubit/info_cubit.dart';
import 'file:///F:/stateNeosoft/registerationForm/lib/cubit/registerCubit/registration_cubit.dart';
import 'file:///F:/stateNeosoft/registerationForm/lib/views/yourAddressScreen.dart';
import 'package:registeration_form/utils/appStrings.dart';
import 'package:registeration_form/utils/constants.dart';
import 'package:registeration_form/utils/validator.dart';
//import 'package:shared_preferences/shared_preferences.dart';
class YourInfo extends StatefulWidget {

  dynamic info;

  YourInfo({this.info});
  @override
  _YourInfoState createState() => _YourInfoState();
}

class _YourInfoState extends State<YourInfo> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController yearOfPassing = TextEditingController();
  TextEditingController grade = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController domain = TextEditingController();


  String educationValue='Select your education';
  InfoCubit _infoCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _infoCubit= InfoCubit();
  }
  @override
  Widget build(BuildContext context) {
    return CubitProvider.value(
      value: _infoCubit,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_rounded,color: Colors.black,size: 20,), onPressed: (){
            Navigator.of(context).pop();
          }),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Your Info',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: getBody(),
        bottomNavigationBar: Button(),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Educational Info',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Education*',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                                child: Text(educationValue),
                              ),
                              items: <String>['Select your education','Post Graduate', 'Graduate',
                                'HSC/Diploma', 'SSC'].map<DropdownMenuItem<String>>((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value,style:TextStyle(color:Colors.black)),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                setState(() {
                                  educationValue = value;
                                });

                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Year of Passing*',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child:  TextFormField(
                              controller: yearOfPassing,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.datetime,
                              maxLines: 1,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Year of Passing",
                                border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 32.0),
                                ),
                              ),
                              validator:(value) {
                                return Validator.validateFormField(
                                    value,
                                    strErrorEmptyPassingYear,
                                    strInvalidPassingYear,
                                    Constants.NORMAL_VALIDATION);
                              })

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Grade*',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,bottom: 10,
                        ),
                        child: TextFormField(
                          controller: grade,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          style: TextStyle(fontSize: 16.0),
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Enter your Grade Or Percentage",
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 32.0),
                            ),
                          ),
                          validator:(value) {
                            return Validator.validateFormField(
                                value,
                                strErrorEmptyGrade,
                                strInvalidGrade,
                                Constants.NORMAL_VALIDATION);
                          },),
                      ),
                      Divider(thickness: 2,),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Professional Info',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Experience*',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                        ),
                        child: TextFormField(
                          controller: experience,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          style: TextStyle(fontSize: 16.0),
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Enter the years of experience",
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 32.0),
                            ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide:
                            //       BorderSide(color: Colors.black, width: 32.0),
                            // )
                          ),
                          validator:(value) {
                            return Validator.validateFormField(
                                value,
                                strErrorEmptyYearExperience,
                                strInvalidYearExperience,
                                Constants.NORMAL_VALIDATION);
                          },),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Designation*',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                        ),

                        // child: DropdownButton<String>(
                        //   underline: SizedBox(),
                        //   isExpanded: true,
                        //   hint: Padding(
                        //     padding: const EdgeInsets.only(left: 10),
                        //     child: Text('Select Designation'),
                        //   ),
                        //   items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        //     return new DropdownMenuItem<String>(
                        //       value: value,
                        //       child: new Text(value),
                        //     );
                        //   }).toList(),
                        //   onChanged: (_) {},
                        // ),
                        child: TextFormField(
                            controller: designation,
                            validator:(value) {
                              return Validator.validateFormField(
                                  value,
                                  strErrorEmptyDesignation,
                                  strInvalidDesignation,
                                  Constants.NORMAL_VALIDATION);
                            } ,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            style: TextStyle(fontSize: 16.0),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Enter your Designation",
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 32.0),
                              ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.black, width: 32.0),
                              // )
                            )),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Domain*',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                        ),

                        // child: DropdownButton<String>(
                        //   underline: SizedBox(),
                        //   isExpanded: true,
                        //   hint: Padding(
                        //     padding: const EdgeInsets.only(left: 10),
                        //     child: Text('Select Your Domain'),
                        //   ),
                        //   items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        //     return new DropdownMenuItem<String>(
                        //       value: value,
                        //       child: new Text(value),
                        //     );
                        //   }).toList(),
                        //   onChanged: (_) {},
                        // ),
                        child: TextFormField(
                            controller: domain,
                            validator:(value) {
                              return Validator.validateFormField(
                                  value,
                                  strErrorEmptyDomain,
                                  strInvalidDomain,
                                  Constants.NORMAL_VALIDATION);
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            style: TextStyle(fontSize: 16.0),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Enter your Domain",
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 32.0),
                              ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.black, width: 32.0),
                              // )
                            )),

                      ),
                    ],
                  )),
            ),
          ),
        ));
  }

  Button() {
    return CubitBuilder<InfoCubit, BaseState>(
      builder: (context, state){
        return  Padding(
          padding: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2-25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color:Color.fromRGBO(6, 58, 143, 1))
                    ),
                    child: FlatButton(color:Colors.white,onPressed:(){
                      Navigator.of(context).pop();
                    }, child: Text('Previous',style: TextStyle(color: Color.fromRGBO(6, 58, 143, 1),fontWeight: FontWeight.w500,fontSize: 18),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2-25,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(6, 58, 143, 1)
                    ),
                    child: FlatButton(color:Color.fromRGBO(6, 58, 143, 1),onPressed:() async {

                      if(_formKey.currentState.validate()){



                        context.cubit<InfoCubit>().saveInfoData(educationValue, yearOfPassing.text, grade.text, experience.text, designation.text,domain.text);
                        var experienceInfo = {
                          "education":educationValue,
                          "passingYear": yearOfPassing.text,
                          "grade": grade.text,
                          "experience": experience.text,
                          "designation": designation.text,
                          "domain" : domain.text,
                          "ScreenOneInfo":widget.info
                        };


                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => YourAddressScreen(experienceInfo:experienceInfo)));


                      }
                    }, child: Text('Next',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
