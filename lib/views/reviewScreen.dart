import 'package:flutter/material.dart';



class ReviewScreen extends StatefulWidget {
  dynamic addressInfo;

  ReviewScreen({@required this.addressInfo});
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded,color: Colors.black,size: 20,), onPressed: (){
          Navigator.of(context).pop();
        }),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Preview',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: getBody(),
    );
  }

  getBody() {
    return Container(
        color: Color.fromRGBO(6, 58, 143, 1),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
              child: Card(
                elevation: 5,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Your Info',style: TextStyle(color: Color.fromRGBO(6, 58, 143, 1),fontSize: 20,fontWeight: FontWeight.w900),),
                      ),
                      ListTile(
                        title: Text('Name'),
                        subtitle: Text(widget.addressInfo["secondScreenInfo"]["ScreenOneInfo"]["name"]),
                      ),
                      ListTile(
                        title: Text('Phone No.'),
                        subtitle: Text(widget.addressInfo["secondScreenInfo"]["ScreenOneInfo"]["phone_number"]),
                      ),
                      ListTile(
                        title: Text('Email'),
                        subtitle: Text(widget.addressInfo["secondScreenInfo"]["ScreenOneInfo"]["email"]),
                      ),
                      ListTile(
                        title: Text('Gender'),
                        subtitle: Text(widget.addressInfo["secondScreenInfo"]["ScreenOneInfo"]["gender"]),
                      ),
                      ListTile(
                        title: Text('Password'),
                        subtitle: Text(widget.addressInfo["secondScreenInfo"]["ScreenOneInfo"]["password"]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
              child: Card(
                elevation: 5,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Education',style: TextStyle(color: Color.fromRGBO(6, 58, 143, 1),fontSize: 20,fontWeight: FontWeight.w900),),
                      ),
                      ListTile(
                        title: Text('Education'),
                        subtitle: Text(widget.addressInfo["secondScreenInfo"]["education"]),
                      ),
                      ListTile(
                        title: Text('Passing Year'),
                        subtitle: Text(widget.addressInfo["secondScreenInfo"]["passingYear"]),
                      ),
                      ListTile(
                        title: Text('Grade'),
                        subtitle: Text(widget.addressInfo["secondScreenInfo"]["grade"]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
              child: Card(
                elevation: 5,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Experience',style: TextStyle(color: Color.fromRGBO(6, 58, 143, 1),fontSize: 20,fontWeight: FontWeight.w900),),
                      ),
                      ListTile(
                        title: Text('Experience'),
                        subtitle: Text(widget.addressInfo["secondScreenInfo"]["experience"]),
                      ),
                      ListTile(
                        title: Text('Designation'),
                        subtitle: Text(widget.addressInfo["secondScreenInfo"]["designation"]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
              child: Card(
                elevation: 5,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Address',style: TextStyle(color: Color.fromRGBO(6, 58, 143, 1),fontSize: 20,fontWeight: FontWeight.w900),),
                      ),
                      ListTile(
                        title: Text('Address'),
                        subtitle: Text(widget.addressInfo["address"]),
                      ),
                      ListTile(
                        title: Text('Landmark'),
                        subtitle: Text(widget.addressInfo["landmark"]),
                      ),
                      ListTile(
                        title: Text('City'),
                        subtitle: Text(widget.addressInfo["city"]),
                      ),
                      ListTile(
                        title: Text('Pin Code'),
                        subtitle: Text(widget.addressInfo["pinCode"]),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ));

  }
}
