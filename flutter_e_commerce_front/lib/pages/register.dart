import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'constant.dart';
import 'loading.dart';
import 'background_image.dart';
class Register  extends StatefulWidget {
  // const Register ({Key key,
  //   void Function() Key }) : super(key: key);
  // //

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register > {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = " ";
  String password = " ";
  String error = ' ';

  @override
  Widget build(BuildContext context) {


    return loading ? Loading(): Stack(

        children:[
          BackgroundRegister(),
          Scaffold(

            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('sign up to Asrat'),
              actions: [
                TextButton.icon(
                    onPressed: (){
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Sign In'))
              ],
            ),
            body:  Container(
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Container(
                        //   alignment: Alignment.center,
                        //   height: 230,
                        //   child: Text('Register Here',
                        //     style: TextStyle(color: Colors.blue, fontSize: 28,fontWeight: FontWeight.bold ),),
                        // ),



                        SizedBox(height:25.0),
                        TextFormField(
                            decoration: textInputdecoration.copyWith(
                                hintText: 'Email',
                                icon: Icon(Icons.email_outlined)
                            ),
                            validator: (val)=> val.isEmpty ? 'Enter an email':null,
                            onChanged: (val){
                              setState(() => email = val);

                            }
                        ),

                        SizedBox(height: 10.0),
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
                        SizedBox(height: 5.0),
                        ElevatedButton(

                          child: Text('Register',style: TextStyle(color: Colors.white),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)),
                            // padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 45.0))
                          ),
                          onPressed: ()async{
                            if(_formKey.currentState.validate()){
                              setState(() => loading=true);
                              dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                              if(result == null){

                                setState((){
                                  error = 'please supply a valid email';
                                  loading = false;
                                });
                              }
                            }
                          },
                        ),
                        Divider(color: Colors.white,),
                        Text('Other Registeration',
                          style:TextStyle(color: Colors.black87,fontSize: 24.0, fontWeight: FontWeight.bold) ,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue,
                            elevation: 0.0,
                            child: MaterialButton(onPressed: (){},
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text('Google Account',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.black,fontSize: 14.0, fontWeight: FontWeight.w500 ),
                        ),


                        SizedBox(height: 10.0,),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red,fontSize: 14.0 ),
                        )
                      ],
                    ),
                  )
              ),
            ),

          ),
        ]
    );
  }
}
