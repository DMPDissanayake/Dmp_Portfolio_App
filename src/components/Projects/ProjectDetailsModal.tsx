import React from 'react';
import { ProjectEntity } from '../../types';
import { AppColors, AppImages } from '../../utils/constants';
import { X, ExternalLink, CheckCircle2, Calendar, Layers } from 'lucide-react';

interface ProjectDetailsModalProps {
  project: ProjectEntity | null;
  onClose: () => void;
  isFavorite: boolean;
  onToggleFavorite: (id: string) => void;
}

export const ProjectDetailsModal: React.FC<ProjectDetailsModalProps> = ({
  project,
  onClose,
  isFavorite,
  onToggleFavorite,
}) => {
  if (!project) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/60 backdrop-blur-xs animate-in fade-in duration-200">
      <div
        className="relative w-full max-w-lg max-h-[90vh] overflow-y-auto bg-white rounded-2xl border-2 border-[#FFB400] shadow-[0_20px_50px_rgba(0,0,0,0.25)] select-none"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header Image */}
        <div className="relative h-44 sm:h-52 w-full bg-slate-900 overflow-hidden">
          <img
            src={project.images || project.thumbnail}
            alt={project.title}
            className="w-full h-full object-cover opacity-90 hover:scale-105 transition-transform duration-500"
            onError={(e) => {
              e.currentTarget.src = AppImages.projectExPng;
            }}
          />
          <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/20 to-transparent" />

          {/* Close button */}
          <button
            onClick={onClose}
            className="absolute top-3 right-3 p-1.5 rounded-full bg-black/50 hover:bg-black text-white transition-colors cursor-pointer"
          >
            <X className="w-5 h-5" />
          </button>

          {/* Floating Favorite Button */}
          <button
            onClick={() => onToggleFavorite(project.id)}
            className="absolute top-3 left-3 p-1.5 rounded-full bg-white/90 hover:bg-white text-[#FFB400] shadow transition-transform active:scale-90 cursor-pointer"
          >
            <svg
              className="w-5 h-5 fill-current"
              viewBox="0 0 24 24"
              fill={isFavorite ? '#FFB400' : 'none'}
              stroke="#FFB400"
              strokeWidth="2"
            >
              <path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
            </svg>
          </button>

          {/* Floating Title and year */}
          <div className="absolute bottom-3 left-4 right-4 flex items-center justify-between text-white">
            <div className="flex items-center space-x-2.5">
              <div
                className="p-2 rounded-lg shadow"
                style={{ backgroundColor: project.color || '#10B981' }}
              >
                <img
                  src={project.icon || AppImages.svgEv}
                  alt="icon"
                  className="w-5 h-5 brightness-0 invert"
                />
              </div>
              <div>
                <h3 className="text-lg font-bold drop-shadow">{project.title}</h3>
                <span className="text-xs text-amber-300 font-medium flex items-center gap-1">
                  <Calendar className="w-3.5 h-3.5" /> {project.duration || '2025'}
                </span>
              </div>
            </div>
            {project.isCompleted && (
              <span className="bg-[#10B981]/90 text-white text-[11px] font-semibold px-2.5 py-0.5 rounded-full flex items-center gap-1">
                <CheckCircle2 className="w-3.5 h-3.5" /> Completed
              </span>
            )}
          </div>
        </div>

        {/* Modal Body */}
        <div className="p-5 space-y-4">
          {/* Quick Summary */}
          <div>
            <h4 className="text-xs uppercase tracking-wider text-slate-400 font-bold mb-1">
              Project Overview
            </h4>
            <p className="text-sm text-[#2B2B2B] leading-relaxed font-normal">
              {project.fullDescription}
            </p>
          </div>

          {/* Key Architectural Highlights */}
          <div className="bg-amber-50/60 rounded-xl p-3.5 border border-amber-200/60">
            <h4 className="text-xs font-bold text-amber-900 flex items-center gap-1.5 mb-2">
              <Layers className="w-4 h-4 text-[#FFB400]" /> Architecture & Design Highlights
            </h4>
            <ul className="text-xs text-slate-700 space-y-1.5 list-disc list-inside">
              <li>Separation of Presentation, Domain, and Data Layers (Clean Architecture)</li>
              <li>BLoC State Management pattern for reactive UI updates and testability</li>
              <li>Robust error handling, interceptors, and cached offline persistence</li>
              <li>Pixel-perfect responsive layout adaptable for phones, tablets & web</li>
            </ul>
          </div>

          {/* Technologies Used */}
          <div>
            <h4 className="text-xs uppercase tracking-wider text-slate-400 font-bold mb-2">
              Tech Stack & Libraries
            </h4>
            <div className="flex flex-wrap gap-1.5">
              {project.technologies.map((tech) => (
                <span
                  key={tech}
                  className="text-xs font-semibold px-2.5 py-1 rounded-md border"
                  style={{
                    backgroundColor: `${project.color || '#10B981'}15`,
                    color: project.color || '#10B981',
                    borderColor: `${project.color || '#10B981'}40`,
                  }}
                >
                  {tech}
                </span>
              ))}
            </div>
          </div>

          {/* Action Links */}
          <div className="pt-2 border-t border-slate-100 flex items-center justify-between gap-3">
            <div className="flex items-center space-x-2">
              {project.githubUrl && (
                <a
                  href={project.githubUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-1.5 px-3 py-2 text-xs font-bold rounded-lg border border-slate-300 hover:border-slate-800 text-slate-800 hover:bg-slate-900 hover:text-white transition-all cursor-pointer"
                >
                  <img src={AppImages.svgGithub} alt="GitHub" className="w-4 h-4 filter invert-[20%]" /> View Source
                </a>
              )}
              {project.liveDemoUrl && (
                <a
                  href={project.liveDemoUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-1.5 px-3 py-2 text-xs font-bold rounded-lg border border-[#FFB400] text-[#004643] hover:bg-[#FFB400] hover:text-white transition-all cursor-pointer"
                >
                  <ExternalLink className="w-4 h-4" /> Live Demo
                </a>
              )}
            </div>

            <button
              onClick={onClose}
              className="px-4 py-2 text-xs font-bold text-white rounded-lg shadow hover:opacity-90 transition-opacity cursor-pointer"
              style={{ backgroundColor: AppColors.appButtonColor }}
            >
              Close
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};
