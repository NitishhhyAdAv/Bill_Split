import 'package:billsplit_apk/auth/Otpscreen.dart';
import 'package:billsplit_apk/auth/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false; 
  void sendOTP() async {
    String phone = phoneController.text.trim();

    if (phone.isEmpty || !RegExp(r'^\+\d{10,15}$').hasMatch(phone)) {
      showSnackbar('Enter a valid phone number with country code');
      return;
    }

    setState(() {
      isLoading = true; 
    });

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          navigateToHome();
        },
        verificationFailed: (FirebaseAuthException e) {
          showSnackbar('Verification failed: ${e.message}');
        },
        codeSent: (String verId, int? resendToken) {
          setState(() {
            isLoading = false; 
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(verificationId: verId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verId) {
          setState(() {
            isLoading = false; 
          });
        },
      );
    } catch (e) {
      setState(() {
        isLoading = false; 
      });
      showSnackbar('Error: $e');
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Authentication')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your phone number',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator() 
                : ElevatedButton(
                    onPressed: sendOTP,
                    child: const Text('Send OTP'),
                  ),
          ],
        ),
      ),
    );
  }
}
