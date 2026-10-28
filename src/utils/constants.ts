import { ProjectEntity, SkillData } from '../types';

export const AppConstants = {
  appName: '@dmp Portfolio App',
  author: 'DMP Dissanayake',
  role: 'Flutter Mobile Developer',
  email: '99disanayake@gmail.com',
  github: 'https://github.com/DMPDissanayake',
  location: 'Sri Lanka (LK)',
  bio: 'Passionate Flutter & Cross-Platform Mobile Application Developer with strong expertise in Clean Architecture, BLoC State Management, REST APIs, and building fluid, responsive user interfaces.',
};

export const AppColors = {
  primaryColor: '#FFB400',
  appButtonColor: '#004643',
  textBlackColor1: '#2B2B2B',
  disabledAppButtonColor: 'rgba(0, 70, 67, 0.36)',
  appButtonBorderColor: '#004643',
  nonChangeWhite: '#FFFFFF',
  nonChangeBlack: '#000000',
  errorColor: '#EF4444',
  successColor: '#10B981',
  whiteBackgroundColor: '#FFFFFF',
  textFieldColor: '#C4C4C4',
  bottomNavigationBarUnselectColor: '#484C52',
};

export const AppImages = {
  homeBanner: '/images/png/home_benner.png',
  projectExPng: '/images/png/Capture.png',
  profileImage: '/images/png/profile_image.jpeg',
  homeImage: '/images/png/homeImage.png',
  appLogo: '/images/png/png_app_logo.png',

  // SVGs
  svgHome: '/images/svg/svg_home.svg',
  svgSkills: '/images/svg/svg_skills.svg',
  svgProject: '/images/svg/svg_project.svg',
  svgEducation: '/images/svg/svg_education.svg',
  svgProfile: '/images/svg/svg_profile.svg',
  svgLearning: '/images/svg/svg_learning.svg',
  svgProfessional: '/images/svg/svg_professional.svg',
  svgTechnical: '/images/svg/svg_technical.svg',
  svgTrophy: '/images/svg/svg_trophy.svg',
  svgRightArrow: '/images/svg/svg_right_arrow.svg',
  svgEv: '/images/svg/svg_ev.svg',
  svgUrl: '/images/svg/svg_url.svg',
  svgGithub: '/images/svg/svg_github.svg',

  // Animation
  mADevelopment: '/images/animation/mobile application development.json',
  loadingAnimation: '/images/animation/Loading Lottie animation.json',
};

export const initialSkills: SkillData[] = [
  { name: 'Flutter', percentage: 80, category: 'Technical', description: 'Cross-platform app development, custom widgets, state management, and platform channels' },
  { name: 'Dart', percentage: 85, category: 'Technical', description: 'Strong asynchronous programming, OOP, functional patterns, and Dart 3 language features' },
  { name: 'Clean Architecture', percentage: 80, category: 'Technical', description: 'Separation of concerns, domain/data/presentation layers, use cases, and repositories' },
  { name: 'REST API', percentage: 90, category: 'Technical', description: 'Dio, HTTP integration, JSON serialization, interceptors, error handling, caching' },
  { name: 'Git', percentage: 70, category: 'Technical', description: 'Version control, feature branching, merge conflict resolution, CI/CD workflows' },
];

export const allDetailedSkills: SkillData[] = [
  // Technical
  { name: 'Flutter', percentage: 80, category: 'Technical', description: 'Cross-platform app development, custom animations, responsive layouts, Material 3' },
  { name: 'Dart', percentage: 85, category: 'Technical', description: 'Core Dart, Null safety, Streams, Isolates, Generators, Functional programming' },
  { name: 'BLoC Pattern', percentage: 85, category: 'Technical', description: 'Reactive state management, flutter_bloc, events, states, clean separation' },
  { name: 'Clean Architecture', percentage: 80, category: 'Technical', description: 'Enterprise structure: Presentation, Domain, and Data layers' },
  { name: 'REST API & Dio', percentage: 90, category: 'Technical', description: 'HTTP clients, interceptors, error handling, token refresh, multipart requests' },
  { name: 'Firebase', percentage: 75, category: 'Technical', description: 'Authentication, Firestore, Push Notifications (FCM), Remote Config' },
  { name: 'Local Database (Isar / SQLite)', percentage: 75, category: 'Technical', description: 'Offline caching, indexing, performant local storage and query handling' },
  { name: 'Git & Version Control', percentage: 70, category: 'Technical', description: 'GitHub flow, branching strategies, semantic versioning, pull requests' },

  // Professional
  { name: 'Problem Solving & Debugging', percentage: 88, category: 'Professional', description: 'Systematic root cause analysis, DevTools profiling, memory leak detection' },
  { name: 'Agile & Scrum Methodologies', percentage: 82, category: 'Professional', description: 'Sprint planning, standups, retrospectives, story sizing, Jira / Trello' },
  { name: 'UI/UX Implementation', percentage: 85, category: 'Professional', description: 'Figma to pixel-perfect code, responsive design across mobile, tablet, and web' },
  { name: 'Code Quality & Clean Code', percentage: 86, category: 'Professional', description: 'SOLID principles, DRY, code refactoring, self-documenting code' },
  { name: 'Team Collaboration', percentage: 85, category: 'Professional', description: 'Cross-functional teamwork with designers, backend engineers, and product managers' },

  // Achievements
  { name: 'EV Charging App Architecture', percentage: 92, category: 'Achievements', description: 'Engineered complete charging station finder with real-time status and payment' },
  { name: 'Production E-Commerce Platform', percentage: 90, category: 'Achievements', description: 'Delivered end-to-end shopping app with catalog, cart, checkout, and tracking' },
  { name: 'Mobile App Portfolio Release', percentage: 88, category: 'Achievements', description: 'Designed and deployed responsive portfolio web & mobile applet' },
  { name: 'Hackathon & Challenge Finalist', percentage: 85, category: 'Achievements', description: 'Built rapid innovative mobile prototypes under tight deadlines' },

  // Learning
  { name: 'Kotlin & Jetpack Compose', percentage: 70, category: 'Learning', description: 'Expanding native Android capabilities and modern declarative UI' },
  { name: 'CI/CD Automation & Fastlane', percentage: 68, category: 'Learning', description: 'Automating build pipelines, test execution, and app store deployment' },
  { name: 'AI Integration in Mobile Apps', percentage: 74, category: 'Learning', description: 'Integrating Gemini AI, on-device ML, and conversational interfaces' },
  { name: 'Advanced Micro-interactions', percentage: 78, category: 'Learning', description: 'Mastering Rive, Lottie, and complex physics-based UI transitions' },
];

