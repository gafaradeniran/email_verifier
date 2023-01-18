import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verify_mail/core/api_service.dart';
import 'package:verify_mail/core/model.dart';
import 'package:verify_mail/painting/arc.dart';
import 'package:verify_mail/widgets/button.dart';
import 'package:verify_mail/widgets/textform.dart';
import 'package:verify_mail/widgets/verification_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller;

  VerifyModel? modelData;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  getEmail() async {
    try {
      Future<VerifyModel> verifyEmailData =
          ApiService().verifyEmailApi(_controller.text);
      verifyEmailData.then((value) {
        setState(() {
          modelData = value;
        });
        showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            context: context,
            builder: (context) => VerificationScreen(
                  verifyModel: modelData!,
                ));
      });
    } on SocketException catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple,
            Colors.pink,
            Colors.orange,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('E-mail Verification App', style: GoogleFonts.poppins()),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.orange,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'This App allows users to verify if an e-mail address exists.\nType any email address and hit the verify button',
                                softWrap: true,
                                style: GoogleFonts.paytoneOne(
                                    color: Colors.white,
                                    fontSize: 16,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          Expanded(
                            child: CustomPaint(
                                painter: ArcShapePainter(),
                                child: const SizedBox(height: 50)),
                          )
                        ])),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                                'Please enter an e-mail address in the field below',
                                softWrap: true,
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 16)),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 40,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextForm(
                                  textController: _controller,
                                  hintText: 'E-mail address'),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Button(
                            text: 'Verify Availability',
                            onPressed: (() {
                              getEmail();
                            }),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
