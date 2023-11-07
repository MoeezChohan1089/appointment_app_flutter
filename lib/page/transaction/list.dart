part of '../pages.dart';

class listPay extends StatefulWidget {
  @override
  _listPayState createState() => _listPayState();
}

class _listPayState extends State<listPay> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Method"),
        backgroundColor: AppTheme.dangerColor,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Card(
            elevation: 4.0,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddPaymentConfigure(),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor: AppTheme.dangerColor,
                child: Icon(Icons.account_balance_wallet, color: Colors.white),
              ),
              title: Text("Paypal"),
            ),
          ),
          Card(
            elevation: 4.0,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddRazorPayConfigure(),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor: AppTheme.dangerColor,
                child: Icon(Icons.account_balance, color: Colors.white),
              ),
              title: Text("Rozarpay"),
            ),
          ),
        ],
      ),
    );
  }

}
