import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
    required this.currency,
    this.isInverted = false,
  });

  final String name;
  final String price;
  final IconData icon;
  final String currency;
  final bool isInverted;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : Color(0xFF1F2123),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: isInverted ? Colors.black : Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        color: isInverted ? Colors.black : Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      currency,
                      style: TextStyle(
                        color: isInverted
                            ? Colors.black.withOpacity(.8)
                            : Colors.white.withOpacity(.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Transform.scale(
              scale: 2,
              child: Transform.translate(
                offset: Offset(5, 10),
                child: Icon(
                  icon,
                  size: 88,
                  color: isInverted ? Colors.black : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
