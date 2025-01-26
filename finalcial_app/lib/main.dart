import 'package:finalcial_app/widgets/button.dart';
import 'package:finalcial_app/widgets/CurrencyCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial App',
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hey, Selena',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white.withOpacity(.8),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '\$5,194,678.90',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Button(
                        text: 'Transfer',
                        color: Colors.amber,
                        textColor: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Button(
                        text: 'Request',
                        color: Color(0xFF1F2123),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Wallets',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'View all',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.8),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Column(
                            children: [
                              CurrencyCard(
                                name: 'Euro',
                                price: '6,428',
                                icon: Icons.euro_rounded,
                                currency: 'EUR',
                              ),
                              Transform.translate(
                                offset: Offset(0, -10),
                                child: CurrencyCard(
                                  name: 'Bitcoin',
                                  price: '6,428',
                                  icon: Icons.currency_bitcoin_rounded,
                                  currency: 'BTC',
                                  isInverted: true,
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(0, -10),
                                child: CurrencyCard(
                                  name: 'Dollar',
                                  price: '428',
                                  icon: Icons.attach_money_rounded,
                                  currency: 'USD',
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
