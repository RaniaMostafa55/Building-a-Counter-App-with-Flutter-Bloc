import 'package:flutter/material.dart';

@immutable
abstract class CounterState {}

class CounterCubitInitial extends CounterState {}

class CounterIncrement extends CounterState {}

class CounterDecrement extends CounterState {}

class CounterNegative extends CounterState {}

class CounterTen extends CounterState {}
