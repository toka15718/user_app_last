// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, import_of_legacy_library_into_null_safe, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class login_signup_screen extends StatefulWidget {
  @override
  _login_signup_screenState createState() => _login_signup_screenState();
}

class _login_signup_screenState extends State<login_signup_screen> {
  bool isSignupScreen = true;
  bool isRememberMe = false;
  bool isMale = true;
  bool _isHiddenpass = true;
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _emailController1 = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _emailController2 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      backgroundColor: Color(0xFFECF3F9),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/index.jpg'),
                fit: BoxFit.fill,
              )),
              child: Container(
                padding: EdgeInsets.only(top: 90, right: 10),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: isSignupScreen ? "مرحبا بك فى " : "مرحبا ",
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 25,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? "تنقلنى" : "بعودتك ",
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: isSignupScreen
                          ? Text(
                              "انشئ حساب للمتابعة",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Tajawal',
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              "سجل دخول للمتابعة",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Tajawal',
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(true),
          AnimatedPositioned(
            duration: Duration(microseconds: 700),
            curve: Curves.bounceInOut,
            top: 190,
            child: AnimatedContainer(
              duration: Duration(microseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 520 : 300,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "انشاء حساب",
                                style: TextStyle(
                                  fontFamily: "Tajawal",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Color(0xFF09126C)
                                      : Color(0XFFA7BCC7),
                                ),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 78,
                                  color: Colors.orange,
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "سجل دخول",
                                style: TextStyle(
                                  fontFamily: "Tajawal",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Color(0XFFA7BCC7)
                                      : Color(0xFF09126C),
                                ),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 75,
                                  color: Colors.orange,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSignupScreen) buildSignUpContainer(),
                    if (!isSignupScreen) buildSignInContainer()
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(false),
          Positioned(
            top: MediaQuery.of(context).size.height - 70,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextButton(
                          Image(
                              image: AssetImage('assets/images/facebook.png'),
                              color: Colors.white,
                              width: 30),
                          "فيسبوك",
                          Color(0xFF3B5999)),
                      Text(
                        "او ",
                        style: TextStyle(
                            fontFamily: 'Tajawal',
                            color: Color(0XFFA7BCC7),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      buildTextButton(
                          Image(
                            image: AssetImage('assets/images/google.png'),
                            width: 30,
                          ),
                          "جوجل",
                          Color(0xFFDE4B39)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildSignInContainer() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(children: [
        buildTextField(
            Icons.email_outlined,
            _emailController2,
            "البريد الالكترونى او رقم الهاتف",
            false,
            true,
            false,
            false,
            false),
        buildTextField(Icons.lock_outline, _passwordController2, "كلمة السر",
            true, false, false, false, false),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isRememberMe,
                  activeColor: Color(0XFF9BB3C0),
                  onChanged: (value) {
                    setState(() {
                      isRememberMe = !isRememberMe;
                    });
                  },
                ),
                Text("تذكرنى",
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 20,
                        color: Color(0XFFA7BCC7)))
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text("نسيت كلمة السر؟",
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 20,
                      color: Color(0XFFA7BCC7))),
            )
          ],
        )
      ]),
    );
  }

  Container buildSignUpContainer() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          buildTextField(Icons.person_outline, _firstnameController,
              "الاسم الاول", false, false, true, false, false),
          buildTextField(Icons.person_outline, _lastnameController,
              "الاسم الاخير", false, false, false, true, false),
          buildTextField(Icons.markunread_outlined, _emailController1,
              "البريد الالكترونى", false, true, false, false, false),
          buildTextField(Icons.phone_outlined, _phonenumberController,
              "رقم الهاتف", false, false, false, false, true),
          buildTextField(Icons.lock_outline, _passwordController1, "كلمة السر",
              true, false, false, false, false),
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color:
                              isMale ? Color(0XFF9BB3C0) : Colors.transparent,
                          border: Border.all(
                              width: 1,
                              color: isMale
                                  ? Colors.transparent
                                  : Color(0XFFA7BCC7)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.man_outlined,
                          textDirection: TextDirection.rtl,
                          color: isMale ? Colors.white : Color(0xFFB6C7D1),
                        ),
                      ),
                      Text(
                        "ذكر",
                        style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 20,
                            color: Color(0XFFA7BCC7)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color:
                              isMale ? Colors.transparent : Color(0XFF9BB3C0),
                          border: Border.all(
                              width: 1,
                              color: isMale
                                  ? Color(0XFFA7BCC7)
                                  : Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.woman_outlined,
                          color: isMale ? Color(0xFFB6C7D1) : Colors.white,
                        ),
                      ),
                      Text(
                        "انثى",
                        style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 20,
                            color: Color(0XFFA7BCC7)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "بالضغط على 'إرسال' فإنك توافق على ",
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 20,
                      color: Color(0XFF9BB3C0)),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: "الشروط والأحكام",
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 20,
                          color: Colors.orange),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(Image image, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          image,
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  AnimatedPositioned buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 660 : 440,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(255, 204, 128, 1),
                        Color.fromRGBO(239, 83, 80, 1)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                )
              : Center(),
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon,
      TextEditingController _controller,
      String hintText,
      bool isPassword,
      bool isEmail,
      bool firstName,
      bool lastName,
      bool phoneNumber) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword && _isHiddenpass,
        controller: _controller,
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : (phoneNumber ? TextInputType.number : TextInputType.text),
        inputFormatters: phoneNumber
            ? [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ]
            : null,
        textAlign: TextAlign.right,
        style: TextStyle(
            fontFamily: 'Tajawal',
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Color(0xFFB6C7D1),
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                      _isHiddenpass ? Icons.visibility : Icons.visibility_off,
                      size: 28,
                      color: Colors.grey[700]),
                  onPressed: () {
                    setState(() {
                      _isHiddenpass = !_isHiddenpass;
                    });
                  },
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0XFFA7BCC7),
            ),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0XFFA7BCC7),
            ),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 20,
            color: Color(0XFFA7BCC7),
          ),
        ),
      ),
    );
  }
}
