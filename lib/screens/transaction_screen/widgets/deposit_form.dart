import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DepositForm extends StatefulWidget {
  const DepositForm({super.key});

  @override
  State<DepositForm> createState() => _DepositFormState();
}

class _DepositFormState extends State<DepositForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Balance \$1.000'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('Deposit method'),
              ),
              DropdownButtonFormField(
                hint: Text(
                  'Please select..',
                  style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                ),
                validator: _validator,
                onSaved: (newValue) {
                },
                items: const [
                  DropdownMenuItem(
                    value: 'USDT_ERC20',
                    child: Text('USDT ERC20'),
                  )
                ],
                onChanged: (value) {},
              ),
              _spaceHeight12,
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('Amount'),
              ),
              TextFormField(
                validator: _validator,
                onSaved: (newValue) {
                },
                decoration: const InputDecoration(
                  hintText: 'Amount',
                ),
              ),
              _spaceHeight12,
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('From account'),
              ),
              TextFormField(
                validator: _validator,
                onSaved: (newValue) {
                },
                decoration: const InputDecoration(
                  hintText: 'From account',
                ),
              ),
              _spaceHeight12,
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('To account'),
              ),
              DropdownButtonFormField(
                hint: Text(
                  'Please select..',
                  style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                ),
                validator: _validator,
                onSaved: (newValue) {
                },
                items: const [
                  DropdownMenuItem(
                    value: '0x51d31B91Bca954CfeA1C712BD43c0b308deb1712',
                    child: Text('0x51d31B91Bca954CfeA1C712BD43c0b308deb1712'),
                  ),
                  DropdownMenuItem(
                    value: '0x06c70F3Bc8Cfa92E37C5cd8211302BD8775C9014',
                    child: Text('0x06c70F3Bc8Cfa92E37C5cd8211302BD8775C9014'),
                  )
                ],
                onChanged: (value) {},
              ),
              _spaceHeight12,
              Flexible(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: const Size(120, 50),
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
                  child: const Text('Deposit'),
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

  SizedBox get _spaceHeight12 => const SizedBox(
        height: 12,
      );
}
