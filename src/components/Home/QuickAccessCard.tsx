import React from 'react';
import { AppColors } from '../../utils/constants';

interface QuickAccessCardProps {
  name: string;
  icon: string;
  onTap: () => void;
  isActive?: boolean;
}

export const QuickAccessCard: React.FC<QuickAccessCardProps> = ({
  name,
  icon,
  onTap,
  isActive = false,
}) => {
  return (
    <button
      type="button"
      onClick={onTap}
      className={`group flex flex-col items-center justify-center p-1.5 sm:p-2 rounded-lg border transition-all duration-200 cursor-pointer text-center select-none ${
        isActive
          ? 'bg-amber-50 border-[#FFB400] ring-2 ring-[#FFB400]/40 scale-[1.03] shadow-[4px_0px_24px_rgba(255,180,0,0.25)]'
          : 'bg-white border-[#FFB400] hover:bg-amber-50/50 hover:shadow-[4px_0px_24px_rgba(0,0,0,0.14)] active:scale-95 shadow-[4px_0px_24px_rgba(0,0,0,0.12)]'
      }`}
      style={{
        minHeight: '62px',
      }}
    >
      <div className="flex items-center justify-center h-6 w-6 sm:h-7 sm:w-7 transition-transform group-hover:scale-110">
        <img
          src={icon}
          alt={name}
          className="h-full w-full object-contain filter"
          style={{
            // Apply amber tint if SVG is dark
            filter: 'invert(75%) sepia(85%) saturate(1200%) hue-rotate(5deg) brightness(102%) contrast(105%)',
          }}
          onError={(e) => {
            // If svg filter fails or standard image
            e.currentTarget.style.filter = 'none';
          }}
        />
      </div>
      <span
        className="mt-1 text-[10px] sm:text-[11px] font-semibold leading-tight text-[#2B2B2B] truncate max-w-full px-1"
        style={{ color: isActive ? AppColors.appButtonColor : AppColors.textBlackColor1 }}
      >
        {name}
      </span>
    </button>
  );
};
