import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../utilities/helpers/enum.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery ? delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          RadioListTile<Delivery>(
            value: Delivery.StandardDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Standard Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\n Order will be delivered from 3 to 5 business days',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),
          SizedBox(
            height: 20,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Next Day Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text:
                  '\n Place your order before 6pm and your items will be delivered the next day',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),
          SizedBox(
            height: 20,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NominatedDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Nominated Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text:
                  '\n Pick a particular date from the calendar and order will be delivered on selected date',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
