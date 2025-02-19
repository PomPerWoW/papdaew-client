import 'package:flutter/material.dart';
import 'package:papdaew_client/widgets/navbar_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Login',
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
                    hintText: 'username@gmail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Color(0xFFF5F5F5),
                    filled: true,
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
                    hintText: 'enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Color(0xFFF5F5F5),
                    filled: true,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle forgot password
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Color(0xFF525252),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
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
                      'Login',
                      style: TextStyle(color: Colors.white),
                      ),
                    ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Or login with'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFFF5F5F5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () {
                          // Handle Facebook login
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFFF5F5F5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () {
                          // Handle Google login
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFFF5F5F5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.apple),
                        onPressed: () {
                          // Handle Apple login
                        },
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Don’t have an account yet?"),
                    TextButton(
                      onPressed: () {
                      // Handle sign up
                      },
                      child: Text(
                        'Sign up for free',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF525252)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}