import 'package:flutter/material.dart';

// For the full page list in HomeScreen
final ValueNotifier<int> selectedPageNotifier = ValueNotifier<int>(0);
// For the NavbarWidget (only main tabs)
final ValueNotifier<int> navbarIndexNotifier = ValueNotifier<int>(0);