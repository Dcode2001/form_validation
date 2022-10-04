import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: form_validation(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.purple),
  ));
}

class form_validation extends StatefulWidget {
  const form_validation({Key? key}) : super(key: key);

  @override
  State<form_validation> createState() => _form_validationState();
}

class _form_validationState extends State<form_validation> {
  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tcontact = TextEditingController();
  TextEditingController tpassword = TextEditingController();
  TextEditingController tconpassword = TextEditingController();

  String namemsg = "";
  String emailmsg = "";
  String contactmsg = "";
  String passwordmsg = "";
  String conpasswordmsg = "";

  bool nameerror = false;
  bool emailerror = false;
  bool contacterror = false;
  bool passworderror = false;
  bool conpassworderror = false;

  bool hidepass = true;
  bool hideconpass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Validation Error"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                TextField(
                  controller: tname,
                  onChanged: (value) {
                    if(nameerror)
                      {
                        if(value.length>0)
                          {
                            setState(() {
                              nameerror = false;
                            });
                          }
                      }
                  },
                  decoration: InputDecoration(
                      labelText: "Name",
                      errorText: nameerror ? namemsg : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: temail,
                  onChanged: (value) {
                    if(emailerror)
                    {
                      if(value.length>0)
                      {
                        setState(() {
                          emailerror = false;
                        });
                      }
                    }
                  },
                  decoration: InputDecoration(
                      errorText: emailerror ? emailmsg : null,
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: tcontact,
                  maxLength: 10,
                  onChanged: (value) {
                    if(contacterror)
                    {
                      if(value.length>0)
                      {
                        setState(() {
                          contacterror = false;
                        });
                      }
                    }
                  },
                  decoration: InputDecoration(
                      errorText: contacterror ? contactmsg : null,
                      labelText: "Contact",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                  TextField(
                  controller: tpassword,
                  onChanged: (value) {
                    if(passworderror)
                    {
                      if(value.length>0)
                      {
                        setState(() {
                          passworderror = false;
                        });
                      }
                    }
                  },
                  obscureText: hidepass,
                  decoration: InputDecoration(
                      errorText: passworderror ? passwordmsg : null,
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password_outlined),
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          hidepass = !hidepass;
                        });
                      }, icon: hidepass ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: tconpassword,
                  onChanged: (value) {
                    if(conpassworderror)
                    {
                      if(value.length>0)
                      {
                        setState(() {
                          conpassworderror = false;
                        });
                      }
                    }
                  },
                  obscureText: hideconpass,
                  decoration: InputDecoration(

                      errorText: conpassworderror ? conpasswordmsg : null,
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.password_rounded),
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          hideconpass = !hideconpass;
                        });
                      }, icon: hideconpass ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 30,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        String name = tname.text.trim();   // trim no use vadharani space kadhva mate thay che.....
                        String email = temail.text.trim();
                        String contact = tcontact.text.trim();
                        String password = tpassword.text.trim();
                        String conpass = tconpassword.text.trim();

                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email);

                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                        bool passvalid = regex.hasMatch(password);

                        if (name.isEmpty) {
                          setState(() {
                            nameerror = true;
                            namemsg = "Please Enter Name";
                          });
                        } else if (email.isEmpty) {
                          setState(() {
                            emailerror = true;
                            emailmsg = "Please Enter Email";
                          });
                        } else if (!emailValid) {
                          setState(() {
                            emailerror = true;
                            emailmsg = "Please Enter Valid Email";
                          });
                        } else if (contact.isEmpty) {
                          setState(() {
                            contacterror = true;
                            contactmsg = "Please Enter Contact";
                          });
                        } else if (contact.length != 10) {
                          setState(() {
                            contacterror = true;
                            contactmsg = "Please Enter Valid Contact";
                          });
                        } else if (password.isEmpty) {
                          setState(() {
                            passworderror = true;
                            passwordmsg = "Please Enter Password";
                          });
                        } else if (!passvalid) {
                          setState(() {
                            passworderror = true;
                            passwordmsg = "Please Enter Valid Password";
                          });
                        } else if (conpass != password) {
                          setState(() {
                            conpassworderror = true;
                            conpasswordmsg =
                                "Confirm Password Is Not Same As Password";
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("You Are Sucess login..."),
                            backgroundColor: Colors.green,
                          ));
                        }
                      },
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
