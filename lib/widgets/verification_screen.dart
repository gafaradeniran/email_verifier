import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verify_mail/core/model.dart';

class VerificationScreen extends StatelessWidget {
  final VerifyModel verifyModel;
  const VerificationScreen({super.key, required this.verifyModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Validation Results',
            style: GoogleFonts.poppins(fontSize: 25, color: Colors.purple)),
        const SizedBox(height: 20),
        Text('E-mail Address: ${verifyModel.email}',
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.green)),
        Text('domain: ${verifyModel.domain}',
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.green)),
        Text('SMTP : ${verifyModel.smtpCheck}',
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.green)),
        Text('Mx Found: ${verifyModel.mxFound}',
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.green)),
        Text('Format Valid?: ${verifyModel.formatValid}',
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.green)),
      ],
    );
  }
}
