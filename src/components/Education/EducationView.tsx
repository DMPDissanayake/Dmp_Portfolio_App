import React from 'react';
import { TabIndex } from '../../types';
import { AppColors } from '../../utils/constants';
import { GraduationCap, Award, Calendar, MapPin, CheckCircle, BookOpen } from 'lucide-react';

interface EducationViewProps {
  onChangeTab: (tab: TabIndex, data?: unknown) => void;
  data?: unknown;
}

interface EducationItem {
  id: string;
  degree: string;
  institution: string;
  location: string;
  period: string;
  description: string;
  highlights: string[];
  status: 'Completed' | 'In Progress';
}

interface CertificationItem {
  id: string;
  title: string;
  issuer: string;
  date: string;
  credentialId?: string;
}

export const EducationView: React.FC<EducationViewProps> = () => {
  const educationList: EducationItem[] = [
    {
      id: '1',
      degree: 'BSc (Hons) in Software Engineering',
      institution: 'Faculty of Computing & Technology',
      location: 'Sri Lanka',
      period: '2021 – 2025',
      description:
        'Focused on Mobile Application Engineering, Software Architecture, Distributed Systems, Object-Oriented Analysis & Design, and Cloud Computing.',
      highlights: [
        'Specialized research in Cross-Platform Mobile State Management & Clean Architecture',
        'Dean’s List recognition for excellence in Mobile Development coursework',
        'Final Year Capstone: Real-Time Mobile Telematics & Fleet Monitoring Solution in Flutter',
      ],
      status: 'Completed',
    },
    {
      id: '2',
      degree: 'Higher National Diploma in Computing & Systems Development',
      institution: 'National Institute of Information Technology',
      location: 'Sri Lanka',
      period: '2019 – 2021',
      description:
        'Intensive foundation in data structures, algorithms, relational database design (SQL), network communications, and software project management.',
      highlights: [
        'Graduated with Distinction in Database Systems and Java/OOP Programming',
        'Built enterprise desktop and mobile database prototypes',
      ],
      status: 'Completed',
    },
  ];

  const certifications: CertificationItem[] = [
    {
      id: 'c1',
      title: 'Flutter & Dart Cross-Platform Mobile Development',
      issuer: 'Udemy / Angela Yu & Flutter Team',
      date: '2023',
      credentialId: 'UC-FLUTTER-9921',
    },
    {
      id: 'c2',
      title: 'Clean Architecture & Test-Driven Development (TDD)',
      issuer: 'Reso Coder Mobile Architecture Masterclass',
      date: '2024',
      credentialId: 'RC-ARCH-7712',
    },
    {
      id: 'c3',
      title: 'BLoC State Management Mastery for Production Apps',
      issuer: 'Felix Angelov / Open Source Community',
      date: '2024',
      credentialId: 'BLOC-ADV-440',
    },
    {
      id: 'c4',
      title: 'REST API Design, Dio Interceptors & JSON Security',
      issuer: 'Coursera / Mobile Security Track',
      date: '2023',
      credentialId: 'SEC-REST-2023',
    },
  ];

  return (
    <div
      className="min-h-full w-full select-none"
      style={{
        background: 'linear-gradient(180deg, rgba(255, 180, 0, 0.4) 0%, #FFFFFF 100%)',
      }}
    >
      <div className="mx-auto max-w-4xl p-4 sm:p-6 pb-20 space-y-6">
        {/* Header */}
        <div>
          <div className="flex items-center space-x-2">
            <span className="p-1.5 rounded-lg bg-[#FFB400] text-white shadow-xs">
              <GraduationCap className="w-4 h-4" />
            </span>
            <h1 className="text-xl font-extrabold text-[#2B2B2B]">Education & Qualifications</h1>
          </div>
          <p className="mt-1 text-xs text-[#2B2B2B]/70">
            Academic foundation, specialized training in mobile architecture, and continuous technical learning
          </p>
        </div>

        {/* Education Timeline */}
        <section className="space-y-4">
          <h2 className="text-xs font-bold uppercase tracking-wider text-slate-500 flex items-center gap-1.5">
            <BookOpen className="w-3.5 h-3.5 text-[#FFB400]" /> Academic Degrees
          </h2>

          <div className="relative pl-6 sm:pl-8 border-l-2 border-[#FFB400]/40 space-y-6">
            {educationList.map((edu) => (
              <div key={edu.id} className="relative group">
                {/* Timeline node */}
                <span className="absolute -left-[31px] sm:-left-[39px] top-1.5 flex h-4 w-4 items-center justify-center rounded-full bg-white border-2 border-[#FFB400] ring-4 ring-amber-50 group-hover:bg-[#FFB400] transition-colors" />

                {/* Card */}
                <div className="bg-white rounded-xl p-4 sm:p-5 border border-[#FFB400] shadow-[4px_0_24px_rgba(0,0,0,0.06)] hover:shadow-[4px_4px_28px_rgba(255,180,0,0.18)] transition-all">
                  <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-1">
                    <h3 className="text-sm sm:text-base font-bold text-[#2B2B2B]">
                      {edu.degree}
                    </h3>
                    <span className="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-emerald-50 text-emerald-700 border border-emerald-200 self-start sm:self-auto flex items-center gap-1">
                      <CheckCircle className="w-3 h-3" /> {edu.status}
                    </span>
                  </div>

                  <div className="mt-1 flex flex-wrap items-center gap-x-4 gap-y-1 text-xs text-[#2B2B2B]/70">
                    <span className="font-semibold text-[#004643]">{edu.institution}</span>
                    <span className="flex items-center gap-1">
                      <MapPin className="w-3 h-3 text-[#FFB400]" /> {edu.location}
                    </span>
                    <span className="flex items-center gap-1 font-medium text-amber-700">
                      <Calendar className="w-3 h-3" /> {edu.period}
                    </span>
                  </div>

                  <p className="mt-2 text-xs text-[#2B2B2B]/80 leading-relaxed font-normal">
                    {edu.description}
                  </p>

                  <div className="mt-3 pt-3 border-t border-slate-100">
                    <h4 className="text-[11px] font-bold text-slate-700 uppercase tracking-wide mb-1.5">
                      Key Highlights & Accomplishments:
                    </h4>
                    <ul className="space-y-1 text-xs text-[#2B2B2B]/75">
                      {edu.highlights.map((hl, idx) => (
                        <li key={idx} className="flex items-start gap-1.5">
                          <span className="text-[#FFB400] font-bold">•</span>
                          <span>{hl}</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Certifications & Badges */}
        <section className="space-y-3">
          <h2 className="text-xs font-bold uppercase tracking-wider text-slate-500 flex items-center gap-1.5">
            <Award className="w-3.5 h-3.5 text-[#FFB400]" /> Professional Certifications & Specializations
          </h2>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            {certifications.map((cert) => (
              <div
                key={cert.id}
                className="bg-white rounded-xl p-3.5 border border-[#FFB400] shadow-[4px_0_20px_rgba(0,0,0,0.06)] hover:shadow-[4px_4px_24px_rgba(255,180,0,0.18)] transition-all flex items-start gap-3"
              >
                <div className="p-2 rounded-lg bg-amber-50 border border-amber-200 text-[#004643] flex-shrink-0">
                  <Award className="w-5 h-5 text-[#FFB400]" />
                </div>
                <div className="flex-1 min-w-0">
                  <h4 className="text-xs font-bold text-[#2B2B2B] leading-snug">
                    {cert.title}
                  </h4>
                  <p className="text-[11px] text-[#004643] font-medium mt-0.5">
                    {cert.issuer}
                  </p>
                  <div className="mt-1 flex items-center justify-between text-[10px] text-slate-400">
                    <span>Issued {cert.date}</span>
                    {cert.credentialId && (
                      <span className="font-mono text-[9px] text-[#FFB400] font-bold">
                        {cert.credentialId}
                      </span>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </section>
      </div>
    </div>
  );
};
