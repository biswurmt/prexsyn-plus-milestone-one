\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techreport}[Tech Report Template]



%%Preliminary definitions, needed by the options
\newcommand{\headlinecolor}{\normalcolor}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}

% \DeclareOption{onecolumn}{\OptionNotUsed}
% \DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
% \DeclareOption{lab}{\newcommand\myworries[1]{\textcolor{red}{test}}}
% \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% \ProcessOptions\relax


\LoadClass[11pt]{article}

\RequirePackage[authoryear, sort&compress, round]{natbib} 
\RequirePackage[colorlinks=true, citecolor=violet, linkcolor=black]{hyperref}


\RequirePackage{amsmath}
\RequirePackage{amsthm}  
\RequirePackage{amssymb}
\RequirePackage{color}
\RequirePackage{mathtools} 
\RequirePackage{multirow}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage[labelsep=colon,font={small,sf},labelfont=bf,skip=0.3em]{caption}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{booktabs}
\RequirePackage{xcolor}
\RequirePackage{adjustbox}
\RequirePackage{subcaption}
\RequirePackage{tabularx}
\RequirePackage{svg}
\RequirePackage{wrapfig}
\RequirePackage{titlesec}
\RequirePackage{datetime}
\RequirePackage{datetime2}
\RequirePackage{parskip}
\RequirePackage{float}

% Font packages
\RequirePackage[bitstream-charter]{mathdesign}
\RequirePackage[book]{FiraSans}
\RequirePackage{sourcecodepro}
\RequirePackage[T1]{fontenc}

\titlelabel{\thetitle. }

%%Body of the class, most of the declarations appear here.
\renewcommand*{\thefootnote}{\fnsymbol{footnote}}

\topmargin -1.0cm
\oddsidemargin -0.2cm
\textwidth 17cm 
\textheight 22cm
\footskip 1cm
\setlength{\headheight}{21.25012pt}


\renewenvironment{abstract}
 {%
  \list{}{%
    \setlength{\leftmargin}{0mm}% <---------- CHANGE HERE
    \setlength{\rightmargin}{\leftmargin}%
  }%
  \item\textbf{Abstract}\quad\relax}
  
  
\makeatletter
\renewcommand{\maketitle}{\bgroup\setlength{\parindent}{0pt}
\begin{flushleft}
  \textbf{\LARGE \@title}\vspace*{1em}

  \textbf{\@author}
\end{flushleft}\egroup
}

\pagestyle{fancy}   % Enables the custom headers/footers

% \fancypagestyle{firstpagestyle}{
%     \fancyhf{}
% 	\fancyhead[L]{\includegraphics[width=30pt]{images/CSAIL_Primary_Regular_RGB.png}
% \textbf{DRL}}}

\fancypagestyle{firstpagestyle}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead{}
}

\fancyhf{}
\renewcommand{\headrulewidth}{1pt}
\if \thepage=1 {\chead{}} \else \lhead{\@title} \fi
\rfoot{\thepage}

\makeatother




\renewcommand{\figurename}{\textbf{Figure}}
\renewcommand{\tablename}{\textbf{Table}}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\thefigure}{\arabic{figure}}


\newtheorem{definition}{Definition}
\newtheorem{lemma}{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{theorem}{Theorem}
\newtheorem{remark}{Remark}
\newtheorem{corollary}{Corollary}
\newtheorem{example}{Example}

\renewcommand*{\thefootnote}{\fnsymbol{footnote}}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\act}[1]{\xlongrightarrow{#1}}       
\newcommand{\eps}{\varepsilon}

\newcommand{\beginappendix}{%
    \clearpage
    \setcounter{table}{0}
    %\renewcommand{\tablename}{S}%
    \renewcommand{\thetable}{A\arabic{table}}%
    \setcounter{algorithm}{0}
    %\renewcommand{\tablename}{S}%
    \renewcommand{\thealgorithm}{A\arabic{algorithm}}%
    \setcounter{equation}{0}
    %\renewcommand{\tablename}{S}%
    \renewcommand{\theequation}{A\arabic{equation}}%
    \setcounter{figure}{0}
    %\renewcommand{\figurename}{\textbf{Extended Data Fig.}}%
    \renewcommand{\thefigure}{A\arabic{figure}}%
    \setcounter{section}{0}
    \renewcommand{\thesection}{A\arabic{section}}%
 }
