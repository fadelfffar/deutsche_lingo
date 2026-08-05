# 🇩🇪 Deutsche Lingo

A Flutter quiz app for practicing everyday language skills, aimed at international students navigating university life, bureaucracy, work, and housing abroad.

> **Note:** The current question set and text-to-speech target **Italian** (`it-IT`) — covering real-life scenarios like the *permesso di soggiorno*, *codice fiscale*, and job interviews. German content is planned (hence the name!).

## ✨ Features

- 📝 **20 scenario-based multiple-choice questions** across 5 categories:
  University & Enrollment · Bureaucracy & Visa · Job Search & Work · Housing & Daily Life · Social & Networking
- 🌐 **Toggleable English translations** for questions, answers, and explanations
- 🔊 **Text-to-speech pronunciation** of the correct phrase after each answer (via `flutter_tts`)
- 🗣️ **Phonetic pronunciation guides** (e.g. *per-MES-so di sog-GIOR-no*)
- ✅ **Instant feedback** with explanations, then auto-advance after 4 seconds
- 📊 **Progress bar and score tracking** with a results screen at the end

## 🏗️ Project Structure

```
lib/
  main.dart                    App entry point (LingoApp → ExamScreen)
  exam_screen.dart             Quiz UI: question card, answer options, feedback
  second_question_screen.dart  Alternate question screen
  result_screen.dart           Final score summary
  question_repository.dart     Question model + singleton question data source
  audio_service.dart           Text-to-speech wrapper (flutter_tts)
```

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart SDK ^3.9.2)
- A device/emulator (Android, iOS, web, Windows, macOS, or Linux)

### Run

```bash
git clone https://github.com/fadelfffar/deutsche_lingo.git
cd deutsche_lingo
flutter pub get
flutter run
```

### Test

```bash
flutter test
```

## 📦 Key Dependencies

| Package | Purpose |
|---|---|
| `flutter_tts` | Text-to-speech playback of phrases |
| `supabase_flutter` | Backend (planned — not yet wired up) |
| `flutter_bloc` + `equatable` | State management (planned) |
| `rive` | Animations (planned) |
| `webview_flutter` | Embedded web content (planned) |

## 🗺️ Roadmap

- [ ] Add German question sets to match the app name
- [ ] Move questions from hard-coded repository to Supabase
- [ ] Adopt BLoC for state management
- [ ] User accounts and score history
- [ ] Rive animations for feedback

## 📄 License

No license specified yet — consider adding one (e.g., MIT).
