# DMP Portfolio App — Full Project Summary

> Generated: 2026-10-28 | Flutter SDK `^3.10.3` | Version `0.0.1+1`

---

## 1. Project Overview

**What it does:**  
This is a **personal portfolio mobile/web app** for a Flutter developer (DMP). It presents the developer's profile, technical & professional skills, work experience, projects, and education — all fetched live from Firebase Firestore.

**Main Features:**
- 🏠 **Home** — Profile banner, quick-access skill cards, animated line chart, featured projects
- 🛠️ **Skills** — Technical skills grid, professional skills, achievements & metrics, learning roadmap, progress timeline
- 🚀 **Projects** — Tabbed list of Organisation and Personal projects with details, GitHub & live links
- 🎓 **Education** — Qualifications and certifications list
- 👤 **Profile/About** — Developer bio, social links (GitHub, LinkedIn, Upwork), profile photo
- 📊 **Charts** — Animated `fl_chart` skill line chart with visibility-triggered animation

**Target Platforms:**

| Platform | Support |
|---|---|
| Android | ✅ Full support (Firebase, Google Services configured) |
| iOS | ✅ Configured (Runner.xcodeproj present) |
| Web | ✅ Configured (web/ folder, manifest, PWA icons) |
| macOS | ✅ Configured (macos/ folder) |
| Windows | ✅ Configured (windows/ CMakeLists) |

---

## 2. Folder Structure

```
Dmp_Portfolio_App/
├── lib/
│   ├── main.dart                    # Entry point: Firebase init, DI setup, runApp
│   ├── app/
│   │   └── dmpportfolioapp.dart     # Root MaterialApp.router with theme, ScreenUtil, ResponsiveBreakpoints
│   ├── core/
│   │   └── di/
│   │       └── injection_container.dart  # All GetIt DI registrations for every feature
│   ├── features/                    # Feature-first folder. Each feature is self-contained.
│   │   ├── dashbord/                # [TYPO] Bottom nav + side nav shell (DashboardView)
│   │   │   └── widget/
│   │   │       └── bottom_bar_item.dart  # Individual tab bar item widget
│   │   ├── home/                    # Home screen (profile banner, skill chart, featured projects)
│   │   │   ├── data/models/entity/  # SkillData — local model (not from Firestore)
│   │   │   └── presentation/
│   │   │       ├── bloc/            # HomeBloc (defined but unused; logic is in-screen)
│   │   │       ├── screen/          # home_view.dart — main HomeView
│   │   │       └── widgets/         # HomeBanner, PremiumSkillLineChart, shimmer widgets, QuickAccessCard
│   │   ├── about/                   # Profile/About screen
│   │   │   ├── data/                # ProfileRemoteDataSource, ProfileModel, ProfileRepositoryImpl
│   │   │   ├── domain/              # ProfileEntity, SocialLinksEntity, ProfileRepository, GetProfileUseCase
│   │   │   └── presentation/        # ProfileBloc, AboutView, ProfileDeteileCard widgets
│   │   ├── skils/                   # [TYPO] Skills screen
│   │   │   ├── data/                # SkilsRemoteDataSource, SkilModel (rich nested model), ExperienceModel
│   │   │   ├── domain/              # SkilEntity, ExperienceEntity, LearningRoadmapEntity, UseCases
│   │   │   └── presentation/        # SkilsBloc, SkilsView, 10+ widgets (shimmer, cards, timeline)
│   │   ├── projects/                # Projects screen
│   │   │   ├── data/                # ProjectRemoteDataSource, ProjectModel
│   │   │   ├── domain/              # ProjectEntity, ProjectRepository, GetProjectsUseCase
│   │   │   └── presentation/        # ProjectBloc, ProjectView, project card widgets
│   │   └── education/               # Education screen
│   │       ├── data/                # EducationRemoteDataSource, EducationModel
│   │       ├── domain/              # EducationEntity, EducationRepository, GetEducationUseCase
│   │       └── presentation/        # EducationBloc, EduactionView [TYPO], shimmer widgets
│   ├── shared/
│   │   └── common/                  # Reusable widgets across features:
│   │       ├── app_button.dart            # Full-featured AppButton with loading state & countdown timer
│   │       ├── app_button_outline.dart    # Outline variant of AppButton
│   │       ├── custom_segmented_control_widget.dart  # Animated tab switcher (mobile + web hover)
│   │       ├── custom_tab_bar_widget.dart # Horizontal scrollable tab bar
│   │       ├── responsive_helper.dart     # ResponsiveView widget (mobile/tablet/desktop switcher)
│   │       └── stranded_shimmer.dart      # Reusable shimmer placeholder widget
│   └── utils/
│       ├── app_colors.dart           # All colors, supports LIGHT and DARK themes
│       ├── app_constants.dart        # App name, unknown error text, country list, selected theme
│       ├── app_dimensions.dart       # Responsive font sizes + line height helpers (font size 6 – 77)
│       ├── app_images.dart           # All image/SVG/animation asset paths as constants
│       ├── app_navigation.dart       # GoRouter configuration (single /dashboard route)
│       ├── enums.dart                # AlertType, ButtonType, ThemeType, FilterType, etc.
│       └── firebase_options.dart     # Auto-generated Firebase config
├── images/
│   ├── png/                         # Profile images, banners, app logos
│   ├── svg/                         # 30+ SVG icons for nav, skills, categories
│   └── animation/                   # 3 Lottie animation JSON files
├── fonts/                           # Avenir Arabic (Regular/Light/Heavy)
├── android/                         # Android project (Firebase google-services.json included)
├── ios/                             # iOS project (Xcode)
├── web/                             # Flutter web (index.html, manifest.json, PWA icons)
├── macos/                           # macOS desktop target
├── windows/                         # Windows desktop target
├── pubspec.yaml                     # Dependencies and asset declarations
└── test/widget_test.dart            # Default widget test (not modified)
```

