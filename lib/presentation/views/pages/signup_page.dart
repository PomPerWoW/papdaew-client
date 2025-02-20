import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.27),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF6B9080),
            ),
            child: SafeArea(  
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),  
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,  
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(right: 30.0), 
                        child: Image.asset(
                          'assets/images/papdaewlogo.png',
                          height: 80,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Real-time Queue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.73,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(40),
                topEnd: Radius.circular(40),
              ),
              color: Colors.white,
              ),
              child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: 16),
                Text(
                        'Back to Login',
                        style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        ),
                      ),
                SizedBox(height: 16),
                Text(
                  'Signup',
                  style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                          'Email',
                          style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          ),
                        ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username@gmail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xFFF5F5F5),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, 
                      horizontal: 20.0
                    ), 
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                          'Password',
                          style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          ),
                        ),
                ),
                SizedBox(height: 8),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xFFF5F5F5),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, 
                      horizontal: 20.0
                    ), 
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                          'Confirm Password',
                          style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          ),
                        ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xFFF5F5F5),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, 
                      horizontal: 20.0
                    ), 
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                          'Phone',
                          style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          ),
                        ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: '08999999999',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xFFF5F5F5),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, 
                      horizontal: 20.0
                    ), 
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF525252), // Button color
                    ),
                    onPressed: () {
                      // Handle login
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.white),
                      ),
                    ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      )
    );
  }
}