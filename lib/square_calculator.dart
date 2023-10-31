import 'dart:ffi';

final DynamicLibrary squareCalculator = DynamicLibrary.open('SquareCalculator.framework/SquareCalculator');

typedef NativeSquare = Double Function(Double number);
typedef DartSquare = double Function(double number);

final DartSquare square = squareCalculator.lookupFunction<NativeSquare, DartSquare>('square');
