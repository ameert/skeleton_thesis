%---------------------------------------------------------------
% UPenn thesis style file modified by Alan Meert, 2013
% PhDthesis version 2 style file by Jakob Suckale, 2007
% based on CUEDthesis version 1 by Harish Bhanderi 2002
%---------------------------------------------------------------

%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Latex/Classes/PhDthesisPSnPDF}[2013/06/01 v1 UPenn PhD thesis class]

%:----------------- use book class as fundamental class ---------------------

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips]{book}
\else
   \LoadClass[pdftex]{book}
\fi

%make sure we can read your personal stylefile
\usepackage{Latex/StyleFiles/UserDefs}

%:-------------------------- packages for fancy things -----------------------
\usepackage{amssymb}
\usepackage{graphics} % for improved inclusion of graphics
%\usepackage{wrapfig} % to include figure with text wrapping around it
\usepackage[margin=10pt,font=small,labelfont=bf]{caption} % for improved layout of figure captions with extra margin, smaller font than text
\usepackage{fancyhdr} % for better header layout
\usepackage{eucal}
\usepackage[english]{babel}
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}
\usepackage[round, sort, numbers]{natbib}
\usepackage{ifthen}
\usepackage{multicol} % for pages with multiple text columns, e.g. References
\setlength{\columnsep}{20pt} 
\usepackage[numbib]{tocbibind} % correct page numbers for bib in TOC
%\usepackage{nextpage}
\usepackage{savesym}
\usepackage{wasysym} % contains many useful symbols, astro and otherwise...
\savesymbol{iint}
\savesymbol{iiint}
\usepackage{amsmath}
\restoresymbol{wasysym}{iint} 
\restoresymbol{wasysym}{iiint} 
\usepackage{chngcntr}
\counterwithout{footnote}{chapter}


% ---------------------------------------------------------------------------
       
% turn of those nasty overfull and underfull hboxes
\hbadness=10000
\hfuzz=50pt

% ---------------------------------------------------------------------------

%:-------------------------- PDF/PS setup -----------------------
\usepackage{ifpdf} 

\ifpdf
    \usepackage[ pdftex, plainpages = false, pdfpagelabels, 
                 pdfpagelayout = useoutlines,
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks=false,  % was true
                 filecolor = magenta,
                 linkcolor = brown,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 hyperindex = true,
                 %hyperfigures % not needed, figures should be referenced
                 ]{hyperref} 

    \DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf, .gif} %GIF doesn't work??
    \usepackage[pdftex]{graphicx}
    \pdfcompresslevel=9
    \graphicspath{{frontmatter/figures/PNG/}{frontmatter/figures/PDF/}{frontmatter/figures/}}
    
    \pdfinfo { /Title  (\ifx\MySubTitle\undefined
                           \@title
                         \else
                           \@title: \@SubTitle
                         \fi)
               /Creator (TeX)
               /Producer (pdfTeX)
               /Author (\@author)
               /CreationDate (D:YYYYMMDDhhmmss)  %format D:YYYYMMDDhhmmss
               /ModDate (D:YYYYMMDDhhmmss)
               /Subject (\@PDFSubject)
               /Keywords (\@PDFkeywords)}
    \pdfcatalog { /PageMode (/UseOutlines)
                  /OpenAction (fitbh)  }

\else
    \usepackage[ dvips, 
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks=false,
                 filecolor = magenta,
                 linkcolor = brown,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 hyperindex = true,
                 % hyperfigures % not needed, figures should be referenced 
                 ]{hyperref}

    \DeclareGraphicsExtensions{.eps, .ps}
    \usepackage{epsfig}
    \usepackage{graphicx}
    \graphicspath{{frontmatter/figures/EPS/}{frontmatter/figures/}}    
\fi

%:-------------------------- page layout -----------------------

%Letter settings
\ifpdf
   \pdfpageheight=11in
   \pdfpagewidth=8.5in
\else
   \setlength{\paperheight}{11in}
   \setlength{\paperwidth}{8.5in}
\fi

