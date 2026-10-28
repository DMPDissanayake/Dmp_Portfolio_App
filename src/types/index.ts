export interface SkillData {
  name: string;
  percentage: number;
  category?: 'Technical' | 'Professional' | 'Achievements' | 'Learning';
  description?: string;
}

export interface ProjectEntity {
  id: string;
  title: string;
  shortDescription: string;
  fullDescription: string;
  thumbnail: string;
  images: string;
  technologies: string[];
  githubUrl: string;
  liveDemoUrl: string;
  isFeatured: boolean;
  isCompleted: boolean;
  duration: string;
  icon: string;
  color: string;
}

export type TabIndex = 0 | 1 | 2 | 3 | 4;

export interface QuickAccessCategory {
  name: 'Technical' | 'Professional' | 'Achievements' | 'Learning';
  icon: string;
}
