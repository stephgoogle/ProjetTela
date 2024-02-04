import 'package:flutter/material.dart';
import 'package:mobile/ui/views/ebank/depot/depotViewModel.dart';
import 'package:stacked/stacked.dart';

class Depot extends StatefulWidget {
  const Depot({super.key});

  @override
  State<Depot> createState() => _DepotState();
}

class _DepotState extends State<Depot> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DepotViewModel>.reactive(
      viewModelBuilder: () => DepotViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: const Text(
              'Retrait',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.white),
            ),
            elevation: 5,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
          body: const SingleChildScrollView(
            child: Scrollbar(
              child: Column(
                children: [
                  /// SOLDE DISPO
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Solde disponible',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: Colors.white),
                        ),
                        Text(
                          'X0F 250.000',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: Colors.cyanAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
