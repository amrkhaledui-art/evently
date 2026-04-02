import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/stringsManager.dart';

class Languageswitch extends StatelessWidget {

  String language;
  Languageswitch(this.language);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Container(
           padding: EdgeInsets.symmetric(
             horizontal: 16,
             vertical: 5,
           ),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(8),
             color: language=="en"
             ?Theme.of(context).colorScheme.primary
             :Theme.of(context).colorScheme.onSecondaryContainer,
             border: Border.all(
               color: Theme.of(context).colorScheme.primary
             )
           ),
           child: Text(
             StringsManager.english,
             style:  language =="en"
                 ?Theme.of(context).textTheme.labelMedium
              :Theme.of(context).textTheme.titleSmall?.copyWith(
               fontSize: 14,
               fontWeight: FontWeight.w400
             ),

           ),
         ),
        SizedBox(width:8,),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 5,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: language=="ar"
    ?Theme.of(context).colorScheme.primary
                 :Theme.of(context).colorScheme.onSecondaryContainer,
              border: Border.all(
                  color: Theme.of(context).colorScheme.primary
              )
          ),
          child: Text(
            StringsManager.arabic,
            style:  language =="ar"
            ?Theme.of(context).textTheme.labelMedium
            :Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),

          ),
        ),
      ],
    );
  }
}
