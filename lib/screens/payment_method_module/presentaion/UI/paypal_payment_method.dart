import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/paypal_request_payment_model.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/data/models/paypal_recurrent_request_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as view;

import '../../../../routes/routes_provider/routes_provider.dart';

class PayPalScreen extends StatelessWidget {
  final PayPalRecurrentRequestModel? payPalRecurrentRequestModel;
  final PayPalRequestModel? payPalRequestModel;
  const PayPalScreen(
      {Key? key, this.payPalRequestModel, this.payPalRecurrentRequestModel})
      : super(key: key);

  String _loadBaseHTML() {
    return '''
      <html>
        <body onload="document.f.submit();">
          <form id="f" name="f" method="post" action="${payPalRequestModel!.url}">
            <input type="hidden" name="amountValue" value="${payPalRequestModel!.amountValue}" />
             <input type="hidden" name="amountCurrency" value="${payPalRequestModel!.amountCurrency}" />
            <input type="hidden" name="note" value="${payPalRequestModel!.note}" />
          </form>
        </body>
      </html>
    ''';
  }

  String _loadSubsHTML() {
    return '''
      <html>
        <body onload="document.f.submit();">
          <form id="f" name="f" method="post" action="${payPalRecurrentRequestModel!.url}">
            <input type="hidden" name="value" value="${payPalRecurrentRequestModel!.amount}" />
             <input type="hidden" name="currency" value="${payPalRecurrentRequestModel!.currency}" />
            <input type="hidden" name="cycle" value="${int.parse(payPalRecurrentRequestModel!.cycle)}" />
          </form>
        </body>
      </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    bool isBase = payPalRequestModel != null;
    return WillPopScope(
      onWillPop: () async {
        RoutingProvider.goBackWithResult(false);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: view.WebView(
            onPageFinished: (page) {
              if (page.contains('/success-subscription') ||
                  page.contains('/success')) {
                Utility.showToast(
                    message: "Payment has been complete successfully");
                RoutingProvider.goBackWithResult(true);
              } else if (page.contains('/cancel')) {
                Utility.showToast(
                    message: "Payment is not complete successfully");
                RoutingProvider.goBackWithResult(false);
              }
            },
            javascriptMode: view.JavascriptMode.unrestricted,
            initialUrl: Uri.dataFromString(
                    isBase ? _loadBaseHTML() : _loadSubsHTML(),
                    mimeType: 'text/html')
                .toString(),
          ),
        ),
      ),
    );
  }
}
