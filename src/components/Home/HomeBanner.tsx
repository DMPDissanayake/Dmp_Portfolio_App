import React, { useEffect, useState } from 'react';
import Lottie from 'lottie-react';
import { AppColors, AppImages } from '../../utils/constants';

interface HomeBannerProps {
  onBannerClick?: () => void;
}

export const HomeBanner: React.FC<HomeBannerProps> = ({ onBannerClick }) => {
  const [animationData, setAnimationData] = useState<unknown | null>(null);

  useEffect(() => {
    fetch(AppImages.mADevelopment)
      .then((res) => {
        if (!res.ok) throw new Error('Failed to load lottie');
        return res.json();
      })
      .then((data) => setAnimationData(data))
      .catch((err) => {
        console.warn('Lottie animation fetch fallback:', err);
      });
  }, []);

  return (
    <div
      onClick={onBannerClick}
      className="relative w-full cursor-pointer overflow-hidden rounded-bl-[36px] border-b border-[#FFB400] bg-cover bg-center shadow-[4px_0px_24px_rgba(0,0,0,0.12)] transition-transform duration-200 active:scale-[0.99] hover:shadow-[4px_4px_28px_rgba(255,180,0,0.2)]"
      style={{
        backgroundImage: `url(${AppImages.homeBanner})`,
        backgroundColor: '#FFFDF6',
      }}
    >
      {/* Soft gradient overlay for contrast */}
      <div className="absolute inset-0 bg-gradient-to-r from-white/90 via-white/80 to-transparent pointer-events-none" />

      <div className="relative z-10 flex items-center justify-between px-4 sm:px-6 py-4 sm:py-5">
        {/* Left Column: Greeting, Role & Lottie */}
        <div className="flex-1 pr-2">
          <h1 className="text-base sm:text-lg font-bold leading-tight text-[#2B2B2B]">
            I’m DMP Dissanayake <br />
            <span style={{ color: AppColors.primaryColor }} className="font-extrabold">
              Flutter Mobile
            </span>{' '}
            Developer
          </h1>

          <div className="mt-2 h-[70px] w-[140px] flex items-center">
            {animationData ? (
              <Lottie
                animationData={animationData}
                loop={true}
                autoplay={true}
                className="h-full w-full object-contain"
              />
            ) : (
              <div className="flex items-center space-x-1.5 text-xs text-amber-700/80 font-medium bg-amber-50/80 px-2.5 py-1 rounded-md border border-amber-200/50">
                <span className="w-2 h-2 rounded-full bg-[#FFB400] animate-ping" />
                <span>Crafting fluid mobile apps</span>
              </div>
            )}
          </div>
        </div>

        {/* Right Column: Profile Avatar */}
        <div className="flex-shrink-0">
          <div className="relative group">
            <div className="absolute -inset-1 rounded-full bg-gradient-to-r from-[#FFB400] to-amber-300 opacity-60 blur-sm group-hover:opacity-100 transition-opacity" />
            <div className="relative h-[85px] w-[85px] sm:h-[95px] sm:w-[95px] overflow-hidden rounded-full border-2 border-white shadow-[0_4px_12px_rgba(0,0,0,0.18)] bg-white">
              <img
                src={AppImages.profileImage}
                alt="DMP Dissanayake"
                onError={(e) => {
                  // Fallback to Google Drive URL or local avatar
                  const target = e.currentTarget;
                  if (!target.src.includes('drive.google.com')) {
                    target.src = 'https://drive.google.com/uc?export=view&id=1II6ejrixHINsooflYoj9ywSikM-kL0XZ';
                  } else {
                    target.src = '/images/png/homeImage.png';
                  }
                }}
                className="h-full w-full object-cover object-top transition-transform duration-300 group-hover:scale-105"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
