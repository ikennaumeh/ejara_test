# Ejara

![Coverage](coverage_badge.svg)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)


This is the Ejara senior mobile developer take-home assessment.

## Running the App
To run the app, you should fetch all dependencies and run the app  
```
flutter pub get
flutter run
```

## App Architecture and Folder Structure

The code of the app implements the MVVM architectural pattern.

```
lib
├── models
│   ├── login_response.dart
│   └── payment_type.dart
│   
├── navigation
│   ├── app_routes.dart
│   ├── navigator_key.dart   
│   └── router.dart
│
├── services
│   ├── exceptions
│   │   └── token_expiry_exception.dart
│   ├── interceptors
│   │   └── app_interceptors.dart
│   ├── utilities
│   │   └── utility.dart
│   ├── network_service.dart
│   ├── service_api.dart
│   ├── secure_storage_service.dart
│   └── service_locator.dart
│
├── ui
│   ├── base│      
│   ├── views
│   ├── bottomsheet
│   ├── widgets
│   └── app.dart
│
└── main.dart
```

### Overview

* `lib/models`: Contains the data models used in the project, such as login_response.dart and payment_type.dart.
* `lib/navigation`: Handles navigation-related functionalities.
* `app_routes.dart`: Defines the routes used within the app.
* `navigator_key.dart`: Contains navigation keys.
* `router.dart`: Manages the navigation flow and routing logic.
* `lib/services`: Houses different services used within the application.
* `exceptions`: Contains the token_expiry_exception.dart file, handling token expiration scenarios.
* `interceptors`: Includes app-specific interceptors (app_interceptors.dart) for functionalities like authentication and logging.
* `utilities`: Holds general utility functions or services. Currently includes utility.dart.
* `network_service.dart`: Service responsible for network-related operations.
* `service_api.dart`: Service for API-related functionalities.
* `secure_storage_service.dart`: Service for secure storage operations.
* `service_locator.dart`: Service locator for dependency injection or service management.
* `lib/ui`: Handles the user interface components.
* `base`: Contains the base UI elements or the root of the app (app.dart).
* `views`: Holds specific views or screens of the application.
* `bottomsheet`: Contains components related to bottom sheets if used.
* `widgets`: Holds reusable UI widgets used across the app.
* `app.dart`: Entry point or main UI component of the application.
* `main.dart`: Entry point of the application.

## Testing

The `test` folder mirrors the `lib` folder in addition to some test utilities. And more tests will be added.

[`mocktail`](https://pub.dev/packages/mocktail) is used to mock dependencies.

### Testing with Mocktail

Mocktail is an easy-to-use mocking package for mocking services during testing.

#### 1. Unit Testing

Covered all functions necessary for this app. One would have to get mock and used mocked dependencies of services before carrying out tests.

```dart
      late ChoosePaymentMethodVM viewModel;
      late MockServiceApi mockServiceApi;
     group('ChoosePaymentMethodVM Tests -', () {
        setUp(() {
        getAndRegisterAppLevelRouter();
        mockServiceApi = MockServiceApi();
        viewModel = ChoosePaymentMethodVM(mockServiceApi);
        });
        tearDown(() => serviceLocator.reset());
     });

```
and then test like: 

```dart
    test("test that init fails when login fails", () async {
        when(() => mockServiceApi.login()).thenAnswer((_) async => false);

        await viewModel.init();
        expect(viewModel.paymentTypeList, isEmpty);
        expect(viewModel.isBusy, isFalse);
      });

```

#### 2. Widget/UI Test

Mock your service api as it's needed and carry out your ui tests

```dart
    late MockServiceApi mockServiceApi;
    setUp(() {
        getAndRegisterAppLevelRouter();
        mockServiceApi = getAndRegisterServiceApi();
    });

```
and then test like: 

```dart
    testWidgets("loading indicator is displayed while waiting for articles", (widgetTester) async {
    arrangeSuccessResponseFromServiceApiAfter2Seconds();

    await widgetTester.pumpWidget(const EjaraApp());
    await widgetTester.pump(const Duration(milliseconds: 500));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await widgetTester.pumpAndSettle();
  });

```

#### 3. Integration Test
Located in the project folder and similar to widget test

```dart
    late MockServiceApi mockServiceApi;
    setUp(() {
        getAndRegisterAppLevelRouter();
        mockServiceApi = getAndRegisterServiceApi();
    });

```
and then test like: 

```dart
    testWidgets("tapping on the first payment type brings open the bottom sheet", (widgetTester) async {
    arrangeSuccessResponseFromServiceApi();

    await widgetTester.pumpWidget(const EjaraApp());
    await widgetTester.pump();

    await widgetTester.tap(find.text("French"));

    await widgetTester.pumpAndSettle();

    expect(find.text("Choose a payment \nmethod"), findsNothing);
    expect(find.text("Select the mobile money method"), findsOneWidget);

    await widgetTester.tap(find.byKey(const Key("text-button")));

    await widgetTester.pumpAndSettle();

    expect(find.text("Select the mobile money method"), findsNothing);
    expect(find.text("New mobile money"), findsOneWidget);
    expect(find.byType(CustomDropDown), findsOneWidget);
  });

```
## Screenshots
![1](https://github.com/ikennaumeh/ejara_test/blob/main/screenshot1.jpg?raw=true)
![2](https://github.com/ikennaumeh/ejara_test/blob/main/screenshot2.jpg?raw=true)
![3](https://github.com/ikennaumeh/ejara_test/blob/main/screenshot3.jpg?raw=true)
![4](https://github.com/ikennaumeh/ejara_test/blob/main/screenshot4.jpg?raw=true)


## Third party packages

- [Provider](https://pub.dev/packages/provider): As state management
- [Flutter_Secure_Storage](https://pub.dev/packages/flutter_secure_storage)
- [Mocktail](https://pub.dev/packages/mocktail): Used to create mocks.
- [Dio](https://pub.dev/packages/dio): For network calls