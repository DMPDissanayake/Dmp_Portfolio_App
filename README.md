# @dmp Portfolio App

A modern, responsive React and TypeScript portfolio web application for **DMP Dissanayake**, rewritten from the original Flutter application while preserving its visual identity, architecture, assets, and feature set.

## Features

- **Responsive Multiplatform Layout**:
  - **Mobile (< 768px)**: Bottom Navigation Bar with animated top border indicators and high-contrast active icons.
  - **Desktop / Tablet (>= 768px)**: Fixed side navigation drawer with branded header and section selectors.
- **Home View**:
  - Featured profile banner with Lottie mobile app development animation.
  - Quick access cards for Technical, Professional, Achievements, and Learning skills.
  - Horizontally scrolling featured projects carousel with technology badges, github links, and details drawer.
  - Interactive **Premium Skill Line Chart** featuring smooth cubic Bezier curve, gradient area fill, custom tooltips, and animated entry.
- **Skills View**:
  - Filterable by Technical, Professional, Achievements, and Learning categories.
  - Live search filtering across skill names and descriptions.
  - Visual competency progress bars and proficiency percentages.
- **Projects Showcase**:
  - Full catalog of featured and production-grade mobile applications.
  - Search by project title, description, or tech stack tag.
  - Interactive **Project Details Modal** with architecture highlights, clean architecture breakdown, and external links.
  - Favorites toggle state management.
- **Education & Credentials**:
  - Timeline of academic degrees (BSc in Software Engineering, HND in Computing).
  - Verified certifications in Flutter, Clean Architecture, BLoC, and REST API Security.
- **Profile & About**:
  - Developer biography, contact details, engineering pillars (Clean Architecture, BLoC, Performance).
  - Direct message contact form and dynamic CV / Resume generator.

## Tech Stack

- **Framework**: React 19, TypeScript
- **Styling**: Tailwind CSS v4, custom Avenir Arabic fonts
- **Icons & Animations**: Lucide React, Lottie React, custom SVG graphics
- **Build Tool**: Vite 6

## Development

```bash
npm install
npm run dev
```

Build for production:
```bash
npm run build
```
