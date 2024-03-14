import 'package:faciltateur_de_vies/core/utility/payment_card.dart';
import 'package:flutter/material.dart';
/// This class not used we are write it to test only

class PaymentHelper {
  static String getCleanedNumber(String text) {
    RegExp regExp =  RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }
  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith( RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.master;
    } else if (input.startsWith( RegExp(r'[4]'))) {
      cardType = CardType.visa;
    } else if (input
        .startsWith( RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = CardType.verve;
    } else if (input.startsWith( RegExp(r'((34)|(37))'))) {
      cardType = CardType.americanExpress;
    } else if (input.startsWith( RegExp(r'((6[45])|(6011))'))) {
      cardType = CardType.discover;
    } else if (input
        .startsWith( RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = CardType.dinersClub;
    } else if (input.startsWith( RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = CardType.jcb;
    } else if (input.length <= 8) {
      cardType = CardType.others;
    } else {
      cardType = CardType.invalid;
    }
    return cardType;
  }


  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CardType.master:
        img = 'mastercard.png';
        break;
      case CardType.visa:
        img = 'visa.png';
        break;
      case CardType.verve:
        img = 'verve.png';
        break;
      case CardType.americanExpress:
        img = 'american_express.png';
        break;
      case CardType.discover:
        img = 'discover.png';
        break;
      case CardType.dinersClub:
        img = 'dinners_club.png';
        break;
      case CardType.jcb:
        img = 'jcb.png';
        break;
      case CardType.others:
        icon =  Icon(
          Icons.credit_card,
          size: 40.0,
          color: Colors.grey[600],
        );
        break;
      default:
        icon =  Icon(
          Icons.warning,
          size: 40.0,
          color: Colors.grey[600],
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget =  Image.asset(
        'assets/images/$img',
        width: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

}