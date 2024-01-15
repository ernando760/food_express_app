import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

extension MoneyFommaterExtensions on BuildContext {
  MoneyFormatter moneyFommater(double amount) => MoneyFormatter(amount: amount);
}
