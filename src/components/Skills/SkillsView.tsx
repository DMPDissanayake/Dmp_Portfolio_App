import React, { useState, useEffect } from 'react';
import { TabIndex } from '../../types';
import {
  allDetailedSkills,
  AppColors,
  AppImages,
  initialSkills,
} from '../../utils/constants';
import { PremiumSkillLineChart } from '../Home/PremiumSkillLineChart';
import { Search, Sparkles } from 'lucide-react';

interface SkillsViewProps {
  onChangeTab: (tab: TabIndex, data?: unknown) => void;
  data?: unknown;
}

type SkillCategory = 'All' | 'Technical' | 'Professional' | 'Achievements' | 'Learning';

export const SkillsView: React.FC<SkillsViewProps> = ({ data }) => {
  const [selectedCategory, setSelectedCategory] = useState<SkillCategory>('All');
  const [searchQuery, setSearchQuery] = useState('');

  // Handle incoming category from quick access navigation
  useEffect(() => {
    if (data && typeof data === 'object' && 'category' in data) {
      const incomingCat = (data as { category: string }).category as SkillCategory;
      if (['Technical', 'Professional', 'Achievements', 'Learning'].includes(incomingCat)) {
        setSelectedCategory(incomingCat);
      }
    }
  }, [data]);

  const categories: { key: SkillCategory; label: string; icon: string }[] = [
    { key: 'All', label: 'All Skills', icon: AppImages.svgSkills },
    { key: 'Technical', label: 'Technical', icon: AppImages.svgTechnical },
    { key: 'Professional', label: 'Professional', icon: AppImages.svgProfessional },
    { key: 'Achievements', label: 'Achievements', icon: AppImages.svgTrophy },
    { key: 'Learning', label: 'Learning', icon: AppImages.svgLearning },
  ];

  const filteredSkills = allDetailedSkills.filter((skill) => {
    const matchesCategory = selectedCategory === 'All' || skill.category === selectedCategory;
    const matchesSearch =
      skill.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      (skill.description && skill.description.toLowerCase().includes(searchQuery.toLowerCase()));
    return matchesCategory && matchesSearch;
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
                <Sparkles className="w-4 h-4" />
              </span>
              <h1 className="text-xl font-extrabold text-[#2B2B2B]">Skills & Expertise</h1>
            </div>
            <p className="mt-1 text-xs text-[#2B2B2B]/70">
              Technical proficiencies, architectural patterns, and professional capabilities
            </p>
          </div>

          {/* Search box */}
          <div className="relative w-full sm:w-64">
            <Search className="absolute left-3 top-2.5 h-4 w-4 text-[#2B2B2B]/40" />
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="Search skills..."
              className="w-full pl-9 pr-3 py-2 text-xs rounded-lg border border-[#FFB400] bg-white placeholder-[#2B2B2B]/40 focus:outline-none focus:ring-2 focus:ring-[#FFB400]/50 shadow-xs"
            />
          </div>
        </div>

        {/* Category Pills */}
        <div className="mt-4 flex gap-2 overflow-x-auto pb-1 scrollbar-none">
          {categories.map((cat) => {
            const isSelected = selectedCategory === cat.key;
            return (
              <button
                key={cat.key}
                type="button"
                onClick={() => setSelectedCategory(cat.key)}
                className={`flex items-center space-x-1.5 px-3 py-1.5 rounded-lg text-xs font-bold transition-all whitespace-nowrap cursor-pointer shadow-xs ${
                  isSelected
                    ? 'bg-[#004643] text-white shadow-md'
                    : 'bg-white border border-[#FFB400] text-[#2B2B2B] hover:bg-amber-50'
                }`}
              >
                <span>{cat.label}</span>
              </button>
            );
          })}
        </div>

        {/* Line Chart Preview for Technical Overview */}
        {(selectedCategory === 'All' || selectedCategory === 'Technical') && !searchQuery && (
          <div className="mt-5">
            <h2 className="text-xs font-bold uppercase tracking-wider text-slate-500 mb-2">
              Core Technical Competency Distribution
            </h2>
            <PremiumSkillLineChart skills={initialSkills} />
          </div>
        )}

        {/* Skills Grid */}
        <div className="mt-6">
          <div className="flex items-center justify-between mb-3">
            <h2 className="text-xs font-bold uppercase tracking-wider text-slate-500">
              {selectedCategory} Competencies ({filteredSkills.length})
            </h2>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            {filteredSkills.map((skill) => (
              <div
                key={skill.name}
                className="group p-3.5 bg-white rounded-xl border border-[#FFB400] shadow-[4px_0_20px_rgba(0,0,0,0.06)] hover:shadow-[4px_4px_24px_rgba(255,180,0,0.2)] transition-all"
              >
                <div className="flex items-center justify-between">
                  <div className="flex items-center space-x-2">
                    <span className="w-2 h-2 rounded-full bg-[#FFB400]" />
                    <h3 className="text-sm font-bold text-[#2B2B2B] group-hover:text-[#004643] transition-colors">
                      {skill.name}
                    </h3>
                  </div>
                  <span className="text-xs font-extrabold px-2 py-0.5 rounded-md bg-amber-50 border border-amber-200 text-[#004643]">
                    {skill.percentage}%
                  </span>
                </div>

                {skill.description && (
                  <p className="mt-1.5 text-[11px] text-[#2B2B2B]/70 leading-relaxed font-normal">
                    {skill.description}
                  </p>
                )}

                {/* Progress bar */}
                <div className="mt-3 w-full bg-slate-100 rounded-full h-2 overflow-hidden border border-slate-200/50">
                  <div
                    className="h-full rounded-full transition-all duration-700 ease-out"
                    style={{
                      width: `${skill.percentage}%`,
                      background: 'linear-gradient(90deg, #FFB400 0%, #10B981 100%)',
                    }}
                  />
                </div>
              </div>
            ))}
          </div>

          {filteredSkills.length === 0 && (
            <div className="text-center py-12 bg-white rounded-xl border border-dashed border-[#FFB400]">
              <p className="text-sm font-semibold text-[#2B2B2B]/60">
                No skills matched your search "{searchQuery}"
              </p>
              <button
                onClick={() => {
                  setSearchQuery('');
                  setSelectedCategory('All');
                }}
                className="mt-2 text-xs font-bold text-[#004643] underline cursor-pointer"
              >
                Clear filters
              </button>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};
