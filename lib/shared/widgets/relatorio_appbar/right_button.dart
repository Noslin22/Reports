import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../../models/pdf_model.dart';
import '../../variables.dart';

class RightButton extends StatelessWidget {
  const RightButton({
    Key? key,
    required this.changeState,
    this.model,
  }) : super(key: key);

  final PdfModel? model;
  final VoidCallback changeState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: SizedBox(
        height: 50,
        child: !Navigator.of(context).canPop()
            ? IconButton(
                onPressed: () {
                  updateFile(context);
                },
                iconSize: 32,
                icon: const Icon(
                  Icons.replay_outlined,
                  color: Colors.white,
                ))
            : Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: changeState,
                      child: Text(
                        currentMode,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    model != null ? const SizedBox(width: 10) : Container(),
                    model != null
                        ? IconButton(
                            iconSize: 32,
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (context) => const Center(
                                    child: CircularProgressIndicator()),
                              );
                              Printing.sharePdf(
                                bytes: await model!.generate(),
                                filename: model!.filename,
                              ).then((_) => Navigator.pop(context));
                            },
                            icon: const Icon(
                              Icons.print,
                              color: Colors.white,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
      ),
    );
  }
}
