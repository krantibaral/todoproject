import 'package:flutter/material.dart';
import 'package:to_do/homepage.dart';

// ignore: import_of_legacy_library_into_null_safe
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(Login());
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 700),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Image.asset("assets/todo.png", height: 200, width: 200),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45.0,
                          padding: EdgeInsets.only(
                              top: 0.0, bottom: 0.0, left: 16.6, right: 16.0),
                          margin: EdgeInsets.only(top: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              topLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                            ),
                            color: Color(0xFFffffff),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12, blurRadius: 15.0),
                            ],
                          ),
                          child: TextField(
                            cursorColor: Color(0xFF000000),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "UserName",
                              icon: Icon(
                                Icons.person,
                                color: Color(0xFF000000),
                              ),
                              hintStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45.0,
                          padding: EdgeInsets.only(
                              top: 0.0, bottom: 0.0, left: 16.6, right: 16.0),
                          margin: EdgeInsets.only(top: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              topLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                            ),
                            color: Color(0xFFffffff),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12, blurRadius: 15.0),
                            ],
                          ),
                          child: TextField(
                            cursorColor: Color(0xFF000000),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              icon: Icon(
                                Icons.lock,
                                color: Color(0xFf000000),
                              ),
                              hintStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            'Forget Password??',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 200,
                        child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: ElevatedButton(
                              
                              onPressed: () {
                                
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const homePage()),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red[700]),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 25,),
                              ),
                            )),
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
