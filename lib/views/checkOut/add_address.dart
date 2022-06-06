import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/CheckOutController.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
      init: Get.find(),
      builder: (controller)=> Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  CustomText(
                    text: 'Billing address is the same as delivery address',
                    fontSize: 20,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 20,),
                  CustomTextFormField(
                    onSave: (value){
                      controller.street1=value!;
                    },
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'You must write Street1 Name';
                      }
                      return null;
                    },
                    text: 'Street 1',
                    hint: '21, Alex Davidson Avenue',
                  ),
                  SizedBox(height: 20,),
                  CustomTextFormField(
                    onSave: (value){
                      controller.street2=value!;
                    },
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'You must write Street2 Name';
                      }
                    },
                    text: 'Street 2',
                    hint: 'Opposite Aswaq al Haramin',
                  ),
                  SizedBox(height: 20,),
                  CustomTextFormField(
                    onSave: (value){
                      controller.city=value!;
                    },
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'You must write City Name';
                      }
                    },
                    text: 'City',
                    hint: 'Victoria Island',
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CustomTextFormField(
                              onSave: (value){
                                controller.state=value!;
                              },
                              validator: (String? value){
                                if(value!.isEmpty){
                                  return 'You must write State Name';
                                }
                              },
                              text: 'State',
                              hint: 'Lagos State',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: CustomTextFormField(
                              onSave: (value){
                                controller.country=value!;
                              },
                              validator: (String? value){
                                if(value!.isEmpty){
                                  return 'You must write Country Name';
                                }
                              },
                              text: 'Country',
                              hint: 'Nigeria',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
