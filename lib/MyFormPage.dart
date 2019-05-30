import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'FormVal.dart';

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  var selectedCurrency, selectedType;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  List<String> _accountType = <String>[
    'Savings',
    'Deposit',
    'Checking',
    'Brokerage'
  ];
  String _subscribeStatus = 'Yes';
  FormVal formVal=new FormVal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
              ),
              onPressed: () {}),
          title: Container(
            alignment: Alignment.center,
            child: Text("Account Details",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.coins,
                size: 20.0,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          ],
        ),
        body: Form(
          key: _formKeyValue,
          //autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              SizedBox(height: 20.0),

              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      FontAwesomeIcons.phone,
                      color: Color(0xff9e58b1),
                    ),
                    hintText: 'Enter your Phone Details',
                    labelText: 'Phone',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) => val.isEmpty ? 'Phone is required' : null,
                  onSaved: (val) => formVal.phone = val,
                  ),

              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.userCircle,
                    color: Color(0xff9e58b1),
                  ),
                  hintText: 'Enter your Name',
                  labelText: 'Name',
                ),
                validator: (val) => val.isEmpty ? 'Name is required' : null,
                onSaved: (val) => formVal.name = val,
              ),

              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.envelope,
                    color: Color(0xff9e58b1),
                  ),
                  hintText: 'Enter your Email Address',
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val.isEmpty ? 'Email is required' : null,
                onSaved: (val) => formVal.email = val,
              ),
              new TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.envelope,
                    color: Color(0xff9e58b1),
                  ),
                  hintText: 'confirm password',
                  labelText: 'Password',
                ),
                keyboardType: TextInputType.text,
                validator: (val) => val.isEmpty ? 'Password is required' : null,
                onSaved: (val) => formVal.password = val,
              ),

              SizedBox(height: 20.0),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.moneyBill,
                    size: 25.0,
                    color: Color(0xff9e58b1),
                  ),
                  SizedBox(width: 50.0),
                  DropdownButton(
                    items: _accountType
                        .map((value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: Color(0xff9e58b1)),
                              ),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (selectedAccountType) {
                      setState(() {
                        selectedType = selectedAccountType;
                        formVal.accountType=selectedAccountType;
                      });
                    },
                    value: selectedType,
                    isExpanded: false,
                    hint: Text(
                      'Choose Account Type',
                      style: TextStyle(color: Color(0xff9e58b1)),
                    ),
                  )
                ],
              ),
               SizedBox(width: 50.0),

              Text('Subscription Status',style: TextStyle(color: Colors.black,fontSize: 16.0),),
              RadioListTile<String>(
                title: const Text('Subscribed'),
                value: 'Yes',
                groupValue: _subscribeStatus,
                activeColor: Color(0xff9e58b1),
                onChanged: (value) {
                  setState(() {
                    _subscribeStatus = value;
                    formVal.subscriptionStatus=_subscribeStatus;
                  });
                },
              ),
               RadioListTile<String>(
                title: const Text('Not Subscribed'),
                value: 'No',
                groupValue: _subscribeStatus,
                activeColor: Color(0xff9e58b1),
                onChanged: (value) {
                  setState(() {
                    _subscribeStatus = value;
                     formVal.subscriptionStatus=_subscribeStatus;
                  });
                },
              ),
              SizedBox(
                height: 80.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.amber,
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Submit", style: TextStyle(fontSize: 24.0)),
                            ],
                          )),
                      onPressed: () {
                        _formSubmit();
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              ),
            ],
          ),
        ));
  }

  void _formSubmit(){
    final FormState formStateVal = _formKeyValue.currentState;
    if(formStateVal.validate()){
      formStateVal.save(); 
      print('Form validated and saved');
      print('Name :${formVal.name}');
      print('Phone :${formVal.phone}');
      print('Email :${formVal.email}');
      print('Password :${formVal.password}');
      print('AccountType :${formVal.accountType}');
      print('Subscription Status :${formVal.subscriptionStatus}');
    }
    else{
       print('Form not validated');
    }
  }
}
