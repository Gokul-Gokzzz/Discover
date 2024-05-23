import 'package:discover/view/user/booking/conform_payment.dart';
import 'package:discover/view/user/booking/success_booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetalBooking extends StatefulWidget {
  const DetalBooking({super.key});

  @override
  _DetalBookingState createState() => _DetalBookingState();
}

class _DetalBookingState extends State<DetalBooking> {
  final _formKey = GlobalKey<FormState>();
  final _guestNameController = TextEditingController();
  final _guestNumberController = TextEditingController();
  final _countryCodeController = TextEditingController(text: '+91');
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _idNumberController = TextEditingController();

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Booking',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.03,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Get the best out of derleng by creating an account',
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenHeight * 0.02),
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: _guestNameController,
                  decoration: InputDecoration(
                    labelText: 'Guest name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter guest name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: _guestNumberController,
                  decoration: InputDecoration(
                    labelText: 'Guest number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter guest number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.2,
                      child: TextFormField(
                        controller: _countryCodeController,
                        decoration: InputDecoration(
                          prefixText: '',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter country code';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: _idNumberController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'ID Number',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ID number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$1200/2 Person',
                      style: TextStyle(
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConformPayment()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
