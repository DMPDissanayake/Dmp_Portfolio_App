import React, { useState } from 'react';
import { TabIndex } from '../types';
import { AppColors, AppConstants, AppImages } from '../utils/constants';
import { HomeView } from './Home/HomeView';
import { SkillsView } from './Skills/SkillsView';
import { ProjectsView } from './Projects/ProjectsView';
import { EducationView } from './Education/EducationView';
import { AboutView } from './About/AboutView';

export const Dashboard: React.FC = () => {
  const [selectedTab, setSelectedTab] = useState<TabIndex>(0);
  const [tabData, setTabData] = useState<unknown>(null);

  const changeTab = (value: TabIndex, data?: unknown) => {
    setSelectedTab(value);
    setTabData(data ?? null);
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  const navItems = [
    { name: 'Home', icon: AppImages.svgHome, tabIndex: 0 as TabIndex },
    { name: 'Skills', icon: AppImages.svgSkills, tabIndex: 1 as TabIndex },
    { name: 'Projects', icon: AppImages.svgProject, tabIndex: 2 as TabIndex },
    { name: 'Education', icon: AppImages.svgEducation, tabIndex: 3 as TabIndex },
    { name: 'Profile', icon: AppImages.svgProfile, tabIndex: 4 as TabIndex },
  ];

  const renderBody = () => {
    switch (selectedTab) {
      case 0:
        return <HomeView onChangeTab={changeTab} data={tabData} />;
      case 1:
        return <SkillsView onChangeTab={changeTab} data={tabData} />;
      case 2:
        return <ProjectsView onChangeTab={changeTab} data={tabData} />;
      case 3:
        return <EducationView onChangeTab={changeTab} data={tabData} />;
      case 4:
        return <AboutView onChangeTab={changeTab} data={tabData} />;
      default:
        return <HomeView onChangeTab={changeTab} data={tabData} />;
    }
  };

  return (
    <div className="flex h-screen w-screen overflow-hidden bg-white">
      {/* Desktop / Tablet Sidebar (hidden on mobile < 768px) */}
      <aside className="hidden md:flex flex-col w-[250px] flex-shrink-0 bg-white border-r border-slate-200 shadow-sm z-20">
        {/* App Title Header */}
        <div className="p-5 pb-3 border-b border-slate-100 flex items-center space-x-2.5">
          <div className="h-9 w-9 rounded-lg bg-[#FFB400] flex items-center justify-center shadow-xs">
            <img
              src={AppImages.appLogo}
              alt="logo"
              className="h-6 w-6 object-contain"
              onError={(e) => {
                e.currentTarget.style.display = 'none';
              }}
            />
          </div>
          <div>
            <h1 className="text-lg font-black tracking-tight text-[#2B2B2B]">
              Portfolio
            </h1>
            <span className="text-[10px] font-bold text-[#FFB400] tracking-wider uppercase block">
              DMP Dissanayake
            </span>
          </div>
        </div>

        {/* Vertical Nav Items */}
        <div className="flex-1 py-4 px-3 space-y-1.5 overflow-y-auto">
          {navItems.map((item) => {
            const isSelected = selectedTab === item.tabIndex;
            return (
              <button
                key={item.name}
                type="button"
                onClick={() => changeTab(item.tabIndex)}
                className={`relative flex items-center w-full px-3.5 py-2.5 rounded-xl transition-all cursor-pointer text-left select-none ${
                  isSelected
                    ? 'bg-amber-50 text-[#FFB400] font-bold shadow-xs'
                    : 'text-[#484C52] hover:bg-slate-50 font-medium'
                }`}
              >
                {/* Active Indicator on Left */}
                <div
                  className={`absolute left-0 top-1/2 -translate-y-1/2 w-1.5 h-6 rounded-r-md transition-all ${
                    isSelected ? 'bg-[#FFB400]' : 'bg-transparent'
                  }`}
                />

                {/* Icon */}
                <div className="mr-3 h-5 w-5 flex items-center justify-center">
                  <img
                    src={item.icon}
                    alt={item.name}
                    className="h-5 w-5 object-contain"
                    style={{
                      filter: isSelected
                        ? 'invert(75%) sepia(85%) saturate(1200%) hue-rotate(5deg)'
                        : 'invert(30%) sepia(8%) saturate(500%) hue-rotate(180deg)',
                    }}
                  />
                </div>

                {/* Label */}
                <span className="text-sm font-semibold tracking-tight">{item.name}</span>
              </button>
            );
          })}
        </div>

        {/* Sidebar Footer info */}
        <div className="p-3 m-3 rounded-xl bg-amber-50/60 border border-amber-200/50 text-[11px] text-[#2B2B2B]/80">
          <p className="font-bold text-[#004643]">{AppConstants.role}</p>
          <p className="text-[10px] text-slate-500 mt-0.5">{AppConstants.location}</p>
        </div>
      </aside>

      {/* Main Content Area */}
      <div className="flex-1 flex flex-col h-full overflow-hidden relative">
        <main className="flex-1 overflow-y-auto">
          {renderBody()}
        </main>

        {/* Mobile Bottom Navigation Bar (visible only < 768px) */}
        <nav className="md:hidden flex-shrink-0 bg-white border-t border-slate-100 shadow-[0_-4px_24px_rgba(0,0,0,0.08)] z-30">
          <div className="flex items-center justify-around px-2 py-1 pb-2">
            {navItems.map((item) => {
              const isSelected = selectedTab === item.tabIndex;
              return (
                <button
                  key={item.name}
                  type="button"
                  onClick={() => changeTab(item.tabIndex)}
                  className="flex-1 flex flex-col items-center justify-center py-1 cursor-pointer select-none group"
                >
                  {/* Top Bar Indicator (matching Flutter AnimatedContainer) */}
                  <div
                    className={`h-[4px] w-[32px] rounded-full mb-1 transition-all duration-200 ${
                      isSelected ? 'bg-[#FFB400]' : 'bg-transparent'
                    }`}
                  />

                  {/* Icon */}
                  <div className="h-5 w-5 flex items-center justify-center">
                    <img
                      src={item.icon}
                      alt={item.name}
                      className="h-5 w-5 object-contain transition-transform group-hover:scale-105"
                      style={{
                        filter: isSelected
                          ? 'invert(75%) sepia(85%) saturate(1200%) hue-rotate(5deg)'
                          : 'invert(30%) sepia(8%) saturate(500%) hue-rotate(180deg)',
                      }}
                    />
                  </div>

                  {/* Text label */}
                  <span
                    className="mt-0.5 text-[10px] font-bold tracking-tight transition-colors"
                    style={{
                      color: isSelected ? AppColors.primaryColor : AppColors.bottomNavigationBarUnselectColor,
                    }}
                  >
                    {item.name}
                  </span>
                </button>
              );
            })}
          </div>
        </nav>
      </div>
    </div>
  );
};