---

## 3. Architecture

**Pattern: Feature-First Clean Architecture**

Each feature follows a strict three-layer pattern:

```
Feature (e.g., about/)
│
├── data/
│   ├── datasources/       <- Firestore queries (raw data, throws on error)
│   ├── models/            <- Extends entity; adds fromJson / toJson
│   └── repository/        <- Implements domain repository using data source
│
├── domain/
│   ├── entities/          <- Pure Dart classes (Equatable). No framework dependency.
│   ├── repositories/      <- Abstract interface (contract)
│   └── usecases/          <- Single-responsibility callable classes
│
└── presentation/
    ├── bloc/              <- BLoC events, states, logic
    ├── screen/            <- Full-page view widgets
    └── widgets/           <- Feature-specific UI components
```

**Dependency direction:** `presentation` → `domain` ← `data`  
The domain layer has no dependency on Flutter or Firebase — it is pure Dart.

**Dependency Injection:** `get_it` is used as a service locator. All registrations happen in `injection_container.dart` before `runApp`. Blocs use `registerFactory` (new instance per request); data sources, repositories, and use cases use `registerLazySingleton`.

---

## 4. State Management

**Library used: `flutter_bloc` (BLoC pattern)**

Each feature has its own BLoC with the same structure:

| Part | Example |
|---|---|
| Event | `FetchProfileData extends ProfileEvent` |
| State | `ProfileInitial`, `ProfileLoading`, `ProfileLoaded(data)`, `ProfileError(message)` |
| BLoC | `ProfileBloc` — calls use case, emits states |

### Inconsistency found

Two different patterns are mixed across screens:

**Pattern A (HomeView) — Clean:**  
`BlocProvider` wraps the subtree; `BlocBuilder` builds UI reactively.

**Pattern B (AboutView, SkilsView, ProjectView, EduactionView) — Mixed:**  
BLoC is created manually via `sl<Bloc>()`, then provided with `BlocProvider.value`. A `BlocListener` updates local `setState` variables (`_isLoading`, `_errorMessage`, `_data`). The UI then uses `if (_isLoading)` checks.

Pattern B defeats the purpose of BLoC — it mixes BLoC state with `setState`, creating two sources of truth.

---

## 5. Navigation and Routing

**Library: `go_router ^17.3.0`**

The router has a **single route**:

```dart
GoRouter(
  initialLocation: '/dashboard',
  routes: [
    GoRoute(path: '/dashboard', builder: (_, __) => const DashboardView()),
  ],
)
```

**Internal navigation** between the 5 main screens is handled manually inside `DashboardView` using `setState(() => selectedTab = index)` and a `switch` statement — not through the router.

```
DashboardView (selectedTab int)
  case 0 → HomeView
  case 1 → SkilsView
  case 2 → ProjectView
  case 3 → EduactionView
  case 4 → AboutView
```

Cross-screen tab jumping uses a callback: `onChangeTab(tabIndex, data: payload)`, passed as a parameter.

**Platform layouts:**
- **Mobile**: `BottomNavigationBar` with tab indicator
- **Web/Desktop**: 84px-wide icon-only side rail with tooltips and hover states

---

## 6. Packages and Dependencies

