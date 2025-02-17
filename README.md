# Client Mobile

## Overview

Mobile client application built with Flutter for the PapDaew platform.

## Table of Contents

- [Client Mobile](#client-mobile)
  - [Overview](#overview)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
  - [Development](#development)
    - [Project Structure](#project-structure)
    - [Layer Responsibilities](#layer-responsibilities)
      - [Data Layer](#data-layer)
      - [Presentation Layer](#presentation-layer)
      - [Business Layer](#business-layer)
    - [Code Style](#code-style)
  - [Best Practices](#best-practices)
    - [Architecture Guidelines](#architecture-guidelines)
    - [BLoC Guidelines](#bloc-guidelines)
    - [Code Organization](#code-organization)
    - [Widget Guidelines](#widget-guidelines)
    - [Performance Guidelines](#performance-guidelines)
    - [Testing](#testing)
    - [Error Handling](#error-handling)
  - [Building for Production](#building-for-production)
    - [Android](#android)
    - [iOS](#ios)
  - [Useful Resources](#useful-resources)

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version 3.29.0)
- Android Studio / XCode
- Android SDK / iOS Development Tools
- A compatible IDE (VS Code or Android Studio recommended)

### Setup

1. Clone the repository
2. Install dependencies:

```bash
flutter pub get
```

3. Run the application:

```bash
flutter run
```

## Development

### Project Structure

```
lib/
├── data/ # Data layer
│ ├── models/ # Data models and DTOs
│ ├── repositories/ # Repository implementations
│ └── services/ # API services, local storage services
├── presentation/ # Presentation layer
│ ├── screens/ # UI screens/pages
│ └── widgets/ # Reusable UI components
├── business/ # Business layer
│ ├── bloc/ # BLoCs for state management
└── main.dart # Application entry point
```

### Layer Responsibilities

#### Data Layer

- Handles data operations and external communications
- Contains data models, repositories, and services
- Manages API calls and local storage

#### Presentation Layer

- Contains all UI-related code
- Manages screens and reusable widgets
- Handles user interactions and display logic

#### Business Layer

- Contains business logic using BLoC pattern
- Manages application state
- Coordinates between data and presentation layers

### Code Style

This project follows the official [Flutter style guide](https://docs.flutter.dev/development/tools/formatting) and uses the default Flutter linter rules.

To format your code:

```bash
flutter format .
```

## Best Practices

### Architecture Guidelines

- Follow layer boundaries strictly - no direct data layer access from presentation
- Keep business logic in BLoCs, not in widgets
- Use repositories to abstract all data operations
- Keep presentation layer focused only on UI concerns

### BLoC Guidelines

- Create one BLoC per feature/screen
- Keep states immutable
- Define clear events and states
- Handle errors within BLoCs
- Dispose BLoCs properly
- Use BlocProvider at the appropriate widget level

### Code Organization

- Group related features in their respective layers
- Keep files focused and single-responsibility
- Use barrel files (index.dart) for clean imports
- Follow consistent naming conventions:
  - BLoCs: `feature_bloc.dart`
  - Events: `feature_event.dart`
  - States: `feature_state.dart`
  - Models: `feature_model.dart`
  - Repositories: `feature_repository.dart`

### Widget Guidelines

- Break down large widgets into smaller, reusable components
- Use const constructors when possible
- Keep build methods clean and readable
- Extract repeated styles into theme
- Implement proper error handling and loading states

### Performance Guidelines

- Avoid unnecessary widget rebuilds
- Use ListView.builder for long lists
- Implement pagination for large data sets
- Cache network images
- Minimize use of heavy computations in build methods

### Testing

- Write unit tests for BLoCs
- Write unit tests for repositories
- Write widget tests for complex UI components
- Use mocks for external dependencies
- Maintain high test coverage for business logic

### Error Handling

- Handle all possible error states
- Show user-friendly error messages
- Implement proper error logging
- Handle network connectivity issues
- Implement retry mechanisms where appropriate

## Building for Production

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

## Useful Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Dart Documentation](https://dart.dev/guides)
- [Material Design](https://m3.material.io/)
