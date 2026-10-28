import React, { useState } from 'react';
import { HomeBanner } from './HomeBanner';
import { QuickAccessCard } from './QuickAccessCard';
import { PremiumSkillLineChart } from './PremiumSkillLineChart';
import { ProjectCard } from '../Projects/ProjectCard';
import { ProjectDetailsModal } from '../Projects/ProjectDetailsModal';
import { ProjectEntity, TabIndex } from '../../types';
import {
  AppColors,
  AppImages,
  initialProjects,
  initialSkills,
} from '../../utils/constants';

interface HomeViewProps {
  onChangeTab: (tab: TabIndex, data?: unknown) => void;
  data?: unknown;
}

export const HomeView: React.FC<HomeViewProps> = ({ onChangeTab }) => {
  const [projects] = useState<ProjectEntity[]>(initialProjects);
  const [selectedProject, setSelectedProject] = useState<ProjectEntity | null>(null);
  const [favoriteIds, setFavoriteIds] = useState<Set<string>>(new Set(['1', '2']));

  const handleToggleFavorite = (id: string, e?: React.MouseEvent) => {
    e?.stopPropagation();
    setFavoriteIds((prev) => {
      const next = new Set(prev);
      if (next.has(id)) {
        next.delete(id);
      } else {
        next.add(id);
      }
      return next;
    });
  };

  return (
    <div
      className="min-h-full w-full select-none"
      style={{
        background: 'linear-gradient(180deg, rgba(255, 180, 0, 0.4) 0%, #FFFFFF 100%)',
      }}
    >
      <div className="mx-auto max-w-4xl pb-16">
        {/* Banner */}
        <div className="w-full">
          <HomeBanner onBannerClick={() => onChangeTab(4)} />
        </div>

        <div className="mt-3 px-3 sm:px-5 space-y-4">
          {/* Quick Access / My Skills Section */}
          <section>
            <div className="flex items-center justify-between py-1">
              <h2 className="text-sm font-bold text-[#2B2B2B] tracking-tight">
                My Skills
              </h2>
              <button
                type="button"
                onClick={() => onChangeTab(1)}
                className="group flex items-center space-x-1 text-xs font-bold transition-opacity hover:opacity-80 cursor-pointer"
                style={{ color: AppColors.primaryColor }}
              >
                <span>See All</span>
                <img
                  src={AppImages.svgRightArrow}
                  alt="arrow"
                  className="h-4 w-4 filter invert-[75%] sepia-[85%] saturate-[1200%] hue-rotate-[5deg] group-hover:translate-x-0.5 transition-transform"
                />
              </button>
            </div>

            <div className="mt-2 grid grid-cols-4 gap-2 sm:gap-3">
              <QuickAccessCard
                name="Technical"
                icon={AppImages.svgTechnical}
                onTap={() => onChangeTab(1, { category: 'Technical' })}
              />
              <QuickAccessCard
                name="Professional"
                icon={AppImages.svgProfessional}
                onTap={() => onChangeTab(1, { category: 'Professional' })}
              />
              <QuickAccessCard
                name="Achievements"
                icon={AppImages.svgTrophy}
                onTap={() => onChangeTab(1, { category: 'Achievements' })}
              />
              <QuickAccessCard
                name="Learning"
                icon={AppImages.svgLearning}
                onTap={() => onChangeTab(1, { category: 'Learning' })}
              />
            </div>
          </section>

          {/* Featured Projects Section */}
          <section>
            <div className="flex items-center justify-between py-1">
              <h2 className="text-sm font-bold text-[#2B2B2B] tracking-tight">
                Featured Projects
              </h2>
              <button
                type="button"
                onClick={() => onChangeTab(2)}
                className="group flex items-center space-x-1 text-xs font-bold transition-opacity hover:opacity-80 cursor-pointer"
                style={{ color: AppColors.primaryColor }}
              >
                <span>See All</span>
                <img
                  src={AppImages.svgRightArrow}
                  alt="arrow"
                  className="h-4 w-4 filter invert-[75%] sepia-[85%] saturate-[1200%] hue-rotate-[5deg] group-hover:translate-x-0.5 transition-transform"
                />
              </button>
            </div>

            {/* Horizontal Scroll List */}
            <div className="mt-2 -mx-3 px-3 sm:-mx-5 sm:px-5 flex gap-3 overflow-x-auto pb-3 pt-1 scroll-smooth">
              {projects.map((proj) => (
                <ProjectCard
                  key={proj.id}
                  project={proj}
                  compact={true}
                  isFavorite={favoriteIds.has(proj.id)}
                  onToggleFavorite={(id, e) => handleToggleFavorite(id, e)}
                  onSelect={(p) => setSelectedProject(p)}
                />
              ))}
            </div>
          </section>

          {/* Technical Skills Section with Interactive Chart */}
          <section className="pt-1">
            <div className="flex items-center justify-between py-1">
              <h2 className="text-sm font-bold text-[#2B2B2B] tracking-tight">
                Technical Skills
              </h2>
              <button
                type="button"
                onClick={() => onChangeTab(1)}
                className="group flex items-center space-x-1 text-xs font-bold transition-opacity hover:opacity-80 cursor-pointer"
                style={{ color: AppColors.primaryColor }}
              >
                <span>See All</span>
                <img
                  src={AppImages.svgRightArrow}
                  alt="arrow"
                  className="h-4 w-4 filter invert-[75%] sepia-[85%] saturate-[1200%] hue-rotate-[5deg] group-hover:translate-x-0.5 transition-transform"
                />
              </button>
            </div>

            <div className="mt-2">
              <PremiumSkillLineChart skills={initialSkills} />
            </div>
          </section>
        </div>
      </div>

      {/* Project Details Modal */}
      {selectedProject && (
        <ProjectDetailsModal
          project={selectedProject}
          isFavorite={favoriteIds.has(selectedProject.id)}
          onToggleFavorite={handleToggleFavorite}
          onClose={() => setSelectedProject(null)}
        />
      )}
    </div>
  );
};
