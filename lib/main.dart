// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

// The main function of the application.
void main() {
  // Running the MainApp widget
  runApp(const MainApp());
}

// Defining a stateless widget MainApp
class MainApp extends StatelessWidget {
  // Constructor for MainApp
  const MainApp({super.key});

  // Overriding the build method
  @override
  Widget build(BuildContext context) {
    // Returning MaterialApp as the root of the widget tree
    return const MaterialApp(
      home: CreditCardScreen(), // Setting CreditCardScreen as the home screen
    );
  }
}

// Defining a stateful widget CreditCardScreen
class CreditCardScreen extends StatefulWidget {
  // Constructor for CreditCardScreen
  const CreditCardScreen({super.key});

  // Overriding the createState method to create state for this widget
  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

// This line defines a private subclass named _CreditCardScreenState that extends the State class
class _CreditCardScreenState extends State<CreditCardScreen> {
  // These variables store the state of the CreditCardScreen:
  bool isCvvFocused = false; // Tracks if the CVV field is currently in focus
  bool showBackView = false;  // Controls whether to display the front or back of the card on the CreditCardWidget
  String _cardNumber = '';    // Stores the entered credit card number
  String _expiryDate = '';    // Stores the entered expiry date
  String _cardHolderName = ''; // Stores the card holder name entered by the user
  String _cvvCode = '';       // Stores the entered CVV code
  final formKey = GlobalKey<FormState>(); // A unique key to access the CreditCardForm state

  // This function updates the state variables based on changes in the CreditCardModel object received from the CreditCardForm
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
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
      // Disabling the debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // Setting the title of the AppBar
          title: const Text("Card Settings"),
          // Centering the title
          centerTitle: true,
        ),
        // Setting the background color of the Scaffold
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Creating a CreditCardWidget
                  CreditCardWidget(
                    // Setting the card number
                    cardNumber: _cardNumber,
                    // Setting the expiry date
                    expiryDate: _expiryDate,
                    // Setting the card holder name
                    cardHolderName: _cardHolderName,
                    // Setting the CVV code
                    cvvCode: _cvvCode,
                    // Deciding whether to show the back view
                    showBackView: showBackView,
                    // Setting the callback for when the credit card widget changes
                    onCreditCardWidgetChange: (CreditCardBrand brand) {},
                    // Obscuring the CVV
                    obscureCardCvv: true,
                    // Obscuring the card number
                    obscureCardNumber: true,
                    // Deciding whether to show the holder name
                    isHolderNameVisible: true,
                    // Enabling swipe gestures
                    isSwipeGestureEnabled: true,
                    // Setting the card type
                    cardType: CardType.mastercard,
                  ),
                  // Creating a CreditCardForm
                  CreditCardForm(
                    // Setting the form key
                    formKey: formKey,
                    // Setting the card number
                    cardNumber: _cardNumber,
                    // Setting the expiry date
                    expiryDate: _expiryDate,
                    // Setting the card holder name
                    cardHolderName: _cardHolderName,
                    // Setting the CVV code
                    cvvCode: _cvvCode,
                    // Obscuring the CVV
                    obscureCvv: true,
                    // Obscuring the card number
                    obscureNumber: true,
                    // Deciding whether to show the card number
                    isCardNumberVisible: true,
                    // Deciding whether to show the expiry date
                    isExpiryDateVisible: true,
                    // Deciding whether to show the holder name
                    isHolderNameVisible: true,
                    // Setting the callback for when the credit card model changes
                    onCreditCardModelChange: onCreditCardModelChange,
                    // Setting the input configuration
                    inputConfiguration: const InputConfiguration(
                      // Setting the decoration for the card number input field
                      cardNumberDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      // Setting the decoration for the expiry date input field
                      expiryDateDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      // Setting the decoration for the CVV input field
                      cvvCodeDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      // Setting the decoration for the card holder input field
                      cardHolderDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder',
                      ),
                      // Setting the text style for the card number
                      cardNumberTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      // Setting the text style for the card holder
                      cardHolderTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      // Setting the text style for the expiry date
                      expiryDateTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      // Setting the text style for the CVV
                      cvvCodeTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Adding some space
                  const SizedBox(
                    height: 20,
                  ),
                  // Creating a checkout button
                  ElevatedButton(
                    child: const Text('Checkout'),
                    onPressed: () {},
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
