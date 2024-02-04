
import 'package:flutter/material.dart';
import 'package:mobile/ui/views/tv/vainqueur/vainqueur_view_model.dart';
import 'package:stacked/stacked.dart';

class VainqueurView extends StatefulWidget{
  const VainqueurView({super.key});

  @override
  State<VainqueurView>createState() => _VainqueurView();
}

class _VainqueurView extends State<VainqueurView> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context){
    return ViewModelBuilder<VainqueurViewModel>.reactive(
        viewModelBuilder: () => VainqueurViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Gagnant du jour',
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            elevation: 5,
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: (model.winners.isNotEmpty) ?
            ListView.builder(
                itemCount: model.winners.length,
                itemBuilder: (context, index){
                  print('Le nombre de gagnant : ${model.winners.length}');
                  return Container(
                    color: Colors.grey[100],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: ListTile(
                          title: Center(
                            child: Text('${model.winners[index]['name']}'),
                          ),
                        ))
                      ],
                    ),
                  );
                }
            )
            : const Text("Résultat indisponible"),
          ),
        )
    );
  }
}