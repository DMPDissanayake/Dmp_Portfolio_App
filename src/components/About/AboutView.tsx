import React, { useState } from 'react';
import { TabIndex } from '../../types';
import { AppColors, AppConstants, AppImages } from '../../utils/constants';
import {
  Mail,
  MapPin,
  FileText,
  Send,
  CheckCircle2,
  Code2,
  Cpu,
  Layers,
  ExternalLink,
} from 'lucide-react';

interface AboutViewProps {
  onChangeTab: (tab: TabIndex, data?: unknown) => void;
  data?: unknown;
}

export const AboutView: React.FC<AboutViewProps> = ({ onChangeTab }) => {
  const [formData, setFormData] = useState({ name: '', email: '', message: '' });
  const [isSent, setIsSent] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.name || !formData.email || !formData.message) return;
    setIsSent(true);
    setTimeout(() => {
      setFormData({ name: '', email: '', message: '' });
    }, 2000);
  };

  const handleDownloadCV = () => {
    // Generate a formatted summary CV document
    const cvText = `
DMP DISSANAYAKE
Flutter Mobile Developer | Software Engineer
Email: ${AppConstants.email}
GitHub: ${AppConstants.github}
Location: ${AppConstants.location}

PROFILE SUMMARY
${AppConstants.bio}

CORE SKILLS
- Flutter, Dart, BLoC Pattern, Clean Architecture
- REST API Integration (Dio/HTTP), Firebase Services
- Local Caching (Isar, SQLite), Responsive Multiplatform Design
- Git Version Control, CI/CD, Agile/Scrum

FEATURED PROJECTS
1. E-Commerce App (Flutter, Bloc, Clean Architecture, REST API, Firebase)
2. EV Charging Station Locator (Flutter, Bloc, Google Maps, Firebase)
3. Smart Energy Monitor & Telematics (Flutter, WebSockets, Charts)

EDUCATION
- BSc (Hons) in Software Engineering
- Higher National Diploma in Computing
`;
    const blob = new Blob([cvText], { type: 'text/plain;charset=utf-8' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = 'DMP_Dissanayake_CV.txt';
    link.click();
    URL.revokeObjectURL(url);
  };

  return (
    <div
      className="min-h-full w-full select-none"
      style={{
        background: 'linear-gradient(180deg, rgba(255, 180, 0, 0.4) 0%, #FFFFFF 100%)',
      }}
    >
      <div className="mx-auto max-w-4xl p-4 sm:p-6 pb-20 space-y-6">
        {/* Profile Card Header */}
        <div className="bg-white rounded-2xl border border-[#FFB400] p-5 sm:p-6 shadow-[4px_0_24px_rgba(0,0,0,0.08)]">
          <div className="flex flex-col sm:flex-row items-center sm:items-start gap-5">
            {/* Avatar */}
            <div className="relative group flex-shrink-0">
              <div className="absolute -inset-1 rounded-full bg-gradient-to-r from-[#FFB400] to-emerald-400 opacity-60 blur-xs" />
              <div className="relative h-28 w-28 sm:h-32 sm:w-32 rounded-full overflow-hidden border-3 border-white shadow-lg bg-white">
                <img
                  src={AppImages.profileImage}
                  alt={AppConstants.author}
                  onError={(e) => {
                    e.currentTarget.src = 'https://drive.google.com/uc?export=view&id=1II6ejrixHINsooflYoj9ywSikM-kL0XZ';
                  }}
                  className="h-full w-full object-cover object-top"
                />
              </div>
            </div>

            {/* Profile Info */}
            <div className="flex-1 text-center sm:text-left">
              <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">
                <div>
                  <h1 className="text-xl sm:text-2xl font-black text-[#2B2B2B]">
                    {AppConstants.author}
                  </h1>
                  <p
                    className="text-sm font-bold mt-0.5"
                    style={{ color: AppColors.primaryColor }}
                  >
                    {AppConstants.role}
                  </p>
                </div>

                {/* CV Action */}
                <button
                  type="button"
                  onClick={handleDownloadCV}
                  className="inline-flex items-center justify-center gap-1.5 px-4 py-2 rounded-lg text-xs font-bold text-white shadow hover:opacity-90 transition-all cursor-pointer self-center sm:self-auto"
                  style={{ backgroundColor: AppColors.appButtonColor }}
                >
                  <FileText className="w-4 h-4" /> Download CV / Resume
                </button>
              </div>

              <p className="mt-3 text-xs sm:text-sm text-[#2B2B2B]/80 leading-relaxed font-normal">
                {AppConstants.bio}
              </p>

              {/* Badges / Quick Meta */}
              <div className="mt-4 flex flex-wrap items-center justify-center sm:justify-start gap-2 text-xs">
                <span className="flex items-center gap-1 px-2.5 py-1 rounded-md bg-amber-50 border border-amber-200/80 text-[#004643] font-semibold">
                  <MapPin className="w-3.5 h-3.5 text-[#FFB400]" /> {AppConstants.location}
                </span>
                <a
                  href={`mailto:${AppConstants.email}`}
                  className="flex items-center gap-1 px-2.5 py-1 rounded-md bg-white border border-[#FFB400] text-[#2B2B2B] hover:bg-amber-50 font-medium transition-colors"
                >
                  <Mail className="w-3.5 h-3.5 text-[#FFB400]" /> {AppConstants.email}
                </a>
                <a
                  href={AppConstants.github}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-1.5 px-2.5 py-1 rounded-md bg-white border border-[#FFB400] text-[#2B2B2B] hover:bg-amber-50 font-medium transition-colors"
                >
                  <img
                    src={AppImages.svgGithub}
                    alt="GitHub"
                    className="w-3.5 h-3.5 filter invert-[75%] sepia-[85%] saturate-[1200%] hue-rotate-[5deg]"
                  />
                  <span>GitHub Profile</span>
                  <ExternalLink className="w-3 h-3 text-slate-400" />
                </a>
              </div>
            </div>
          </div>
        </div>

        {/* Pillars of Engineering */}
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
          <div className="p-4 bg-white rounded-xl border border-[#FFB400] shadow-[4px_0_20px_rgba(0,0,0,0.06)]">
            <div className="w-8 h-8 rounded-lg bg-amber-100 flex items-center justify-center text-[#FFB400] mb-2">
              <Code2 className="w-4 h-4 text-[#FFB400]" />
            </div>
            <h3 className="text-xs font-bold text-[#2B2B2B]">Clean Architecture</h3>
            <p className="mt-1 text-[11px] text-[#2B2B2B]/70 leading-snug">
              Separation of presentation, domain business rules, and external data sources for high maintainability.
            </p>
          </div>

          <div className="p-4 bg-white rounded-xl border border-[#FFB400] shadow-[4px_0_20px_rgba(0,0,0,0.06)]">
            <div className="w-8 h-8 rounded-lg bg-emerald-100 flex items-center justify-center text-emerald-600 mb-2">
              <Layers className="w-4 h-4" />
            </div>
            <h3 className="text-xs font-bold text-[#2B2B2B]">BLoC State Management</h3>
            <p className="mt-1 text-[11px] text-[#2B2B2B]/70 leading-snug">
              Reactive streams and immutable events ensuring predictable, scalable state transitions across screens.
            </p>
          </div>

          <div className="p-4 bg-white rounded-xl border border-[#FFB400] shadow-[4px_0_20px_rgba(0,0,0,0.06)]">
            <div className="w-8 h-8 rounded-lg bg-amber-100 flex items-center justify-center text-[#004643] mb-2">
              <Cpu className="w-4 h-4 text-[#004643]" />
            </div>
            <h3 className="text-xs font-bold text-[#2B2B2B]">High Performance</h3>
            <p className="mt-1 text-[11px] text-[#2B2B2B]/70 leading-snug">
              Optimized 60/120fps widget rendering, memory leak prevention, and cached offline-first architectures.
            </p>
          </div>
        </div>

        {/* Contact Message Form */}
        <div className="bg-white rounded-2xl border border-[#FFB400] p-5 sm:p-6 shadow-[4px_0_24px_rgba(0,0,0,0.08)]">
          <div className="flex items-center space-x-2 mb-2">
            <span className="p-1.5 rounded-lg bg-[#FFB400] text-white">
              <Mail className="w-4 h-4" />
            </span>
            <h2 className="text-sm font-bold text-[#2B2B2B]">Get in Touch with DMP</h2>
          </div>
          <p className="text-xs text-[#2B2B2B]/70 mb-4">
            Have a mobile app project, architectural inquiry, or collaboration opportunity? Send a direct message:
          </p>

          {isSent ? (
            <div className="p-4 bg-emerald-50 border border-emerald-200 rounded-xl text-center space-y-2 animate-in fade-in">
              <CheckCircle2 className="w-8 h-8 text-emerald-600 mx-auto" />
              <h3 className="text-sm font-bold text-emerald-900">Message Dispatched!</h3>
              <p className="text-xs text-emerald-700">
                Thank you for reaching out. DMP Dissanayake will respond to your email promptly.
              </p>
            </div>
          ) : (
            <form onSubmit={handleSubmit} className="space-y-3">
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <div>
                  <label className="block text-[11px] font-bold text-[#2B2B2B] mb-1">
                    Your Name
                  </label>
                  <input
                    type="text"
                    required
                    value={formData.name}
                    onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                    placeholder="e.g. John Doe"
                    className="w-full px-3 py-2 text-xs rounded-lg border border-[#FFB400] focus:ring-2 focus:ring-[#FFB400]/50 focus:outline-none"
                  />
                </div>
                <div>
                  <label className="block text-[11px] font-bold text-[#2B2B2B] mb-1">
                    Your Email
                  </label>
                  <input
                    type="email"
                    required
                    value={formData.email}
                    onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                    placeholder="e.g. john@example.com"
                    className="w-full px-3 py-2 text-xs rounded-lg border border-[#FFB400] focus:ring-2 focus:ring-[#FFB400]/50 focus:outline-none"
                  />
                </div>
              </div>

              <div>
                <label className="block text-[11px] font-bold text-[#2B2B2B] mb-1">
                  Message
                </label>
                <textarea
                  required
                  rows={3}
                  value={formData.message}
                  onChange={(e) => setFormData({ ...formData, message: e.target.value })}
                  placeholder="Tell me about your mobile application vision, features, or timeline..."
                  className="w-full px-3 py-2 text-xs rounded-lg border border-[#FFB400] focus:ring-2 focus:ring-[#FFB400]/50 focus:outline-none"
                />
              </div>

              <div className="flex justify-end">
                <button
                  type="submit"
                  className="flex items-center gap-1.5 px-5 py-2 rounded-lg text-xs font-bold text-white shadow hover:opacity-95 transition-opacity cursor-pointer"
                  style={{ backgroundColor: AppColors.appButtonColor }}
                >
                  <Send className="w-3.5 h-3.5" /> Send Message
                </button>
              </div>
            </form>
          )}
        </div>
      </div>
    </div>
  );
};