export const initialProjects: ProjectEntity[] = [
  {
    id: '1',
    title: 'E-Commerce App',
    shortDescription: 'A modern shopping application built with Flutter.',
    fullDescription:
      'A complete e-commerce application with authentication, cart management, wishlist, payment flow, REST API integration, and Clean Architecture.',
    thumbnail: '/images/png/Capture.png',
    images: '/images/png/Capture.png',
    technologies: [
      'Flutter',
      'Bloc',
      'Clean Architecture',
      'REST API',
      'Firebase',
      'Isar',
    ],
    githubUrl: 'https://github.com/DMPDissanayake',
    liveDemoUrl: 'https://github.com/DMPDissanayake',
    isFeatured: true,
    isCompleted: true,
    duration: '2026',
    icon: '/images/svg/svg_ev.svg',
    color: '#10B981',
  },
  {
    id: '2',
    title: 'EV Charging App',
    shortDescription: 'Electric vehicle charging station application.',
    fullDescription:
      'A Flutter application for locating charging stations, viewing charging history, station navigation, live connector availability, and managing user accounts.',
    thumbnail: '/images/png/Capture.png',
    images: '/images/png/Capture.png',
    technologies: ['Flutter', 'Bloc', 'REST API', 'Firebase', 'Google Maps'],
    githubUrl: 'https://github.com/DMPDissanayake',
    liveDemoUrl: '',
    isFeatured: true,
    isCompleted: true,
    duration: '2025',
    icon: '/images/svg/svg_ev.svg',
    color: '#10B981',
  },
  {
    id: '3',
    title: 'Smart Energy Monitor',
    shortDescription: 'Real-time power consumption and telemetry dashboard.',
    fullDescription:
      'Mobile application connected with IoT smart energy meters to monitor daily consumption, peak power alerts, and billing forecasts.',
    thumbnail: '/images/png/Capture.png',
    images: '/images/png/Capture.png',
    technologies: ['Flutter', 'Bloc', 'REST API', 'WebSockets', 'Charts'],
    githubUrl: 'https://github.com/DMPDissanayake',
    liveDemoUrl: '',
    isFeatured: true,
    isCompleted: true,
    duration: '2025',
    icon: '/images/svg/svg_ev.svg',
    color: '#10B981',
  },
  {
    id: '4',
    title: 'Ride Fleet & Telematics',
    shortDescription: 'Driver dispatch and EV fleet telemetry platform.',
    fullDescription:
      'Comprehensive fleet monitoring app providing live geofencing, driver shift assignments, battery state-of-charge tracking, and route optimization.',
    thumbnail: '/images/png/Capture.png',
    images: '/images/png/Capture.png',
    technologies: ['Flutter', 'Clean Architecture', 'REST API', 'Firebase'],
    githubUrl: 'https://github.com/DMPDissanayake',
    liveDemoUrl: '',
    isFeatured: true,
    isCompleted: true,
    duration: '2025',
    icon: '/images/svg/svg_ev.svg',
    color: '#10B981',
  },
  {
    id: '5',
    title: 'Smart Health & Wellness',
    shortDescription: 'Health tracker and habit coach with offline sync.',
    fullDescription:
      'Personal health companion tracking vital signs, activity metrics, daily water intake, and automated reminders with local Isar database sync.',
    thumbnail: '/images/png/Capture.png',
    images: '/images/png/Capture.png',
    technologies: ['Flutter', 'Bloc', 'Isar DB', 'Local Notifications'],
    githubUrl: 'https://github.com/DMPDissanayake',
    liveDemoUrl: '',
    isFeatured: true,
    isCompleted: true,
    duration: '2025',
    icon: '/images/svg/svg_ev.svg',
    color: '#10B981',
  },
];
