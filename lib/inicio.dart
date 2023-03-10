import 'package:calculadora_costos/proceso.dart';
import 'package:flutter/material.dart';
import 'componetes.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final TextEditingController _displayCajac = TextEditingController();
  final TextEditingController _cajasContendorc = TextEditingController();
  final TextEditingController _precioCajac = TextEditingController();
  final TextEditingController _costoFletec = TextEditingController();
  final TextEditingController _otrosc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          height: size.width < 400 ? size.height - 150 : size.width - 150,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NumInt(controller: _displayCajac, msj: "Display por caja"),
              NumInt(controller: _cajasContendorc, msj: "Cajas por contendor"),
              NumDouble(controller: _precioCajac, msj: "Precio Caja"),
              NumDouble(controller: _costoFletec, msj: "Costo Flete"),
              NumDouble(controller: _otrosc, msj: "Otros gastos"),
              ElevatedButton(
                onPressed: () {
                  try {
                    Proceso.calculo(_displayCajac, _cajasContendorc,
                        _precioCajac, _costoFletec, _otrosc, context);
                  } catch (exception) {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 28, 49, 94),
                ),
                child: const Text(
                  "Procesar",
                  style: TextStyle(fontSize: 18),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}





// import 'dart:ffi';
// import 'package:intl/intl.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class inicio extends StatefulWidget {
//   const inicio({super.key});

//   @override
//   State<inicio> createState() => _inicioState();
// }

// class _inicioState extends State<inicio> {
//   late int _displayCaja;
//   late int _cajasContendor;
//   late double _precioCaja;
//   late double _costoFlete;
//   late double _otros;
//   final TextEditingController _displayCajac = TextEditingController();
//   final TextEditingController _cajasContendorc = TextEditingController();
//   final TextEditingController _precioCajac = TextEditingController();
//   final TextEditingController _costoFletec = TextEditingController();
//   final TextEditingController _otrosc = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Container(
//           height: 500,
//           width: 300,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               TextField(
//                 decoration:
//                     const InputDecoration(labelText: 'Display por caja'),
//                 controller: _displayCajac,
//                 keyboardType: TextInputType.number,
//      
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'^\d*$'))
//                 ],
//               ),
//               TextField(
//                 controller: _cajasContendorc,
//                 decoration:
//                     const InputDecoration(labelText: 'Cajas por contenedor'),
//                 keyboardType: TextInputType.number,
//                 onChanged: (String value) {
//                   try {
//                     _cajasContendor = int.parse(value);
//                   } catch (Exception) {
//                     _cajasContendor = 0;
//                   }
//                 },
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'^\d*$'))
//                 ],
//               ),
//               TextField(
//                 controller: _precioCajac,
//                 decoration: const InputDecoration(labelText: 'Precio por caja'),
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//                 onChanged: (String value) {
//        
//                 },
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
//                 ],
//               ),
//               TextField(
//                 controller: _costoFletec,
//                 decoration: const InputDecoration(labelText: 'Costo Flete'),
//                 onChanged: (String value) {
//                   try {
//                     _costoFlete = double.parse(value);
//                   } catch (Exception) {
//                     _costoFlete = 0;
//                   }
//                 },
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
//                 ],
//               ),
//               TextField(
//                 controller: _otrosc,
//                 decoration: const InputDecoration(labelText: 'Otros gastos'),
//                 onChanged: (String value) {
//                   try {
//                     _otros = double.parse(value);
//                   } catch (Exception) {
//                     _otros = 0;
//                   }
//                 },
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
//                 ],
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Theme.of(context).colorScheme.onPrimary,
//                   backgroundColor: Color.fromARGB(255, 28, 49, 94),
//                 ),
//                 onPressed: () {
//                   try {
//                     if (_displayCajac.text.isEmpty ||
//                         _cajasContendorc.text.isEmpty ||
//                         _precioCajac.text.isEmpty ||
//                         _costoFletec.text.isEmpty ||
//                         _otrosc.text.isEmpty
//                          ) {
//                            ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text("Ingrese todos los valores "),
//                         ),
//                       );
//                         }
//                    else if (_displayCaja > 0 &&
//                         _cajasContendor > 0 &&
//                         _precioCaja > 0 &&
//                         _costoFlete > 0) {
//                       double _costoContenedor =
//                           (_cajasContendor * _precioCaja) + _costoFlete;
//                       double _masDai = _costoContenedor * 1.15;
//                       double _masIva = _masDai * 1.13;
//                       double _costoImport = _masIva + _otros;
//                       double _costoCaja = _costoImport / _cajasContendor;
//                       double _costoDisplay = _costoCaja / _displayCaja;


//                       String msj = """Costo del contenedor: ${NumberFormat.currency(decimalDigits:2,symbol:"").format(_costoContenedor)} 
// Mas DAI: ${NumberFormat.currency(decimalDigits:2,symbol:"").format(_masDai)} \n Mas IVA: ${NumberFormat.currency(decimalDigits:2,symbol:"").format(_masIva)} \n Costo Importaci??n: ${NumberFormat.currency(decimalDigits:2,symbol:"").format(_costoImport)} \n Costo Caja: ${NumberFormat.currency(decimalDigits:2,symbol:"").format(_costoCaja)} \n Costo Display: ${NumberFormat.currency(decimalDigits:2,symbol:"").format(_costoDisplay)}""";

//                       var alertStyle = AlertStyle(
//                          animationType: AnimationType.fromLeft,
//                         descTextAlign: TextAlign.start,
//                         animationDuration: Duration(milliseconds: 400),
//                         alertBorder: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           side: BorderSide(
//                             color: Colors.grey,
//                           ),
//                         ),
//                         titleStyle: TextStyle(
//                           color: Color.fromARGB(255, 2, 55, 99),
//                         ),
//                         alertAlignment: Alignment.center,
//                       );

//                       Alert(
//                         context: context,
//                         //type: AlertType.success
//                         title: "Resultados",
//                         style: alertStyle,
//                         desc: msj,
//                         buttons: [
//                           DialogButton(
//                             child: Text(
//                               "Aceptar",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 20),
//                             ),
//                             onPressed: () => Navigator.pop(context),
//                             width: 120,
//                           )
//                         ],
//                       ).show();
//                       _displayCajac.text = "";
//                       _cajasContendorc.text = "";
//                       _precioCajac.text = "";
//                       _costoFletec.text = "";
//                       _otrosc.text = "";
//                       _displayCaja=0;
//                       _cajasContendor=0;
//                       _precioCaja=0;
//                       _costoFlete=0;
//                       _otros=0;
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text("Ingrese valores mayor a cero '0' "),
//                         ),
//                       );
//                     }
//                   } catch (Exception) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text("Ingrese todos los datos"),
//                       ),
//                     );
//                   }
//                 },
//                 child: Text('Procesar'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
