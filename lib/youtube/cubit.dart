import 'package:flutter_bloc/flutter_bloc.dart';

import 'main.dart';

double initialHeight = 54;
double unit = 1;

class BSData {
  final double bsHeight;
  final double opacity;
  final double size;
  const BSData(this.bsHeight, this.opacity, this.size);
}

class BSDataV2 {
  final double bsHeight;
  final double opacity;
  final double size;
  const BSDataV2(this.bsHeight, this.opacity, this.size);
}

class BottomSheetCubit extends Cubit<BSData> {
  BottomSheetCubit() : super(BSData(initialHeight, 1, 0.145));

  double increv2(double newValL, double previousS) {
    final newVal = double.parse(newValL.toStringAsPrecision(4));
    final previous = double.parse(previousS.toStringAsPrecision(4));
    // final perItemMinus = initialHeight / step;
    final diff = double.parse((newVal - previous).toStringAsPrecision(4));

    double oo = state.opacity - (diff * 1);
    if (diff > (unit / step)) {
      double calc = state.bsHeight - (diff * initialHeight / unit);
      // double calc = state.bsHeight - (diff / (unit / step)) * perItemMinus;
      if (newVal == unit) {
        calc = 0;
      }
      if (oo < 0) {
        oo = 0;
      }
      emit(BSData(calc, oo, newValL));
      // print('[newValL] $newValL |');
      // print('[increv2] $state | Step ${(diff * step)}');
      return newValL;
    } else {
      return previousS;
    }
  }

  double decrev2(double newValL, double previousS) {
    final newVal = double.parse(newValL.toStringAsPrecision(4));
    final previous = double.parse(previousS.toStringAsPrecision(4));
    final perItemMinus = initialHeight / step;
    final diff = double.parse((previous - newVal).toStringAsPrecision(4));
    // print(
    //     '[newVal] $newVal [previous] $previous | $diff | Step ${(diff * step)} | Minus ${(diff / (1 / step)) * perItemMinus}');
    double oo = state.opacity + (diff * 1);
    if (diff > (unit / step)) {
      double calc = state.bsHeight + (diff / (unit / step)) * perItemMinus;
      if (newVal == unit) {
        calc = initialHeight;
      }
      if (oo > 1) {
        oo = 1;
      }
      // if (oo > 0.85) {
      //   oo = 1;
      // }
      emit(BSData(calc, oo, newValL));
      // print('[down] $calc');
      // print('[increv2] $state | Step ${(diff * step)}');
      return newValL;
    } else {
      return previousS;
    }
  }
}

class BottomSheetCubitV2 extends Cubit<BSDataV2> {
  BottomSheetCubitV2() : super(BSDataV2(initialHeight, 1, 0.1));

  double increv2(double newValL, double previousS) {
    final newVal = double.parse(newValL.toStringAsPrecision(4));
    final previous = double.parse(previousS.toStringAsPrecision(4));
    // final perItemMinus = initialHeight / step;
    final diff = double.parse((newVal - previous).toStringAsPrecision(4));

    double oo = state.opacity - (diff * 1);
    if (diff > (unit / step)) {
      double calc = state.bsHeight - (diff * initialHeight / unit);
      // double calc = state.bsHeight - (diff / (unit / step)) * perItemMinus;
      if (newVal == unit) {
        calc = 0;
      }
      if (oo < 0) {
        oo = 0;
      }
      emit(BSDataV2(calc, oo, newValL));
      // print('[newValL] $newValL |');
      // print('[increv2] $state | Step ${(diff * step)}');
      return newValL;
    } else {
      return previousS;
    }
  }

  double decrev2(double newValL, double previousS) {
    final newVal = double.parse(newValL.toStringAsPrecision(4));
    final previous = double.parse(previousS.toStringAsPrecision(4));
    final perItemMinus = initialHeight / step;
    final diff = double.parse((previous - newVal).toStringAsPrecision(4));
    // print(
    //     '[newVal] $newVal [previous] $previous | $diff | Step ${(diff * step)} | Minus ${(diff / (1 / step)) * perItemMinus}');
    double oo = state.opacity + (diff * 1);
    if (diff > (unit / step)) {
      double calc = state.bsHeight + (diff / (unit / step)) * perItemMinus;
      if (newVal == unit) {
        calc = initialHeight;
      }
      if (oo > 1) {
        oo = 1;
      }
      // if (oo > 0.85) {
      //   oo = 1;
      // }
      emit(BSDataV2(calc, oo, newValL));
      // print('[down] $calc');
      // print('[increv2] $state | Step ${(diff * step)}');
      return newValL;
    } else {
      return previousS;
    }
  }
}
