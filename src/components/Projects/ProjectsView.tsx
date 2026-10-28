import React, { useState } from 'react';
import { ProjectEntity, TabIndex } from '../../types';
import { initialProjects, AppColors, AppImages } from '../../utils/constants';
import { ProjectCard } from './ProjectCard';
import { ProjectDetailsModal } from './ProjectDetailsModal';
import { FolderGit2, Search, Heart, Sparkles } from 'lucide-react';

interface ProjectsViewProps {
  onChangeTab: (tab: TabIndex, data?: unknown) => void;
  data?: unknown;
}

export const ProjectsView: React.FC<ProjectsViewProps> = () => {
  const [projects] = useState<ProjectEntity[]>(initialProjects);
  const [selectedProject, setSelectedProject] = useState<ProjectEntity | null>(null);
  const [favoriteIds, setFavoriteIds] = useState<Set<string>>(new Set(['1', '2']));
  const [searchQuery, setSearchQuery] = useState('');
  const [filterType, setFilterType] = useState<'All' | 'Featured' | 'Favorites'>('All');

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

  const filteredProjects = projects.filter((proj) => {
    const matchesSearch =
      proj.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
      proj.fullDescription.toLowerCase().includes(searchQuery.toLowerCase()) ||
      proj.technologies.some((t) => t.toLowerCase().includes(searchQuery.toLowerCase()));

    if (!matchesSearch) return false;

    if (filterType === 'Featured') return proj.isFeatured;
    if (filterType === 'Favorites') return favoriteIds.has(proj.id);
    return true;
  });

  return (
    <div
      className="min-h-full w-full select-none"
      style={{
        background: 'linear-gradient(180deg, rgba(255, 180, 0, 0.4) 0%, #FFFFFF 100%)',
      }}
    >
      <div className="mx-auto max-w-4xl p-4 sm:p-6 pb-20">
        {/* Header */}
        <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
          <div>
            <div className="flex items-center space-x-2">
              <span className="p-1.5 rounded-lg bg-[#FFB400] text-white shadow-xs">
                <FolderGit2 className="w-4 h-4" />
              </span>
              <h1 className="text-xl font-extrabold text-[#2B2B2B]">Featured Projects</h1>
            </div>
            <p className="mt-1 text-xs text-[#2B2B2B]/70">
              Selected production and prototype mobile applications built with Flutter & Clean Architecture
            </p>
          </div>

          {/* Search bar */}
          <div className="relative w-full sm:w-64">
            <Search className="absolute left-3 top-2.5 h-4 w-4 text-[#2B2B2B]/40" />
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="Search apps or stack..."
              className="w-full pl-9 pr-3 py-2 text-xs rounded-lg border border-[#FFB400] bg-white placeholder-[#2B2B2B]/40 focus:outline-none focus:ring-2 focus:ring-[#FFB400]/50 shadow-xs"
            />
          </div>
        </div>

        {/* Filter Tabs */}
        <div className="mt-4 flex items-center space-x-2">
          {(['All', 'Featured', 'Favorites'] as const).map((type) => {
            const isSelected = filterType === type;
            return (
              <button
                key={type}
                type="button"
                onClick={() => setFilterType(type)}
                className={`flex items-center space-x-1.5 px-3 py-1.5 rounded-lg text-xs font-bold transition-all cursor-pointer shadow-xs ${
                  isSelected
                    ? 'bg-[#004643] text-white shadow-md'
                    : 'bg-white border border-[#FFB400] text-[#2B2B2B] hover:bg-amber-50'
                }`}
              >
                {type === 'Favorites' && <Heart className="w-3.5 h-3.5 fill-current text-rose-400" />}
                {type === 'Featured' && <Sparkles className="w-3.5 h-3.5 text-amber-400" />}
                <span>{type}</span>
                {type === 'Favorites' && (
                  <span className="ml-1 px-1.5 py-0.2 rounded-full text-[10px] bg-white/20">
                    {favoriteIds.size}
                  </span>
                )}
              </button>
            );
          })}
        </div>

        {/* Projects Grid */}
        <div className="mt-6 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
          {filteredProjects.map((project) => (
            <ProjectCard
              key={project.id}
              project={project}
              compact={false}
              isFavorite={favoriteIds.has(project.id)}
              onToggleFavorite={handleToggleFavorite}
              onSelect={(p) => setSelectedProject(p)}
            />
          ))}
        </div>

        {filteredProjects.length === 0 && (
          <div className="text-center py-16 bg-white rounded-xl border border-dashed border-[#FFB400] mt-6">
            <p className="text-sm font-semibold text-[#2B2B2B]/70">
              No projects found for the current criteria.
            </p>
            <button
              onClick={() => {
                setFilterType('All');
                setSearchQuery('');
              }}
              className="mt-2 text-xs font-bold text-[#004643] underline cursor-pointer"
            >
              Reset filters
            </button>
          </div>
        )}
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
