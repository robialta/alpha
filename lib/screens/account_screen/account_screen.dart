import 'package:alpha/common/constant/images.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Center(
        child: UnconstrainedBox(
          child: LimitedBox(
            maxWidth: 800,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // -- IMAGE with ICON
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(image: AssetImage(avtMale2))),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),

                    // -- Form Fields
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: '',
                            decoration: const InputDecoration(
                                label: Text('tFullName'),
                                prefixIcon: Icon(Icons.people)),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            initialValue: '',
                            decoration: const InputDecoration(
                                label: Text('tEmail'),
                                prefixIcon: Icon(Icons.event_note)),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            initialValue: '',
                            decoration: const InputDecoration(
                                label: Text('tPhoneNo'),
                                prefixIcon: Icon(Icons.phone)),
                          ),
                          const SizedBox(height: 20),

                          // -- Form Submit Button

                          const SizedBox(height: 20),

                          // -- Created Date and Delete Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text.rich(
                                TextSpan(
                                  text: 'tJoined',
                                  style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                        text: 'tJoinedAt',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.redAccent.withOpacity(0.1),
                                    elevation: 0,
                                    foregroundColor: Colors.red,
                                    shape: const StadiumBorder(),
                                    side: BorderSide.none),
                                child: const Text('tDelete'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
