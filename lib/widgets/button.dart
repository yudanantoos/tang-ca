import 'package:flutter/material.dart';
import 'package:starter/configs/styles.dart';

class PrimaryButton extends StatelessWidget {
  final bool disabled;
  final String text;
  final Function onTap;
  final bool bottomFloat;

  const PrimaryButton({
    Key key,
    @required this.text,
    @required this.onTap,
    this.bottomFloat = true,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -5),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: RaisedButton(
        // disabledColor: Colors.grey,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: BeveledRectangleBorder(),
        padding: EdgeInsets.all(16),
        // color: Colors.indigo,
        child: Text(
          text,
          style: GlobalStyles.title.apply(color: Colors.white),
        ),
        onPressed: onTap,
      ),
    );
  }
}
