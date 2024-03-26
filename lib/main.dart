import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:flutter/services.dart';
import 'separator.dart';
void main() {
  runApp(mainapp());
}

class mainapp extends StatelessWidget {
  const mainapp({super.key});

  @override
  Widget build(BuildContext context) {
    return creditcardscreen();
  }
}

class creditcardscreen extends StatefulWidget {
  const creditcardscreen({super.key});

  @override
  State<creditcardscreen> createState() => _creditcardscreenState();
}

class _creditcardscreenState extends State<creditcardscreen> {
  bool isCvvFocused = false;
  String _cardNumber = '';
  String _expiryDate = '';
  String _cardHolderName = '';
  String _cvvCode = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(AntDesign.antdesign,size: 60,),
                    CreditCardWidget(
                      cardNumber: _cardNumber,
                      expiryDate: _expiryDate,
                      cardHolderName: _cardHolderName,
                      cvvCode: _cvvCode,
                      showBackView: false,
                      //true when you want to show cvv(back) view
                      onCreditCardWidgetChange: (CreditCardBrand
                          brand) {}, // Callback for anytime credit card brand is changed
                    ),
                    //account number
                    Padding(
                      padding: const EdgeInsets.only(left: 13,right: 13,top: 20,bottom: 20),
                      child: TextField(
                        onChanged: (value)
                        {
                          setState(() {
                            _cardNumber = value;
                          });
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CardNumberFormatter(),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Card Number",
                            hintText: "XXXX XXXX XXXX XXXX",
                            contentPadding: EdgeInsetsDirectional.only(
                                top: 20.0, bottom: 20.0, start: 25.0, end: 5.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.red))),
                        autofocus: true,
                        autocorrect: true,
                      ),
                    ),

                    Padding(

                      padding: const EdgeInsets.only(left: 13,right: 13,bottom: 20),
                      child: TextField(
                        onChanged: (value)
                        {
                          setState(() {
                            _cardHolderName = value;
                          });
                         },
                        decoration: InputDecoration(
                            labelText: "CardHolder Name",
                            contentPadding: EdgeInsetsDirectional.only(
                                top: 20.0, bottom: 20.0, start: 25.0, end: 5.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.red))),
                        autofocus: true,
                        autocorrect: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 13, right: 10, top: 5, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (value)
                              {
                                setState(() {
                                  _expiryDate = value;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: "Expiry Date",
                                  contentPadding: EdgeInsetsDirectional.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      start: 25.0,
                                      end: 5.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)))),
                              autofocus: true,
                              autocorrect: true,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value)
                              {
                                setState(() {
                                  _cvvCode = value;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: "Cvv",
                                  contentPadding: EdgeInsetsDirectional.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      start: 25.0,
                                      end: 5.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)))),
                              autofocus: true,
                              autocorrect: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      child: const Text('Proceed to Pay'),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(

                      ),
                    ),
                  ],
                ),
              ),
            ),
        ),
        ),
      );
  }
}

class ElelvatedButton {
}
