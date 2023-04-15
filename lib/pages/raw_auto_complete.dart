import 'package:flutter/material.dart';

class RawAutoComplete extends StatelessWidget {
  const RawAutoComplete(
      {super.key,
    Iterable<String> Function(TextEditingValue textEditingValue)?
          optionsBuilder,  Type? OptionsViewBuilder, required Padding Function(BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) fielViewBuilder, required Align Function(BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) optionsViewBuilder});

  static const List<String> thelist = <String>[
    "Sevilla",
    "Mallorca",
    "Madrid",
  ];

  @override
  Widget build(BuildContext context) {
    return RawAutoComplete(optionsBuilder: (TextEditingValue textEditingValue) {
      return thelist.where((String item) {
        return item.contains(textEditingValue.text.toLowerCase());
      });
    },
fielViewBuilder:(
  BuildContext context,
  TextEditingController textEditingController,
  FocusNode focusNode,
  VoidCallback onFieldSubmitted,

){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      onFieldSubmitted: (String value){
        onFieldSubmitted();
      }

     ),
    
    );
},
optionsViewBuilder:(
  BuildContext context,
  AutocompleteOnSelected<String> onSelected,
  Iterable<String> options,
) {
  return  Align(
    alignment:  Alignment.center,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4.0,
        child:SizedBox(
          height: 200.0,
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount:options.length,
            itemBuilder: (BuildContext context, int index){
              final String option= options.elementAt(index);
              return GestureDetector(
                onTap: (){
                  onSelected(option);
                   },
                   child: ListTile(
                    title: Text(option),
                    ),
                );
            },
              
              ),
         
            ),
        )
      ),
      
      );
}

);
  }
}

