import 'package:flutter/material.dart';
import 'package:food/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //with the help of state class you'll be able to refresh the whole screen and an _ means you are making it private i.e., no other file will be able to access it except its own
//it is stateless because no change would be observed but if you need a change you can use statefull widget which has 2 classes
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<
      FormState>(); // this key can be used to access anywhere in form globally
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1)); //await means to stop
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        //if you want app bar you can replace material with scaffold
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/hey.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                  //child: Text("ddjknfjdfjd"), you can add text here in the space
                ), //instead of padding we can use this
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ), //you can change the font through external packages
                SizedBox(
                  height:
                      20, //child: Text("ddjknfjdfjd"), you can add text here in the space
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {
                            //to change state and is only used in stateful state and it calls te=he build method agin by changing UI
                          });
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height:
                            40, //child: Text("ddjknfjdfjd"), you can add text here in the space
                      ),
                      Material(
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        color: context.theme
                            .highlightColor, //whenever you give ripple effect there shouldnot be any decoration for child
                        child: InkWell(
                          splashColor: Colors.yellowAccent,
                          onTap: () => moveToHome(context),
                          //since ripple effect is coming at the back instead of top, it can be fixed if its ancestor is material
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                            // decoration: BoxDecoration(
                            //     color: Colors
                            //         .orange, //colors can't be at both places i.e., either in container's main properties or in decoration
                            // shape:changeButton?BoxShape.circle:BoxShape.rectangle,
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   child: Text("Login"),
                      //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
