import 'dart:ui';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_number/Detail/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final phoneNumber = TextEditingController();
  String title = 'Country Code Picker';
  String selectedCountryName = "India";
  String selectedCountryCode = "IN";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: const Color(0xFFe49b0e),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                child: Image.asset("assets/image/logo.png"),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      // color: Color(0xFFe49b0e),
                      decoration: BoxDecoration(
                          color: Color(0xFFe49b0e),
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 1.0)),
                      margin: const EdgeInsets.only(left: 16.0),
                      child: CountryCodePicker(
                        initialSelection: 'IN',
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        favorite: const ['+91', 'IN'],
                        enabled: true,
                        hideMainText: false,
                        showFlagMain: true,
                        showFlag: true,
                        hideSearch: false,
                        showFlagDialog: true,
                        alignLeft: true,
                        onChanged: (CountryCode code) {
                          selectedCountryName = code.name!;
                          selectedCountryCode = code.code!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: TextField(
                          cursorColor: const Color(0xFFe49b0e),
                          controller: phoneNumber,
                          decoration: const InputDecoration(
                              labelText: "Enter your number",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              labelStyle: TextStyle(
                                color: Color(0xFFe49b0e),
                              )),
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color(0xFFe49b0e),
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width * .93,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                  selectedCountryName,
                                  selectedCountryCode,
                                  phoneNumber.text)));
                      //  Country(numberHolder : phoneNumber.text,)
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ));
  }
}
