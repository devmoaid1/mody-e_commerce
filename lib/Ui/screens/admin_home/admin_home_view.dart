import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/admin_home/admin_viewModel.dart';

import 'package:stacked/stacked.dart';

class AdminHomePage extends StatelessWidget {
  AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminHomeViewModel>.nonReactive(
      viewModelBuilder: () => AdminHomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color(0xFF222725),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(),
          centerTitle: true,
          title: Text(
            "Admin Home",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w800, fontSize: 22, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 40, left: 10),
                  child: Text("Welcome Admin !",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.white)),
                ),
                GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(5),
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    AddProduct(),
                    EditProduct(),
                    ViewOrders(),
                    Logout(),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

class Logout extends ViewModelWidget<AdminHomeViewModel> {
  const Logout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AdminHomeViewModel viewModel) {
    return InkWell(
      onTap: () {
        viewModel.logout();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.logout,
              color: Colors.white,
              size: 50,
            ),
            Flexible(
              flex: 1,
              child: Text("Logout",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800)),
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.pink, Colors.orange]),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3), //color of shadow
                  spreadRadius: 3, //spread radius
                  blurRadius: 1, // blur radius
                  offset: const Offset(0, 1))
            ],
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class ViewOrders extends ViewModelWidget<AdminHomeViewModel> {
  const ViewOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AdminHomeViewModel viewModel) {
    return InkWell(
      onTap: () {
        viewModel.navigateToViewOrders();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: const Icon(
                Icons.note_sharp,
                color: Colors.white,
                size: 50,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Text("View",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ),
                Flexible(
                  flex: 2,
                  child: Text("Orders",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue]),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3), //color of shadow
                  spreadRadius: 3, //spread radius
                  blurRadius: 1, // blur radius
                  offset: const Offset(0, 1))
            ],
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class EditProduct extends ViewModelWidget<AdminHomeViewModel> {
  const EditProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AdminHomeViewModel viewModel) {
    return InkWell(
      onTap: () {
        viewModel.navigateToEditProducts();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.edit,
              color: Colors.white,
              size: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Text("Edit",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ),
                Flexible(
                  flex: 2,
                  child: Text("Product",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue]),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3), //color of shadow
                  spreadRadius: 3, //spread radius
                  blurRadius: 1, // blur radius
                  offset: const Offset(0, 1))
            ],
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class AddProduct extends ViewModelWidget<AdminHomeViewModel> {
  const AddProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AdminHomeViewModel viewModel) {
    return InkWell(
      onTap: () {
        viewModel.navigateToAddProducts();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_outlined,
              color: Colors.white,
              size: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Text("Add",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ),
                Flexible(
                  flex: 2,
                  child: Text("Product",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.deepPurpleAccent, Colors.lime]),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3), //color of shadow
                  spreadRadius: 3, //spread radius
                  blurRadius: 1, // blur radius
                  offset: const Offset(0, 1))
            ],
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
