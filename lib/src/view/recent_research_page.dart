import 'package:corelab_app_challenge/src/controller/product_controller.dart';
import 'package:corelab_app_challenge/src/shared/theme/app_colors.dart';
import 'package:corelab_app_challenge/src/shared/theme/app_typography.dart';
import 'package:flutter/material.dart';

class RecentRecearch extends StatefulWidget {
  final ProductController productController;
  final TextEditingController textEditingController;
  const RecentRecearch(
      {required this.textEditingController,
      required this.productController,
      super.key});

  @override
  State<RecentRecearch> createState() => _RecentRecearchState();
}

class _RecentRecearchState extends State<RecentRecearch> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20),
          child: Text(
            'Pesquisas recentes',
            style: AppTypography().textQuantityResult,
          ),
        ),
        if (widget.productController.historyResearch.isEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              'Ainda não há histórico de pesquisa',
              style: AppTypography().textProductCondition,
            ),
          ),
        ...widget.productController.historyResearch.map(
          (research) => GestureDetector(
            onTap: () {
              widget.textEditingController.text = research;
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15.0,
                    ),
                    child: Icon(
                      Icons.history,
                      color: AppColors().textGray,
                      size: 20.0,
                    ),
                  ),
                  Text(
                    research,
                    style: AppTypography().textListHistorySearch,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
