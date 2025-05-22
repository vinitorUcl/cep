# consultacep

## Overview
The `consultacep` application is a simple Flutter app that allows users to consult postal codes (CEP) using the ViaCEP API. Users can enter a CEP and retrieve address information associated with it.

## Features
- User-friendly interface for entering a CEP.
- Fetches address data from the ViaCEP API.
- Displays the results in a clear and concise manner.

## Project Structure
```
consultacep
├── lib
│   ├── main.dart                # Entry point of the application
│   ├── screens
│   │   └── home_screen.dart     # Main UI of the application
│   ├── services
│   │   └── cep_service.dart      # Handles API requests
│   └── widgets
│       └── cep_form.dart         # Form for entering the CEP
├── pubspec.yaml                 # Project configuration and dependencies
└── README.md                    # Project documentation
```

## Setup Instructions
1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd consultacep
   ```
3. Install the dependencies:
   ```
   flutter pub get
   ```
4. Run the application:
   ```
   flutter run
   ```

## Dependencies
- Flutter SDK
- http package for making API requests

## Usage
- Open the app and enter a valid CEP in the text field.
- Press the button to fetch the address data.
- The results will be displayed on the screen.