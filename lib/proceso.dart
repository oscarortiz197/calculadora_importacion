import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Proceso {
  static calculo(displayCajac, cajasContendorc, precioCajac, costoFletec,
      otrosc, context) {
    String resultados;
    bool estado=true;
    try {
      final int displayCaja = int.parse(displayCajac.text);
      final int cajasContendor = int.parse(cajasContendorc.text);
      final double precioCaja = double.parse(precioCajac.text);
      final double costoFlete = double.parse(costoFletec.text);
      final double otros = double.parse(otrosc.text);

      if (displayCaja > 0 &&
          cajasContendor > 0 &&
          precioCaja > 0 &&
          costoFlete > 0) {
        double costoContenedor = (cajasContendor * precioCaja) + costoFlete;
        resultados =
            "Costo Contenedor ${NumberFormat.currency(decimalDigits: 2, symbol: "").format(costoContenedor)}\n";
        resultados +=
            "Mas DAI ${NumberFormat.currency(decimalDigits: 2, symbol: "").format(costoContenedor * 1.15)}\n";
        resultados +=
            "Mas IVA ${NumberFormat.currency(decimalDigits: 2, symbol: "").format(costoContenedor * 1.15 * 1.13)}\n";
        resultados +=
            "Costo Importacion ${NumberFormat.currency(decimalDigits: 2, symbol: "").format(costoContenedor * 1.15 * 1.13 + otros)}\n";
        resultados +=
            "Costo Caja ${NumberFormat.currency(decimalDigits: 2, symbol: "").format((costoContenedor * 1.15 * 1.13 + otros) / cajasContendor)}\n";
        resultados +=
            "Costo Display ${NumberFormat.currency(decimalDigits: 2, symbol: "").format((costoContenedor * 1.15 * 1.13 + otros) / cajasContendor / displayCaja)}";
      } else {
        resultados = "Ingrese valores mayor a cero '0'";
        estado=false;
      }
    } catch (exception) {
      resultados = "Error al ingresar los numeros ";
      estado=false;
    }

    Alert(
      context: context,
      //type: AlertType.success
      title: "Resultados",
      style: const AlertStyle(
        descTextAlign: TextAlign.start,
      ),
      desc: resultados,
      buttons: [
        estado?
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            displayCajac.text = "";
            cajasContendorc.text = "";
            precioCajac.text = "";
            costoFletec.text = "";
            otrosc.text = "";
          },
          child: const Text(
            "Limpiar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ):
        DialogButton(
          width: 200,
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Aceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
