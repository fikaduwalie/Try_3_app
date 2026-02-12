import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'application form',
      home: Homepage(),
    );
  }
}
class Homepage  extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage>{
  String? _name;
  String? _email;
  String? _phone;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState>   _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('input form'),),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key:_formKey,
          autovalidateMode: _autovalidateMode,
          child: FormWidget(),
        )
      ),
    );
  }
  

Widget FormWidget(){
  return Column(
    children:<Widget> [
    TextFormField(
      decoration: InputDecoration(labelText: 'email'),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (String? val){
       String? _email = val;
      },
    ),

    TextFormField(
      decoration: InputDecoration(labelText: 'phone'),
      keyboardType: TextInputType.phone,
      validator: validatePhone,
      onSaved: (String? val){
       String? _phone = val;
      },
    ),
    SizedBox(
      height: 10.0 ),
   ElevatedButton(
    child:Text('press me'),
    onPressed: _validateInput,
    )

    ]
  );
}
  void _validateInput(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();

    }
    else{
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
        
      }
      );
    }
    }
  }

String? validateName(String? value) {
  if (value == null || value.length < 3) {
    return 'name must be more than 2 characters';
  }else{
  return null;
}
}
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }

  String pattern = r'^[^@]+@[^@]+\.[^@]+';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Enter valid email';
  }

  return null;
}
  

String? validatePhone(String? value) {
  if (value == null || value.length < 3) {
    return 'phone must be more than 4 digit';
  }else{
  return null;
}}