### Core Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter_bloc` | `^8.1.6` | BLoC state management |
| `go_router` | `^17.3.0` | Declarative routing |
| `get_it` | `^8.0.3` | Dependency injection / service locator |
| `firebase_core` | `^3.10.0` | Firebase SDK initialisation |
| `cloud_firestore` | `^5.6.0` | Firestore NoSQL database |
| `flutter_screenutil` | `^5.9.3` | Responsive sizing (.w, .h, .sp, .r) |
| `responsive_framework` | `^1.5.1` | Named breakpoints (MOBILE/TABLET/DESKTOP/4K) |
| `flutter_svg` | `^2.3.0` | SVG rendering |
| `lottie` | `^3.3.3` | Lottie JSON animation playback |
| `fl_chart` | `^0.68.0` | Line chart for skills visualization |
| `visibility_detector` | `^0.4.0+2` | Detect widget visibility for chart animation |
| `shimmer` | `^3.0.0` | Shimmer loading skeleton effect |
| `screen_go` | `^1.1.8` | ⚠️ Not seen used in code — likely unused |
| `cupertino_icons` | `^1.0.8` | iOS-style icons |

### Dev Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter_lints` | `^6.0.0` | Static analysis lint rules |
| `flutter_test` | SDK | Widget/unit testing |

### Notes
- **`equatable`** is used in all entities but is **NOT listed in pubspec.yaml**. It is a transitive dependency and should be declared explicitly.
- **`screen_go`** is declared but not visibly used anywhere in the reviewed code.
- All packages appear current as of late 2026.

---

## 7. Data Layer

**Source: Cloud Firestore (Firebase)**

### Firestore Collections

| Collection | Feature | Fields |
|---|---|---|
| `profile` | About | name, title, bio, location, profile_url, cv_url, social_links |
| `skills` | Skills | title, category, items, metrics, milestones, currently_mastering, learning_roadmap |
| `experience` | Skills | role, company, duration, is_current, responsibilities, technologies |
| `projects` | Projects | title, subtitle, tag, responsibilities, technologies, github_link, live_link, category |
| `education` | Education | title, institution, dateRange, bulletPoints, icon_code, highlightBoxText |

### Data Flow

```
Firestore -> DataSource (fromJson) -> Model (extends Entity) -> Repository -> UseCase -> BLoC -> UI
```

All models extend their domain entities and add `fromJson` / `toJson`. The domain layer stays clean — no Firestore import.

### Error Handling
All data sources catch exceptions and rethrow as generic `Exception("message")`. This loses the original stack trace and exception type.

### Local Storage / Cache
**None implemented.** Every tab switch fetches fresh data from Firestore. No offline support, no caching.

---

## 8. UI Layer

### Main Screens

| Screen | Key UI Elements |
|---|---|
| Home | Profile banner (Lottie + network photo), quick-access cards, animated line chart, horizontal project list (mobile) / vertical list (web) |
| Skills | Segmented control (Skills/Experience), sub-tabs (Technical/Professional/Achievements/Learning), 2-column grid, milestone timeline |
| Projects | Segmented control (Organizations/Personal), scrollable detail cards with tag, responsibilities, technologies, links |
| Education | Scrollable list of education cards with icon, institution, date range, bullet points |
| About | Circular profile photo, name badge, bio card, social link buttons |

### Reusable Widgets (shared/)
- `AppButton` — Loading spinner, countdown timer, disabled state, customisable colors
- `AppButtonOutline` — Outlined variant
- `CustomSegmentedControl` — Scale animation on mobile, hover highlight on web
- `CustomTabBar` — Scrollable horizontal tab bar
- `ResponsiveView` — Simple mobile/desktop switcher
- `StrandedShimmer` — One-line reusable shimmer placeholder

### Shimmer Loading
Every screen has matching shimmer widgets (12 shimmer widgets total). Good UX practice.

### Theme
- **Primary**: `#FFB400` (golden amber)
- **Button**: `#004643` (deep teal)
- **Background**: White with amber-to-white gradient
- **Font**: Avenir Arabic (Regular 400, Light 300, Heavy 700)
- **Dark mode**: Color class exists, but light and dark return identical colors — dark mode is not actually implemented.

### Responsiveness
- `flutter_screenutil` scales px values based on design size (1440×900 web, 360×690 mobile)
- `responsive_framework` provides named breakpoints
- Most widgets have separate `_buildMobile()` / `_buildWeb()` methods

---

## 9. Authentication, Permissions, and Security

| Area | Status |
|---|---|
| Authentication | None — app is public read-only, no login |
| Firestore Security Rules | Unknown (not in repo). Must be configured in Firebase Console. |
| `google-services.json` | Committed to repo — acceptable for a public portfolio |
| `firebase_options.dart` | Committed to repo — contains API keys (acceptable for portfolio, not for sensitive data apps) |
| Device Permissions | None required (no camera, location, contacts) |
| Network Calls | Firestore only — no raw HTTP/REST |
| Android Signing | Release build uses DEBUG signing key (TODO in build.gradle.kts) |

