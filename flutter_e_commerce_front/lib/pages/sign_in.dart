// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth.dart';
import 'constant.dart';
import 'loading.dart';
import 'background_image.dart';
import 'package:provider/provider.dart';
import 'google_account.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'google_signin.dart';

class SignIn extends StatefulWidget {

  // const SignIn ({Key key, void Function() toogleView, void Function() Key}) : super(key: key); // ignore: non_constant_identifier_names
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();



  bool loading =false;



  // text field state
  String email = " ";
  String password = " ";
  String error = ' ';

  _SignInState();



  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Stack(
      children: [
        BackgroundImage(),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('sign in to Asrat'),
              actions: [
                TextButton.icon(
                    onPressed: (){
                      widget.toggleView();

                    },
                    icon: Icon(Icons.person),
                    label: Text('Register'))
              ],
            ),
            body: Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 80.0),

                  child: Form(
                    key: _formKey,
                    child:  new Column(
                      // mainAxisAlignment: ,
                      children: [

                        // Container(
                        //   alignment: Alignment.center,
                        //   height: 150,
                        //   child: Text('Sign In Here',
                        //     style: TextStyle(color: Colors.blue, fontSize: 28,fontWeight: FontWeight.bold ),),
                        // ),

                        SizedBox(height: 20.0),
                        TextFormField(
                            decoration: textInputdecoration.copyWith(
                              hintText: 'Email',
                              icon:Icon(Icons.email_outlined),
                            ),


                            validator: (val)=> val.isEmpty ? 'Enter an email':null,
                            onChanged: (val){
                              setState(() => email = val);

                            }
                        ),


                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: textInputdecoration.copyWith(
                              hintText: 'Password',
                              icon: Icon(Icons.lock_outline)
                          ),
                          obscureText: true,
                          validator: (val)=> val.length<6 ? 'Enter a password 6+ chars length' :null,

                          onChanged: (val){
                            setState(() => password =val );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Forget password',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(text: TextSpan(
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 16.0),


                              text: "Don't have an account? click here to",

                              children: [
                                TextSpan(
                                  text: "Sign up!",
                                  style: TextStyle(color: Colors.red),

                                ),
                                // recognizer:

                              ]
                          ),

                          ),
                        ),
                        SizedBox(height: 5.0),
                        ElevatedButton(

                            child: Text('Sign In',style: TextStyle(color: Colors.white),),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)),
                              // padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 45.0))
                            ),
                            onPressed: ()async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth
                                    .signInWithEmailAndPassword(
                                    email, password);
                                if (result == null) {
                                  setState(() {
                                    error =
                                    'could not sign in with those credentials';
                                    loading = false;
                                  });
                                }
                              }
                            }
                        ),


                        Divider(color: Colors.white,),
                        Text('Other Login option',
                          style:TextStyle(color: Colors.black87,fontSize: 24.0, fontWeight: FontWeight.bold) ,),
                        SizedBox(height: 5.0,),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.black,
                            minimumSize: Size(double.infinity,50)
                          ),
                            icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
                            label: Text('Sign Up with Google'),
                            onPressed: (){
                                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                                provider.login();
                                }
                            // {
                            // final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                            //     provider.login();
                            // },
                            ),
                        SizedBox(height: 20.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.black,fontSize: 14.0, fontWeight: FontWeight.w500 ),
                        ),


                      ],




                    ),
                  ),
                )
            )
        ),


      ],
    );
  }
}
