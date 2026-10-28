import React, { useState, useEffect } from 'react';
import { SkillData } from '../../types';
import { AppColors } from '../../utils/constants';

interface PremiumSkillLineChartProps {
  skills: SkillData[];
  lineColor?: string;
  gradientColors?: string[];
}

export const PremiumSkillLineChart: React.FC<PremiumSkillLineChartProps> = ({
  skills,
  lineColor = AppColors.primaryColor,
}) => {
  const [hoveredIndex, setHoveredIndex] = useState<number | null>(null);
  const [animationProgress, setAnimationProgress] = useState(0);

  useEffect(() => {
    // 1500ms animation curve matching original SingleTickerProviderStateMixin
    const startTime = performance.now();
    const duration = 1200;

    let frameId: number;
    const animate = (currentTime: number) => {
      const elapsed = currentTime - startTime;
      const t = Math.min(1, elapsed / duration);
      // easeInOutCubic
      const ease = t < 0.5 ? 4 * t * t * t : 1 - Math.pow(-2 * t + 2, 3) / 2;
      setAnimationProgress(ease);

      if (t < 1) {
        frameId = requestAnimationFrame(animate);
      }
    };

    frameId = requestAnimationFrame(animate);
    return () => cancelAnimationFrame(frameId);
  }, [skills]);

  // Dimensions for coordinate mapping
  const width = 500;
  const height = 180;
  const paddingLeft = 50;
  const paddingRight = 30;
  const paddingTop = 20;
  const paddingBottom = 55;

  const chartWidth = width - paddingLeft - paddingRight;
  const chartHeight = height - paddingTop - paddingBottom;

  const yMin = 0;
  const yMax = 100;

  // Compute points
  const points = skills.map((skill, index) => {
    const x = paddingLeft + (index / (skills.length - 1)) * chartWidth;
    const animatedValue = skill.percentage * animationProgress;
    const y = paddingTop + chartHeight - (animatedValue / yMax) * chartHeight;
    return { x, y, skill, index };
  });

  // Generate smooth SVG curve using Catmull-Rom or cubic Bezier
  const getSmoothPath = (pts: { x: number; y: number }[]) => {
    if (pts.length === 0) return '';
    if (pts.length === 1) return `M ${pts[0].x} ${pts[0].y}`;

    let path = `M ${pts[0].x} ${pts[0].y}`;
    for (let i = 0; i < pts.length - 1; i++) {
      const current = pts[i];
      const next = pts[i + 1];
      const controlX = (current.x + next.x) / 2;
      path += ` C ${controlX} ${current.y}, ${controlX} ${next.y}, ${next.x} ${next.y}`;
    }
    return path;
  };

  const linePath = getSmoothPath(points);
  const baselineY = paddingTop + chartHeight;
  const areaPath = points.length > 0
    ? `${linePath} L ${points[points.length - 1].x} ${baselineY} L ${points[0].x} ${baselineY} Z`
    : '';

  const yAxisTicks = [0, 20, 40, 60, 80, 100];

  return (
    <div className="w-full bg-white rounded-xl border border-[#FFB400] p-3 sm:p-4 shadow-[4px_0px_24px_rgba(0,0,0,0.08)]">
      <div className="relative w-full aspect-[2.6/1] sm:aspect-[2.9/1] min-h-[175px]">
        <svg
          viewBox={`0 0 ${width} ${height}`}
          className="w-full h-full overflow-visible select-none"
        >
          <defs>
            <linearGradient id="skillAreaGradient" x1="0" y1="0" x2="0" y2="1">
              <stop offset="0%" stopColor={lineColor} stopOpacity="0.45" />
              <stop offset="95%" stopColor={lineColor} stopOpacity="0.0" />
            </linearGradient>
            <filter id="dotShadow" x="-20%" y="-20%" width="140%" height="140%">
              <feDropShadow dx="0" dy="2" stdDeviation="2" floodOpacity="0.25" />
            </filter>
          </defs>

          {/* Horizontal Grid lines and Left Ticks */}
          {yAxisTicks.map((val) => {
            const y = paddingTop + chartHeight - (val / yMax) * chartHeight;
            return (
              <g key={val}>
                <line
                  x1={paddingLeft}
                  y1={y}
                  x2={width - paddingRight}
                  y2={y}
                  stroke="#000000"
                  strokeOpacity="0.06"
                  strokeWidth="1"
                />
                <text
                  x={paddingLeft - 10}
                  y={y + 4}
                  textAnchor="end"
                  className="fill-[#64748b] text-[11px] font-medium"
                >
                  {val}%
                </text>
              </g>
            );
          })}

          {/* Gradient Area Below Curve */}
          {areaPath && (
            <path d={areaPath} fill="url(#skillAreaGradient)" />
          )}

          {/* Smooth Line */}
          {linePath && (
            <path
              d={linePath}
              fill="none"
              stroke={lineColor}
              strokeWidth="4"
              strokeLinecap="round"
              strokeLinejoin="round"
            />
          )}

          {/* Data Points (Dots) and Bottom Labels */}
          {points.map((pt, idx) => {
            const isHovered = hoveredIndex === idx;
            return (
              <g
                key={pt.skill.name}
                className="cursor-pointer"
                onMouseEnter={() => setHoveredIndex(idx)}
                onMouseLeave={() => setHoveredIndex(null)}
              >
                {/* Invisible hover hitbox */}
                <circle cx={pt.x} cy={pt.y} r="18" fill="transparent" />

                {/* Animated Dot */}
                <circle
                  cx={pt.x}
                  cy={pt.y}
                  r={isHovered ? 7.5 : 6}
                  fill={lineColor}
                  stroke="#ffffff"
                  strokeWidth="2.5"
                  filter="url(#dotShadow)"
                  className="transition-all duration-200"
                />

                {/* Bottom title widget (rotated -45 degrees) */}
                <g transform={`translate(${pt.x}, ${baselineY + 12})`}>
                  <text
                    transform="rotate(-40)"
                    textAnchor="end"
                    className="fill-[#2B2B2B]/75 text-[10.5px] sm:text-[11px] font-medium transition-colors hover:fill-[#FFB400]"
                  >
                    {pt.skill.name}
                  </text>
                </g>
              </g>
            );
          })}
        </svg>

        {/* Hover Tooltip Overlay */}
        {hoveredIndex !== null && points[hoveredIndex] && (
          <div
            className="absolute pointer-events-none transform -translate-x-1/2 -translate-y-full transition-transform duration-75"
            style={{
              left: `${(points[hoveredIndex].x / width) * 100}%`,
              top: `${(points[hoveredIndex].y / height) * 100 - 4}%`,
            }}
          >
            <div className="bg-[#0f172a] text-white text-xs font-bold px-2.5 py-1 rounded shadow-lg whitespace-nowrap border border-slate-700">
              <span className="text-[#FFB400] font-semibold">{points[hoveredIndex].skill.name}</span>: {points[hoveredIndex].skill.percentage}%
              <div className="w-2 h-2 bg-[#0f172a] rotate-45 mx-auto -mb-1 mt-0.5 border-r border-b border-slate-700"></div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};