---

## 10. Problems Found

### Bugs

1. **`ProfessionalSkillsCard` index mismatch** (`skils_view.dart` ~line 250): uses outer GridView index to access `skill.items!`, which can have a different length — will throw `RangeError` at runtime.

2. **Web banner CTAs do nothing** — "View Projects" and "Download CV" buttons on the web hero section receive `null` callbacks and fire no action when tapped.

3. **Home chart shows hardcoded skills** — `mySkills` list in `_HomeViewState` is static Dart code, not data from Firestore. The home screen chart never shows real data.

4. **`ContactsView` is fully commented out** — The file exists but contains no working code.

5. **`SkilsBloc` emits `SkilsLoading` on both events** — Switching from Experience tab back to Skills tab triggers a redundant loading flash even when data is already loaded.

### Bad Practices

6. **Mixed state management** — 4 of 5 screens use `BlocListener` + `setState` together, creating dual sources of truth for loading/error/data.

7. **`AppColors.initColors()` called inside `build()`** — Creates a new object on every widget rebuild.

8. **`dynamic data` prop on every screen** — Type-unsafe. Should use typed parameters or sealed classes.

9. **`equatable` used but not declared** in pubspec.yaml — Only works as a transitive dependency.

10. **Android `applicationId = "com.example.dmpportfolioapp"`** — Default Flutter package name not changed before release.

11. **Release build uses debug signing** — Must fix before Play Store release.

12. **`screen_go` declared but not used** — Adds unnecessary app size.

### Code Duplication

13. **Loading/error/empty state pattern copy-pasted** across 4 screens. A shared `DataStateBuilder<T>` widget would eliminate this.

14. **Section header row** ("Title" + "See All →") duplicated 3 times in `home_view.dart`. Extract to a `SectionHeader` widget.

### Performance Issues

15. **No data caching** — Every screen creation fetches from Firestore. No offline support.

16. **`Image.network` without caching** — Profile photo re-downloaded on every rebuild. Use `cached_network_image`.

### Unused / Dead Code

17. **`HomeBloc`** — 3 files exist but `HomeView` never uses `HomeBloc`. Dead code.

18. **`ContactsView`** — Entire file commented out.

19. **`AppConstants.countries`** — Country model list with no usage in portfolio app. Template leftover.

20. **`enums.dart` over-declaration** — `FilterType`, `TaskStatus`, `DeviceOS`, `Flavor` are unused in this project. Template leftovers.

21. **`AppButton` countdown timer** — OTP-style timer feature has no use case in a portfolio app. Copied from another project.

22. **Typos in folder/file names** — `dashbord/`, `skils/`, `edaduation_bloc.dart`, `eduaction_view.dart`, `profile_deteile_card.dart`, `prfile_repository_impl.dart`. Should be fixed for professionalism.

---

## 11. Improvement Plan

### HIGH Priority

| # | Task | Reason |
|---|---|---|
| H1 | Fix `ProfessionalSkillsCard` index crash | Crashes at runtime for any user |
| H2 | Connect Home chart to real Firestore skills data | Home shows wrong static data |
| H3 | Fix web banner CTA buttons | Primary actions on web do nothing |
| H4 | Change Android `applicationId` from `com.example.*` | Required before any release |
| H5 | Set up Android release signing | App cannot be published without it |

### MEDIUM Priority

| # | Task | Reason |
|---|---|---|
| M1 | Migrate screens from BlocListener+setState to pure BlocBuilder | Cleaner, single source of truth |
| M2 | Add `equatable` to pubspec.yaml explicitly | Fragile transitive dependency |
| M3 | Add memory caching for Firestore data | Prevents re-fetch on every tab switch |
| M4 | Add `cached_network_image` for profile photo | Stops redundant network downloads |
| M5 | Extract `SectionHeader` widget from home_view.dart | Remove 3 copies of same code |
| M6 | Create `DataStateBuilder<T>` for loading/error/empty/loaded | Remove copy-pasted state handling |
| M7 | Add Firestore `orderBy` clauses | Documents have no guaranteed sort order |

### LOW Priority

