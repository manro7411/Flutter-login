import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Login';
    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(title: const Text(appTitle)),
          body: const MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myName = TextEditingController();
  final myID = TextEditingController();
  final myEmail = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myName.dispose();
    myID.dispose();
    myEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
            controller: myName,
            decoration: const InputDecoration(labelText: 'Enter your Name'),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                      .hasMatch(value)) {
                return "Enter your name";
              } else {
                return null;
              }
              ;
            }),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
            controller: myID,
            decoration:
                const InputDecoration(labelText: 'Enter your Student ID'),
            maxLength: 11,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(r'^[+*[()]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                      .hasMatch(value)) {
                return "Enter your Student ID";
              } else {
                return null;
              }
              ;
            }),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
            controller: myEmail,
            decoration: const InputDecoration(labelText: 'Enter your Email'),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                return "Enter valid Email";
              } else {
                return null;
              }
              ;
            }),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(
                        'Name : ${myName.text}\nStudent ID : ${myID.text}\nE-mail : ${myEmail.text}'),
                  );
                },
              );
            },
            child: const Align(
                alignment: Alignment.center, child: const Text("Submit"))),
      )
    ]));
  }
}

// Text(myController.text)