% Margins as specified in the UPenn Guidlines
% ------------------------------
\setlength{\hoffset}{0.00in}
\setlength{\voffset}{0.00in}
\setlength{\evensidemargin}{0.5in} 
\setlength{\oddsidemargin}{0.5in} 
\setlength{\topmargin}{0.20in}
\setlength{\headheight}{0.60in}
\setlength{\headsep}{0.40in}
\setlength{\textheight}{6.8in}
\setlength{\textwidth}{6.0in}
\setlength{\marginparsep}{0.05in}
\setlength{\marginparwidth}{.75in}
\setlength{\footskip}{1.0in}


%: section below defines fancy page layout options
% ------------------------------
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyhead[RO]{\bfseries\rightmark}
\fancyhead[LE]{\bfseries\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
%\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

%: ------------------------------------------------------------------------
% DECLARATIONS
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.
%: ------------------------------------------------------------------------

% An optional subtitle, NOTE: title is already defined by the book class
\def\SubTitle#1{\gdef\@SubTitle{#1}}

% PDF subject and keywords
\def\PDFSubject#1{\gdef\@PDFSubject{#1}}
\def\PDFkeywords#1{\gdef\@PDFkeywords{#1}}

% The name of the author (usually the person writing the document!!!)
\def\author[#1]#2{\gdef\@AuthorEmail{#1} \gdef\@author{#2}}

% The year and term the degree will be officially conferred
\def\DegreeDate#1{\gdef\@DegreeDate{#1}}

% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}

% The name of your college or department
\def\collegeordept#1{\gdef\@collegeordept{#1}}

% The name of your University
\def\university#1{\gdef\@university{#1}}

% Defining comittee members
\def\supervisor[#1]#2{\gdef\@supervisortitle{#1} \gdef\@supervisorname{#2}}
\def\gradchair[#1]#2{\gdef\@gradchairtitle{#1} \gdef\@gradchairname{#2}}
\def\firstcomittee[#1]#2{\gdef\@firstcomitteetitle{#1} \gdef\@firstcomittee{#2}}
\def\secondcomittee[#1]#2{\gdef\@secondcomitteetitle{#1} \gdef\@secondcomittee{#2}}
\def\thirdcomittee[#1]#2{\gdef\@thirdcomitteetitle{#1} \gdef\@thirdcomittee{#2}}
\def\fourthcomittee[#1]#2{\gdef\@fourthcomitteetitle{#1} \gdef\@fourthcomittee{#2}}
\def\fifthcomittee[#1]#2{\gdef\@fifthcomitteetitle{#1} \gdef\@fifthcomittee{#2}}
\def\sixthcomittee[#1]#2{\gdef\@sixthcomitteetitle{#1} \gdef\@sixthcomittee{#2}}

% Defining copyright statement
\def\CopyrightStatement#1{\gdef\@CopyrightStatement{#1}}


%: ------------------------------------------------------------------------
%: --------------------- alwayssingle environment -------------------------
%: ------------------------------------------------------------------------
% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}


%: ------------------------------------------------------------------------
%:-------------------------- title page layout -----------------------
%: ------------------------------------------------------------------------

% starts roman page numbering at chapter 1
\renewcommand{\thepage}{\roman{page}}

%define title page layout
\renewcommand{\maketitle}{%
\phantomsection\addcontentsline{toc}{chapter}{Title}
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
%  \null\vfill
  \begin{center}
    { \Large {\bfseries {
          \ifx\@SubTitle\undefined
             {\MakeUppercase{\@title}}
          \else
          {\MakeUppercase{\@title}: \\ \small{\MakeUppercase{\@SubTitle}}}
          \fi}} \par}
    {\href{mailto:\@AuthorEmail}{\@author} \par} 
{\large  \vspace*{3ex}
    {A DISSERTATION \par}
        \vspace*{0.5ex}
    {in \par}
        \vspace*{0.5ex}
    {\textbf{{\@collegeordept}} \par}
	\vspace*{0.5ex}
    {Presented to the Faculties of the {\@university} \par}
        \vspace*{0.5ex}
    {in \par}
        \vspace*{0.5ex}
    {Partial Fulfillment of the Requirements for the Degree of \par}
	\vspace*{0.5ex}
    {\textbf{\@degree} \par}
	\vspace*{2ex}
    {\@DegreeDate \par}
}%end large
  \end{center}
  \vspace*{1mm}
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lr}
\textbf{Supervisor of Dissertation} & \textbf{Graduate Group Chairperson}\\
\ & \ \\
\rule[-0.1in]{2in}{0.007in} & \rule[-0.1in]{2in}{0.007in} \\  
\@supervisorname & \@gradchairname  \\
{\scriptsize \@supervisortitle} & {\scriptsize \@gradchairtitle} \\
\end{tabular*} \vspace*{1mm} 
\hfill \\
\vspace*{1mm}
\noindent \textbf{Dissertation Comittee:}
\vspace*{1mm}

\ifx\@firstcomittee\undefined 
  \relax
\else
\noindent\@firstcomittee, {\small \@firstcomitteetitle}
\fi
\\
\ifx\@secondcomittee\undefined 
  \relax
\else
\@secondcomittee, {\small \@secondcomitteetitle}
\fi
\\
\ifx\@thirdcomittee\undefined 
  \relax
\else
\@thirdcomittee, {\small \@thirdcomitteetitle}
\fi
\\
\ifx\@fourthcomittee\undefined 
  \relax
\else
\@fourthcomittee, {\small \@fourthcomitteetitle}
\fi
\\
\ifx\@fifthcomittee\undefined 
  \relax
\else
\@fifthcomittee, {\small \@fifthcomitteetitle}
\fi
\\
\ifx\@sixthcomittee\undefined 
  \relax
\else
\@sixthcomittee, {\small \@sixthcomitteetitle}
\fi
\\
\end{alwayssingle}}

%: ------------------------------------------------------------------------
%: -------------------------------- COPYRIGHT -----------------------------
%: ------------------------------------------------------------------------
% The copyright gets its own page.

\def\makecopyright{%
\begin{alwayssingle}
\phantomsection\addcontentsline{toc}{chapter}{Copyright}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
\clearpage\null\vfill
\thispagestyle{empty}
\footnotesize\raggedright
  {\Large {\bfseries { 
          \ifx\@SubTitle\undefined
             {\MakeUppercase{\@title}}
          \else
          {\MakeUppercase{\@title}: \\ \small{\MakeUppercase{\@SubTitle}}}
          \fi}} \par}
  {\large  \vspace*{11pt}
  {{COPYRIGHT \copyright} \par}}
  {\large  \vspace*{11pt}
  {{\@DegreeDate} \par}}
  {\large  \vspace*{11pt}
  {\href{mailto:\@AuthorEmail}{\@author} \par}} 
  {\large  \vspace*{11pt}
  {{\@CopyrightStatement} \par}}
\vspace*{2\baselineskip}
\cleardoublepage
\end{alwayssingle}}

%: ------------------------------------------------------------------------
%: -------------------------- DEDICATION ----------------------------------
%: ------------------------------------------------------------------------
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
\phantomsection\addcontentsline{toc}{chapter}{Dedication}
\thispagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{center}}
{\end{center} \end{alwayssingle}}


%: ------------------------------------------------------------------------
%: -------------------------- ACKNOWLEDGEMENTS ----------------------------
%: ------------------------------------------------------------------------
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. 

\newenvironment{acknowledgements}
{\begin{alwayssingle}
\phantomsection\addcontentsline{toc}{chapter}{Acknowledgements}
\thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}


%: ------------------------------------------------------------------------
%: ----------------------------- ABSTRACT ---------------------------------
%: ------------------------------------------------------------------------
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. 

\newenvironment{abstracts}{%
\begin{alwayssingle} 
\phantomsection\addcontentsline{toc}{chapter}{Abstract}
\thispagestyle{plain}
  \begin{center}
  {\bfseries  \MakeUppercase{Abstract} \par}
    \vspace*{3ex}
  { \ifx\@SubTitle\undefined
    {\MakeUppercase{\@title}}
          \else
          {{\MakeUppercase{\@title}}: {\MakeUppercase{\@SubTitle}}}
          \fi \par}
    \vspace*{0.25ex}
  {\href{mailto:\@AuthorEmail}{\@author} \par} 
    \vspace*{0.25ex}
  {{\@supervisorname} \par}
  \end{center}
  \vspace{1ex}}
{\end{alwayssingle}}

%: ------------------------------------------------------------------------
%: ----------------------------- ABSTRACT SEPARATE ------------------------
%: ------------------------------------------------------------------------
%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} 
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {
          \ifx\@SubTitle\undefined
          {\MakeUppercase{\@title}}
          \else
          {{\MakeUppercase{\@title}}: {\MakeUppercase{\@SubTitle}}}
          \fi}} \par}
    {{\large \vspace*{1ex} \href{mailto:\@AuthorEmail}{\@author}} \par} 
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it A thesis submitted for the degree of} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@DegreeDate}}
  \end{center}}
{\end{alwayssingle}}

