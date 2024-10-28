import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  var isObsecurePassword = true;
  var isObsecureRePassword = true;
  var tfEmailController = TextEditingController();
  var tfPasswordController = TextEditingController();
  var tfRePasswordController = TextEditingController();
  var isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _content()),
    );
  }

  Widget _content() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        gradient: LinearGradient(
          colors: [Colors.blue.shade200, Colors.blue.shade400],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 100), // Space for logo alignment
          _buildLogo(),
          const SizedBox(height: 50),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCustomTabBar(),
                    if (isLoginSelected)
                      _buildLoginForm(context)
                    else
                      _buildRegisterForm(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/logo.svg',
          width: 100, // Set the desired width
          height: 100,
        ),
      ],
    );
  }

  Widget _buildRegisterForm() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      child: Column(
        children: [
          // Username Field
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Username"),
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFEDF1F3)),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Enter your username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Password Field
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Password"),
          ),
          TextField(
            controller: tfPasswordController,
            obscureText: isObsecurePassword,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFEDF1F3)),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Enter your password",
              suffixIcon: IconButton(
                icon: isObsecurePassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    isObsecurePassword = !isObsecurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Re-enter Password Field
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Re-enter Password"),
          ),
          TextField(
            controller: tfRePasswordController,
            obscureText: isObsecureRePassword,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFEDF1F3)),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Re-enter your password",
              suffixIcon: IconButton(
                icon: isObsecureRePassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    isObsecureRePassword = !isObsecureRePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Sign Up Button
          ElevatedButton(
            onPressed: () {
              // Sign Up Action
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D61E7), // background
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      child: Column(
        children: [
          // Username Field
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Username"),
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFEDF1F3)),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Enter your username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Password Field
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Password"),
          ),
          TextField(
            obscureText: isObsecurePassword,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFEDF1F3)),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Enter your password",
              suffixIcon: IconButton(
                icon: isObsecurePassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    isObsecurePassword = !isObsecurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Forgot Password & Remember me
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Text("Remember me"),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Forgot Password Action
                },
                child: const Text("Forgot Password?"),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Log In Button
          ElevatedButton(
            onPressed: () {
              // Login Action
            },
            child: const Text("Log In", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D61E7), // background
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTabBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 24.0),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.grey.shade200, // Background color for the tab bar
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
        ),
        child: Row(
          children: [
            // Log In Tab
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoginSelected = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor:
                      isLoginSelected ? Colors.white : Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Log In",
                    style: isLoginSelected
                        ? const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)
                        : const TextStyle(color: Colors.grey)),
              ),
            ),

            const SizedBox(width: 2),

            // Sign Up Tab
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoginSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor:
                      !isLoginSelected ? Colors.white : Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Sign Up",
                    style: !isLoginSelected
                        ? const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)
                        : const TextStyle(color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
