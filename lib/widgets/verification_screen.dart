import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verify_mail/core/model.dart';

class VerificationScreen extends StatelessWidget {
  final VerifyModel verifyModel;
  const VerificationScreen({super.key, required this.verifyModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        children: [
          Text('Validation Results',
              style: GoogleFonts.poppins(fontSize: 25, color: Colors.purple)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('E-mail Address:'),
              Text('${verifyModel.email}',
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.green))
            ],
          ),
          Row(
            children: [
              const Text('Domain: '),
              Text('${verifyModel.domain}',
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.green))
            ],
          ),
          Row(
            children: [
              const Text('SMTP Check: '),
              Text('${verifyModel.smtpCheck}',
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.green))
            ],
          ),
          Row(
            children: [
              const Text('Mx Found: '),
              Text('${verifyModel.mxFound}',
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.green))
            ],
          ),
          Row(
            children: [
              const Text('Format Valid?: '),
              Text('${verifyModel.formatValid}',
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.green))
            ],
          ),
          const SizedBox(height: 20),
          if (verifyModel.mxFound == true && verifyModel.smtpCheck == true) ...{
            Text('Your email address is valid and can receive electronic mail',
                softWrap: true,
                style: GoogleFonts.sourceCodePro(
                    color: Colors.green, fontSize: 18))
          } else if (verifyModel.mxFound == true &&
              verifyModel.smtpCheck != true) ...{
            Text('Your email is valid but cannot recieve email',
                style: GoogleFonts.sourceCodePro(color: Colors.redAccent))
          } else ...{
            Text(
              'Your email is invalid and cannot recieve mail!',
              style: GoogleFonts.sourceCodePro(color: Colors.red),
            )
          }
        ],
      ),
    );
  }
}
