# Note Plus

A Flutter-based note-taking application with advanced features for organizing and managing your notes.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Documentation](#documentation)

## Features

- Create, edit, and delete notes
- Rich text formatting
- Cloud synchronization
- Dark/Light theme support
- Multi language support
- Cross-platform compatibility (iOS, Android, Web)

## AI Features (Not Implemented)
- Summarize
- Voice to text conversion
- Image to text conversion
- Image analizer

## Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.17.0)
- Android Studio / VS Code
- Git

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/note_plus.git
cd note_plus
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run build runner
```bash
dart run build_runner build --delete-conflicting-outputs
```

4. Set up environment variables:
```bash
cp .env.example .env
```
Edit `.env` with your configuration values.


5. Run the application:
```bash
flutter run
```

## Configuration

The app uses environment variables for configuration. Copy `.env.example` to `.env` and update the following:

- `BASE_URL`: your-backend-api-url (http://127.0.0.1:[PORT]) (PORT is usually 8000)

## Usage

### Basic Operations

- **Create Note**: Tap the '+' button to create a new note
- **Edit Note**: Tap on any existing note to edit
- **Delete Note**: Swipe left on a note and tap delete
- **Search**: Use the search bar to find specific notes

### Advanced Features

- **Categories**: Organize notes into categories
- **Tags**: Add tags for better organization
- **Sync**: Enable cloud sync in settings

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
├── services/                 # Business logic and API calls
├── screens/                  # UI screens
├── widgets/                  # Reusable widgets
├── utils/                    # Utility functions
└── themes/                   # App themes
```

