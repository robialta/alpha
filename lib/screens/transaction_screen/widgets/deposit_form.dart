import 'package:alpha/app/widget_support.dart';
import 'package:alpha/common/constant/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DepositForm extends StatefulWidget {
  const DepositForm({super.key});

  @override
  State<DepositForm> createState() => _DepositFormState();
}

class _DepositFormState extends State<DepositForm> {
  String? _amount;
  String? _fromAccount;
  String? _selectedPaymentMethod;
  String? _selectedDestinationAccount;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(24)),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Balance \$1.000'),
              AppWidget.divider(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('Deposit method'),
              ),
              DropdownButtonFormField(
                hint: Text(
                  'Please select..',
                  style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                ),
                dropdownColor: grey700,
                validator: _validator,
                onSaved: (newValue) {
                  _selectedPaymentMethod = newValue;
                },
                items: [
                  const DropdownMenuItem(
                    child: Text('USDT ERC20'),
                    value: 'USDT_ERC20',
                  )
                ],
                onChanged: (value) {},
              ),
              _spaceHeight12,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Amount'),
              ),
              TextFormField(
                validator: _validator,
                onSaved: (newValue) {
                  _amount = newValue;
                },
                decoration: InputDecoration(
                  hintText: 'Amount',
                ),
              ),
              _spaceHeight12,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('From account'),
              ),
              TextFormField(
                validator: _validator,
                onSaved: (newValue) {
                  _fromAccount = newValue;
                },
                decoration: InputDecoration(
                  hintText: 'From account',
                ),
              ),
              _spaceHeight12,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('To account'),
              ),
              DropdownButtonFormField(
                hint: Text(
                  'Please select..',
                  style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                ),
                dropdownColor: grey700,
                validator: _validator,
                onSaved: (newValue) {
                  _selectedDestinationAccount = newValue;
                },
                items: [
                  DropdownMenuItem(
                    child: Text('0x51d31B91Bca954CfeA1C712BD43c0b308deb1712'),
                    value: '0x51d31B91Bca954CfeA1C712BD43c0b308deb1712',
                  ),
                  DropdownMenuItem(
                    child: Text('0x06c70F3Bc8Cfa92E37C5cd8211302BD8775C9014'),
                    value: '0x06c70F3Bc8Cfa92E37C5cd8211302BD8775C9014',
                  )
                ],
                onChanged: (value) {},
              ),
              _spaceHeight12,
              Flexible(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: primary,
                      foregroundColor: Colors.white,
                      minimumSize: Size(120, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      showDialog<void>(
                        context: context,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                      try {
                        await FirebaseFirestore.instance
                            .collection('transactions')
                            .add({
                          'amount': _amount,
                          'date': DateTime.now().toLocal().toString(),
                          'transaction_type': 'deposit',
                          'from_account': _fromAccount,
                          'to_account': _selectedDestinationAccount,
                          'payment_method': _selectedPaymentMethod,
                          'uid': FirebaseAuth.instance.currentUser!.uid
                        });

                        if (context.mounted) {
                          Navigator.of(context).pop();
                          _formKey.currentState!.reset();
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.success(
                              message:
                                  'Your transaction is successfull, please wait for confirmation from admin',
                            ),
                            displayDuration: const Duration(milliseconds: 4000),
                          );
                        }
                      } catch (e) {
                        Navigator.of(context).pop();
                        showTopSnackBar(
                          context,
                          CustomSnackBar.error(
                            message: e.toString(),
                          ),
                          displayDuration: const Duration(milliseconds: 4000),
                        );
                      }
                    }
                  },
                  child: Text('Deposit'),
                ),
              ),
              _spaceHeight12,
            ],
          ),
        ),
      ),
    );
  }

  String? _validator(String? value) =>
      value == null || value == '' ? 'Field required' : null;

  SizedBox get _spaceHeight12 => SizedBox(
        height: 12,
      );
}