%: ------------------------------------------------------------------------
%: ----------------------------- PREFACE ----------------------------------
%: ------------------------------------------------------------------------

\newenvironment{preface} {\begin{alwayssingle}
\phantomsection\addcontentsline{toc}{chapter}{Preface}
\thispagestyle{plain}
  \begin{center}
  \vspace*{2ex}
  {\Large \bfseries  Preface}
  \end{center}
  \vspace{0.5ex}}
{\end{alwayssingle}}



%: ------------------------------------------------------------------------
%: ----------------------------- Part level chapters ----------------------
%: ------------------------------------------------------------------------
%Environment used to push chapters to Part level in mainmatter and Backmatter
%This environment allows the conclusion to be pushed out of
%the last part, for instance. The environment is not necessary if you 
%don't use parts in your text. 

\newenvironment{partChapter} {\renewcommand*{\toclevel@chapter}{-1}} 
{\renewcommand*{\toclevel@chapter}{0}} 

%: ------------------------------------------------------------------------
%: ---------------------- page numbers: roman+arabic ----------------------
%: ------------------------------------------------------------------------
{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

%: ------------------------------------------------------------------------
%:-------------------------- Glossary/Abbrev./Symbols ---------------------
%: ------------------------------------------------------------------------

\usepackage[intoc]{nomencl} % load nomencl extension; include in TOC
\nomrefpage % to include page numbers after abbrevations
\renewcommand{\nomname}{Glossary} % rename nomenclature
\renewcommand{\nomlabel}[1]{\textbf{#1}} % make abbreviations bold
\makenomenclature % used to be \makeglossary
\newcommand{\g}{\footnote{For all abbreviations see the glossary on page \pageref{nom}.}} % type "\g" to refer to glossary

% used to be for sorting into categories:
\renewcommand\nomgroup[1]{%
  \ifthenelse{\equal{#1}{A}}{%
   \item[\textbf{Roman Symbols}] }{%             A - Roman
    \ifthenelse{\equal{#1}{G}}{%
     \item[\textbf{Greek Symbols}]}{%             G - Greek
      \ifthenelse{\equal{#1}{R}}{%
        \item[\textbf{Superscripts}]}{%              R - Superscripts
          \ifthenelse{\equal{#1}{S}}{%
           \item[\textbf{Subscripts}]}{{%             S - Subscripts
	    \ifthenelse{\equal{#1}{X}}{%
	     \item[\textbf{Other Symbols}]}{{%    X - Other Symbols
	    \ifthenelse{\equal{#1}{Z}}{%
	     \item[\textbf{Acronyms}]}%              Z - Acronyms
              			{{}}}}}}}}}}

%: ------------------------------------------------------------------------
%: --------------------------------- Index --------------------------------
%: ------------------------------------------------------------------------
\usepackage{makeidx}
\makeindex

%: ------------------------------------------------------------------------
%:------------------------------- Appendicies -----------------------------
%: ------------------------------------------------------------------------
\usepackage[page, title, header]{appendix}
