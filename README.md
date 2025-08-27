Perfect — thanks for clarifying 🙌
Since your Cooliego user app is built with Flutter and FlutterFlow, the README should highlight that. Here’s a tailored version:

Cooliego User App

The Cooliego User App is the user-side mobile application of the Cooliego platform, built with Flutter and FlutterFlow. It provides users with an intuitive and responsive interface to access all Cooliego services on the go.

✨ Features

🔐 Secure Authentication – User registration, login, and profile management

📍 Location-based Services – Discover nearby offers and services

🛒 Easy Ordering & Booking – Smooth and intuitive checkout flow

🔔 Real-time Notifications – Stay updated with alerts and status updates

🌙 Dark & Light Mode – Customize the theme to your liking

⚡ Cross-Platform – Works seamlessly on iOS and Android

🛠️ Tech Stack

Framework: Flutter

Low-Code Builder: FlutterFlow

State Management: Provider / Riverpod (or the one you’re using)

API Integration: REST APIs from Cooliego backend

Authentication: Firebase Auth / Supabase Auth / JWT (depending on your setup)

Database: Firebase Firestore / Supabase / Custom API

📦 Installation (Developer Setup)

Clone the repository:

git clone https://github.com/yourusername/cooliego-user-app.git
cd cooliego-user-app


Install dependencies:

flutter pub get


Run the app on your connected device or emulator:

flutter run

⚙️ Configuration

Add your environment variables inside .env or lib/config.dart (depending on your setup). Example:

const String apiUrl = "https://api.cooliego.com";
const String googleMapsApiKey = "your-google-maps-key";


If using Firebase, download google-services.json (Android) and GoogleService-Info.plist (iOS) from Firebase console and place them in the appropriate project folders.

📱 Deployment

To build release versions:

flutter build apk --release
flutter build ios --release


You can also export directly from FlutterFlow if using its build pipeline.

🤝 Contributing

We welcome contributions!

Fork the repo

Create a new branch (feature/your-feature-name)

Commit your changes

Push to your fork

Open a Pull Request

🐞 Issues

Found a bug or have a feature request?
Please open an issue here
.

📜 License

This project is licensed under the MIT License.