| # | Task | Reason |
|---|---|---|
| L1 | Remove unused enums and constants | Clean up template leftovers |
| L2 | Remove/delete `HomeBloc` dead code | Confusing for future developers |
| L3 | Remove `screen_go` if unused | Reduces app size |
| L4 | Implement actual dark mode | Light/dark colors are currently identical |
| L5 | Add Web SEO meta tags in `index.html` | Improves search discoverability |
| L6 | Fix typos in folder/file names | Professionalism and searchability |
| L7 | Add unit tests for use cases and repositories | Zero tests currently exist |
| L8 | Add proper Firestore read-only security rules | Protects Firebase project |
| L9 | Add custom launcher icons with `flutter_launcher_icons` | Default Flutter icon still used |
| L10 | Standardise comments to English only | Improves team collaboration |

---

## 12. Next Steps — First 5 Tasks

### Task 1 — Fix the ProfessionalSkillsCard crash
**File:** `lib/features/skils/presentation/screen/skils_view.dart` (~line 248)

The `itemBuilder` uses the outer GridView `index` to read `_professionalSkillsList[index].items![index]`.
The items list of one skill is typically shorter than the full professional skills list, causing a `RangeError`.

**Fix:** Read `items` from the current skill object, not using the GridView index as the items index.

```dart
// BEFORE (bug)
itemBuilder: (context, index) {
  final skill = _professionalSkillsList[index];
  return ProfessionalSkillsCard(skill: skill.items![index]); // wrong index
}

// AFTER (fix)
itemBuilder: (context, skillIndex) {
  final skill = _professionalSkillsList[skillIndex];
  final itemName = (skill.items != null && skill.items!.isNotEmpty)
      ? skill.items!.first
      : '';
  return ProfessionalSkillsCard(skill: itemName);
}
```

---

### Task 2 — Fix Home screen static skills + broken web CTAs
**File:** `lib/features/home/presentation/screen/home_view.dart`

1. Remove the hardcoded `mySkills` list. Add `SkilsBloc` to the `MultiBlocProvider` and pass real Firestore skills to `PremiumSkillLineChart`.
2. Wire up `onViewProjects` in `HomeBanner`:
   ```dart
   HomeBanner(
     profileEntity: state.data,
     onViewProjects: () => widget.onChangeTab(2),
     onDownloadCv: () { /* launch cv_url from profile */ },
   )
   ```

---

### Task 3 — Migrate all screens to pure BlocBuilder
**Files:** `about_view.dart`, `skils_view.dart`, `project_view.dart`, `eduaction_view.dart`

Remove manual `_isLoading`, `_errorMessage`, and `_data` fields. Remove `BlocListener`. Use `BlocBuilder` that switches on the BLoC state type:

```dart
BlocBuilder<ProjectBloc, ProjectState>(
  builder: (context, state) {
    if (state is ProjectLoading) return const ShimmerDetaileProjectCard();
    if (state is ProjectLoaded)  return _buildList(state.projectList);
    if (state is ProjectError)   return ErrorView(message: state.message);
    return const SizedBox.shrink();
  },
)
```

---

### Task 4 — Clean up dead code
Delete or fix these files:

- `lib/features/about/presentation/screen/contacts_view.dart` — remove the file or implement it
- `lib/features/home/presentation/bloc/home_bloc.dart` + `home_event.dart` + `home_state.dart` — remove if unused
- `lib/utils/enums.dart` — remove `FilterType`, `TaskStatus`, `DeviceOS`, `Flavor`
- `lib/utils/app_constants.dart` — remove `countries` list and `kOTPResendingDuration`
- `pubspec.yaml` — remove `screen_go` if unused; add `equatable: ^2.0.8` explicitly

---

### Task 5 — Prepare for release
1. **Android package name** — In `android/app/build.gradle.kts`, change:
   ```
   applicationId = "com.example.dmpportfolioapp"
   ```
   to your real ID, e.g. `com.dmpdissanayake.portfolio`

2. **Android signing** — Create a keystore and configure `signingConfigs.release` in `build.gradle.kts`. Remove the `signingConfig = signingConfigs.getByName("debug")` line from the release build type.

3. **Web index.html** — Update `<title>`, `<meta name="description">`, and `<meta name="apple-mobile-web-app-title">` from the default Flutter placeholder values.

4. **App icons** — Add `flutter_launcher_icons` to dev dependencies, create `flutter_icons:` config in `pubspec.yaml`, and run `dart run flutter_launcher_icons` to replace the default Flutter icon.

5. **Firestore Security Rules** — In the Firebase Console, set read-only public rules:
   ```
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /{document=**} {
         allow read: if true;
         allow write: if false;
       }
     }
   }
   ```

---

*This summary was generated by reading: `pubspec.yaml`, all `lib/` source files (~60 files), `android/app/build.gradle.kts`, `web/index.html`, and the `images/`, `fonts/` asset directories.*
