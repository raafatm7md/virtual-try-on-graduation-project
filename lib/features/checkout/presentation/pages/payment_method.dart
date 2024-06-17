import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_credit_card/u_credit_card.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: backIcon,
        ),
        title: const Text('Payment Methods'),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: padding),
        child: Column(
          children: [
            Text(
              'Choose a payment method',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h),
            const CreditCardUi(
              cardHolderFullName: 'Raafat Mohamed',
              cardNumber: '1234 5678 9123 4567',
              validThru: '05/25',
              topLeftColor: Colors.blue,
              placeNfcIconAtTheEnd: true,
              showValidFrom: false,
              cardType: CardType.debit,
              enableFlipping: true,
              cvvNumber: '123',
              creditCardType: CreditCardType.mastercard,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'x',
                  groupValue: 'x',
                  onChanged: (value) {},
                ),
                Text(
                  'Use as default payment method',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            const CreditCardUi(
              cardHolderFullName: 'Raafat Mohamed',
              cardNumber: '9876543219876543',
              validThru: '03/26',
              enableFlipping: true,
              placeNfcIconAtTheEnd: true,
              showValidFrom: false,
              cvvNumber: '987',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'y',
                  groupValue: 'x',
                  onChanged: (value) {},
                ),
                Text(
                  'Use as default payment method',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
