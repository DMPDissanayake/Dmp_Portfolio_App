import React from 'react';
import { ProjectEntity } from '../../types';
import { AppColors, AppImages } from '../../utils/constants';
import { ChevronRight } from 'lucide-react';

interface ProjectCardProps {
  project: ProjectEntity;
  onSelect?: (project: ProjectEntity) => void;
  isFavorite?: boolean;
  onToggleFavorite?: (id: string, e: React.MouseEvent) => void;
  compact?: boolean;
}

export const ProjectCard: React.FC<ProjectCardProps> = ({
  project,
  onSelect,
  isFavorite = false,
  onToggleFavorite,
  compact = true,
}) => {
  return (
    <div
      onClick={() => onSelect?.(project)}
      className={`group flex flex-col overflow-hidden rounded-2xl border border-[#FFB400] bg-white transition-all duration-200 cursor-pointer shadow-[4px_0px_24px_rgba(0,0,0,0.12)] hover:shadow-[4px_4px_28px_rgba(255,180,0,0.22)] hover:-translate-y-0.5 select-none ${
        compact ? 'w-[170px] sm:w-[185px] flex-shrink-0' : 'w-full'
      }`}
    >
      {/* Top Project Image */}
      <div className="relative h-[90px] w-full bg-slate-100 overflow-hidden">
        <img
          src={project.images || project.thumbnail}
          alt={project.title}
          className="h-full w-full object-cover transition-transform duration-300 group-hover:scale-105"
          onError={(e) => {
            e.currentTarget.src = AppImages.projectExPng;
          }}
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/20 to-transparent pointer-events-none" />
      </div>

      {/* Card Body */}
      <div className="flex flex-1 flex-col justify-between p-2 sm:p-2.5">
        <div>
          {/* Header Row: Logo Badge + Title + Favorite Heart */}
          <div className="flex items-center space-x-1.5">
            {/* Logo Badge */}
            <div
              className="flex items-center justify-center h-5 w-5 rounded p-0.5 flex-shrink-0"
              style={{ backgroundColor: project.color || '#10B981' }}
            >
              <img
                src={project.icon || AppImages.svgEv}
                alt="logo"
                className="h-3.5 w-3.5 brightness-0 invert"
              />
            </div>

            {/* Title */}
            <h3 className="flex-1 truncate text-[11px] font-bold leading-tight text-[#2B2B2B]">
              {project.title}
            </h3>

            {/* Favorite Heart */}
            <button
              type="button"
              onClick={(e) => {
                e.stopPropagation();
                onToggleFavorite?.(project.id, e);
              }}
              className="p-0.5 text-[#FFB400] hover:scale-110 active:scale-90 transition-transform cursor-pointer"
            >
              <svg
                className="w-4 h-4"
                viewBox="0 0 24 24"
                fill={isFavorite ? '#FFB400' : 'none'}
                stroke="#FFB400"
                strokeWidth="2"
              >
                <path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
              </svg>
            </button>
          </div>

          {/* Description (max 3 lines) */}
          <p className="mt-1.5 line-clamp-3 text-[10px] leading-snug font-normal text-[#2B2B2B]/60 min-h-[42px]">
            {project.fullDescription}
          </p>

          {/* Tech Badges Wrap */}
          <div className="mt-2 flex flex-wrap gap-1 max-h-[44px] overflow-hidden">
            {project.technologies.slice(0, 4).map((tech) => (
              <span
                key={tech}
                className="rounded px-1.5 py-0.5 text-[9px] font-bold"
                style={{
                  backgroundColor: `${project.color || '#10B981'}25`,
                  color: project.color || '#10B981',
                }}
              >
                {tech}
              </span>
            ))}
            {project.technologies.length > 4 && (
              <span
                className="rounded px-1 py-0.5 text-[9px] font-bold"
                style={{
                  backgroundColor: `${project.color || '#10B981'}15`,
                  color: project.color || '#10B981',
                }}
              >
                +{project.technologies.length - 4}
              </span>
            )}
          </div>
        </div>

        {/* Bottom Section: Divider + Links & Details */}
        <div className="mt-2.5">
          <div className="h-[1px] w-full bg-[#FFB400]/60 mb-2" />
          <div className="flex items-center justify-between">
            {/* Github & URL Icons */}
            <div className="flex items-center space-x-2">
              <a
                href={project.githubUrl}
                target="_blank"
                rel="noopener noreferrer"
                onClick={(e) => e.stopPropagation()}
                className="hover:scale-110 transition-transform cursor-pointer"
                title="GitHub"
              >
                <img
                  src={AppImages.svgGithub}
                  alt="Github"
                  className="h-3.5 w-3.5 filter invert-[75%] sepia-[85%] saturate-[1200%] hue-rotate-[5deg]"
                />
              </a>
              {project.liveDemoUrl && (
                <a
                  href={project.liveDemoUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  onClick={(e) => e.stopPropagation()}
                  className="hover:scale-110 transition-transform cursor-pointer"
                  title="Demo Link"
                >
                  <img
                    src={AppImages.svgUrl}
                    alt="Link"
                    className="h-3.5 w-3.5 filter invert-[75%] sepia-[85%] saturate-[1200%] hue-rotate-[5deg]"
                  />
                </a>
              )}
            </div>

            {/* Details Button with arrow */}
            <div
              className="flex items-center space-x-0.5 rounded px-2 py-0.5 text-[10px] font-bold text-white shadow-xs group-hover:brightness-95 transition-all"
              style={{ backgroundColor: AppColors.primaryColor }}
            >
              <span>Details</span>
              <ChevronRight className="h-3 w-3" strokeWidth={3} />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
