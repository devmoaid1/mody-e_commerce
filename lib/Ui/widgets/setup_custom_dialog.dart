import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';

import 'package:mody_ecommerce/app/app.locator.dart';

import 'package:stacked_services/stacked_services.dart';

enum DialogType { basic, admin }
void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.basic: (context, sheetRequest, completer) =>
        _BasicDialog(request: sheetRequest, completer: completer),
    DialogType.admin: (context, sheetRequest, completer) =>
        _AdminDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            request.title.toString(),
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          request.description != null
              ? Text(
                  request.description.toString(),
                  style: GoogleFonts.poppins(fontSize: 16),
                  textAlign: TextAlign.center,
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => completer(DialogResponse(confirmed: true)),
            child: Container(
              child: request.showIconInMainButton == true
                  ? const Icon(Icons.check_circle)
                  : Text(request.mainButtonTitle.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class _AdminDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _AdminDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: adminBackgroundColor,
            borderRadius: BorderRadius.circular(1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                request.title.toString(),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              request.description != null
                  ? Text(
                      request.description.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  : Container(),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => completer(DialogResponse(confirmed: true)),
                child: Container(
                  child: request.showIconInMainButton == true
                      ? Icon(Icons.check_circle)
                      : Text(request.mainButtonTitle.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: pinkRed,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
