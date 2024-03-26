import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:icons_flutter/icons_flutter.dart';
void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreditCardScreen(),
    );
  }
}

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  bool isCvvFocused = false;
  bool showBackView = false;
  String _cardNumber = '';
  String _expiryDate = '';
  String _cardHolderName = '';
  String _cvvCode = '';
  final formKey = GlobalKey<FormState>();

  void onCreditCardModelChange(CreditCardModel  creditCardModel){
    setState(() {
      _cardNumber = creditCardModel.cardNumber;
      _cvvCode = creditCardModel.cvvCode;
      _cardHolderName = creditCardModel.cardHolderName;
      _expiryDate = creditCardModel.expiryDate;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(AntDesign.antdesign,size: 60,),
                CreditCardWidget(
                  cardNumber: _cardNumber,
                  expiryDate: _expiryDate,
                  cardHolderName: _cardHolderName,
                  cvvCode: _cvvCode,
                  showBackView: showBackView,
                  onCreditCardWidgetChange: (CreditCardBrand brand) {},
                  bankName: 'Axis Bank',
                  obscureCardCvv: true,
                  obscureCardNumber: true,
                  isHolderNameVisible: true,
                  isSwipeGestureEnabled: true,
                  cardType: CardType.visa,
                ),
                CreditCardForm(
                  formKey: formKey,
                  cardNumber: _cardNumber,
                  expiryDate: _expiryDate,
                  cardHolderName: _cardHolderName,
                  cvvCode: _cvvCode,
                  obscureCvv: true,
                  obscureNumber: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  isHolderNameVisible: true,
                  onCreditCardModelChange: onCreditCardModelChange,
                  inputConfiguration: const InputConfiguration(
                    cardNumberDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                    ),
                    cardNumberTextStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    cardHolderTextStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    expiryDateTextStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    cvvCodeTextStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),

                ),
                SizedBox(height: 20,),

                ElevatedButton(
                    onPressed: () {},
                    child: Text("Complete Payment")
                ),
              ],
            ),
          ),
        ),
        ),
      );
  }
}

class ElelvatedButton {
}
