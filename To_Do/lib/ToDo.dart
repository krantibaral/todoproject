import 'package:flutter/material.dart';

import 'homepage.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(ToDo());
}

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffff96060),
        elevation: 0,
        title: Text(
          'Add Task',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 10,
              color: Color(0xffff96060),
            ),
            SizedBox(height: 1),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey.withOpacity(0.2),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Title", border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    ),
                    child: TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add description here",
                      ),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(15)),
                        border: Border.all(color: Colors.grey)
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                      child: Icon(
                        Icons.attach_file,
                        color: Colors.grey,
                      ),
                    ),
                  ])
                  ),
                  SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.grey.withOpacity(0.2),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Due Date",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                        height: 100,
                        width: 250,
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
                                  backgroundColor: MaterialStateProperty.all(Colors.red),
                                ),
                                child: Text(
                                  'Add Task',
                                  style: TextStyle(fontSize: 25,),
                                ),
                              )),
                      ),
                          ),
                      
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
