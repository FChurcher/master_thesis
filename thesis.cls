\ProvidesClass{thesis}[2018/11/05 v0.1 THESIS]
% Inherit options of article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% packages
\RequirePackage{epsfig}
\RequirePackage{array}
\usepackage{textcomp}
\RequirePackage{subfigure}
\RequirePackage{calc}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{multicol}
\RequirePackage{pslatex}
\RequirePackage{natbib}
\RequirePackage{apalike}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage[absolute]{textpos}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{perpage}                % to reset footnotes counter every page
\usepackage[multiple]{footmisc}         % to separete multiple footnotes with ,

% pre setup
\subfigtopskip=0pt
\subfigcapskip=0pt
\subfigbottomskip=0pt
\geometry{left=2.5cm, top=2.5cm, right=2.2cm, bottom=2.3cm, footskip=1.6cm}
\newfloat{formula}{H}{for}\floatname{formula}{Equ.}
\captionsetup[figure]{labelfont={bf},name={Fig.},labelsep=period}
\captionsetup[table]{labelfont={bf},name={Tab.},labelsep=period}
\captionsetup[formula]{labelfont={bf},labelsep=period}
\MakePerPage{footnote}                  % to reset footnotes counter every page
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}} % for centered wide tables

% styles
% \newcommand*{\coverTitle}[1]{{\fontsize{32pt}{1em}\headerfontlight\color{graytext} #1}}

% attributes
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\matriculationnumber}[1]{\def\@matriculationnumber{#1}}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}

\newcommand*{\thesistype}[1]{\def\@thesistype{#1}}      % Master Thesis
\newcommand*{\thesistitle}[1]{\def\@thesistitle{#1}}    % Titel der Arbeit
\newcommand*{\university}[1]{\def\@university{#1}}      % Universität Leipzig
\newcommand*{\logoofuniversity}[1]{\def\@logoofuniversity{#1}}
\newcommand*{\degree}[1]{\def\@degree{#1}}              % Master of Science
\newcommand*{\field}[1]{\def\@field{#1}}                % Bioinformatics
\newcommand*{\faculty}[1]{\def\@faculty{#1}}            % Fakultät für Mathematik und Informatik
\newcommand*{\examinerA}[1]{\def\@examinerA{#1}}        % erster Prüfer
\newcommand*{\examinerB}[1]{\def\@examinerB{#1}}        % zweiter Prüfer
\newcommand*{\duedate}[1]{\def\@duedate{#1}}            % today

% functions
\newcommand*{\makeCover}{
  \pagestyle{empty}
  \makeBox{0mm}{15mm}{center}{ \Large \@university \\ \@faculty}
  \makeBox{0mm}{35mm}{center}{ \rule{\paperwidth-25mm}{0.4pt} }
  \makeBox{0mm}{90mm}{center}{ \Large \@thesistype }
  \makeBox{0mm}{100mm}{center}{ \Huge \textbf{\@thesistitle} }
  \makeBox{0mm}{135mm}{center}{ \huge by }
  \makeBox{0mm}{150mm}{center}{ \huge \@firstname ~ \@lastname }
  \makeBox{0mm}{210mm}{center}{ \includegraphics[height=.15\paperheight]{\@logoofuniversity} }
  \makeBox{0mm}{270mm}{center}{ \Large \@university \\ \@duedate }
  ~\newpage
}


\newcommand*{\makeTitlePage}{
  \pagenumbering{Roman}
  \setcounter{page}{2}
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[L]{\rightmark}  
  \fancyhead[R]{\thepage}  

  \begin{center}
    ~\\ \vspace{-5mm}
    \Huge \@thesistype \\ \vspace{10mm}
    \Large in order to attain the academic degree \\ \vspace{10mm}
    \huge \textbf{\@degree ~in \\ \@field} \\ \vspace{10mm} 
    \Large at the \\ \vspace{4mm} 
    \huge \@university \\ \Large \@faculty
  \end{center}
  \makeBox{0mm}{114mm}{center}{ \includegraphics[height=.13\paperheight]{\@logoofuniversity} }
  \makeBox{30mm}{187mm}{flushleft}{\Large subject:}
  \makeBox{80mm}{187mm}{flushleft}{ \LARGE \textbf{\@thesistitle}}
  \makeBox{30mm}{198mm}{flushleft}{\Large presented by:}
  \makeBox{80mm}{198mm}{flushleft}{\Large \@firstname ~ \@lastname \\ \@address \\ \@email}
  \makeBox{30mm}{228mm}{flushleft}{\Large examiner:}
  \makeBox{80mm}{228mm}{flushleft}{\Large \@examinerA \\ \@examinerB}
  \makeBox{30mm}{255mm}{flushleft}{\Large due date:}
  \makeBox{80mm}{255mm}{flushleft}{\Large \@duedate}
  ~\newpage
}

\newcommand*{\makeAbstractPage}[1]{
  \fontsize{12}{17}\selectfont
  \markright{\uppercase{}}
  \addcontentsline{toc}{section}{\uppercase{abstract}}
  \section*{\uppercase{abstract}}
  #1  
  \newpage
}

\newcommand*{\makeTableOfFigures}{
  \renewcommand\listfigurename{\uppercase{list of figures}}
  \addcontentsline{toc}{section}{\uppercase{list of figures}}
  \markright{\uppercase{}}
  \listoffigures
  \newpage
}

\newcommand*{\makeTableOfTables}{
  \renewcommand\listtablename{\uppercase{list of tables}}
  \addcontentsline{toc}{section}{\uppercase{list of tables}}
  \markright{\uppercase{}}
  \listoftables
  \newpage
}

\newcommand*{\makeTableOfEquations}{
  \addcontentsline{toc}{section}{\uppercase{list of equations}}
  \markright{\uppercase{}}
  \listof{formula}{\uppercase{list of equations}}
  \newpage
}

\newcommand*{\makeTableOfContents}{
  \renewcommand\contentsname{\uppercase{contents}}
  \addcontentsline{toc}{section}{\uppercase{contents}}
  \renewcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
  \markright{\uppercase{}}
  \tableofcontents
  \newpage
}

\newcommand*{\makeReferences}[1]{
  \addcontentsline{toc}{section}{\uppercase{references}}
  \markright{\uppercase{}}
  \bibliographystyle{apalike}
  \bibliography{#1}
  \newpage
}

\newcommand*{\makeStatutoryDeclaration}{
  \addcontentsline{toc}{section}{\uppercase{statutory declaration}}
  \markright{\uppercase{}}
  \section*{\uppercase{statutory declaration}}
  Der Abschlussarbeit ist eine eidesstattliche Erklärung beizufügen. Die genaue Formulierung kön-nen Sie auf den Seiten des Studienbüros herunterladen. Weiterhin ist ein Exemplar dieser Erklä-rung dem Prüfungsamt für die Prüfungsakten gesondert, d.h. als loses Blatt, auszuhändigen. Die derzeit aktuelle Erklärung (Stand 2017) ist die Folgende:
  \begin{textblock*}{\paperwidth/2}(0mm,70mm)
    \begin{center}
      \@lastname, \@firstname \\ \vspace{-3.8mm}
      \rule{\paperwidth/4}{0.4pt}\\
      name
    \end{center}
  \end{textblock*}
  \begin{textblock*}{\paperwidth/2}(\paperwidth/2,70mm)
    \begin{center}
      \@matriculationnumber \\ \vspace{-3.8mm}
      \rule{\paperwidth/4}{0.4pt}\\
      matriculation number
    \end{center}
  \end{textblock*}
  \vspace{45mm} ~\\
  Ich versichere, dass ich die Masterarbeit selbstständig verfasst und keine anderen als die angege-benen Quellen und Hilfsmittel benutzt habe.\\
  Darüber hinaus versichere ich, dass die elektronische Version der Masterarbeit mit der gedruckten Version übereinstimmt.
  \begin{textblock*}{\paperwidth/2}(\paperwidth/2,270mm)
    \begin{center}
      \rule{\paperwidth/3}{0.4pt}\\
      place, date, signature
    \end{center}
  \end{textblock*}
  \newpage
}

\newcommand*{\content}[1]{
  \newcounter{romanpagecount}
  \setcounter{romanpagecount}{\value{page}} % save roman index 
  \pagenumbering{arabic}
  #1
  \newpage
  \pagenumbering{Roman}
  \setcounter{page}{\value{romanpagecount}} % reuse roman index
}



\newcommand*{\newFigure}[4]{
  \begin{figure}[ht]
    \vspace{5mm}
    \begin{center}
      \includegraphics[width=#2]{#1}
    \end{center}
    \caption[#3]{\textbf{#3:} #4}
    \label{fig:#3}
    \vspace{2mm}
  \end{figure}\\ \indent
}

\newcommand*{\newFigureOwn}[4]{
  \begin{figure}[ht]
    \vspace{5mm}
    \begin{center}
      #1
    \end{center}
    \caption[#3]{\textbf{#3:} #4}
    \label{fig:#3}
    \vspace{2mm}
  \end{figure}\\ \indent
}

\newcommand*{\newFigureCode}[4]{
  \begin{figure}[ht]
    \vspace{5mm}
      \begin{tabular}{p{0.04\columnwidth} l c}
        & \parbox[t]{0.96\columnwidth}{\texttt{#1}} &
      \end{tabular}
    \caption[#3]{\textbf{#3:} #4}
    \label{fig:#3}
    \vspace{2mm}
  \end{figure}\\ \indent
}

\newcommand*{\newTable}[3]{
  \renewcommand{\arraystretch}{1.15}
  \begin{table}[ht]
    \vspace{5mm}
    \large
    \begin{center}
      #1
    \end{center}
    \normalsize
    \caption[#2]{\textbf{#2:} #3}
    \label{tab:#2}
    \vspace{8mm}
  \end{table}\\ \indent
}

\newcommand*{\newFormula}[3]{
  \begin{formula}[ht]
    \vspace{5mm}
    \large
    \begin{equation*}
      #1      
    \end{equation*}
    \normalsize
    \caption[#2]{\textbf{#2:} #3}
    \label{equ:#2}
    \vspace{2mm}
  \end{formula}\\ \indent
}

\newcommand*{\newSection}[2]{
  \setcounter{secnumdepth}{4}
  \vspace*{0mm}
  \section{\uppercase{#1}}
  \markright{\uppercase{#1}}
  \vspace{3.5mm}
  \indent #2
}

\newcommand*{\newSubSection}[2]{
  \vspace*{0mm}
  \subsection{\uppercase{#1}}
  \markright{\uppercase{#1}}
  \vspace{3.5mm}
  \indent #2
  \newpage
}

\newcommand*{\newSubSubSection}[2]{
  \newpage
  \vspace*{0mm}
  \subsubsection{\uppercase{#1}}
  \markright{\uppercase{#1}}
  \vspace{3.5mm}
  \indent #2
}

\newcommand*{\citeNote}[1]{\citep{#1}}
\newcommand*{\note}[1]{\footnote{#1}}
\newcommand*{\gapSmall}{\newline\indent}
\newcommand*{\gapBig}{\vspace{6mm}\newline\indent}

\newcommand*{\todo}[1]{\textcolor{red}{
  \newline\rule{\textwidth}{1px}
  \newline
  \texttt{\textbf{TO DO}}\newline
  #1
  \newline
  \rule{\textwidth}{1px}
}}

\newcommand*{\comment}[1]{\textcolor{gray}{
  \newline\rule{\textwidth}{1px}
  \newline
  \texttt{\textbf{COMMENT}}\newline
  #1
  \newline
  \rule{\textwidth}{1px}
}}


% helper fuctions
\newcommand*{\makeBox}[4]{
  \begin{textblock*}{\paperwidth}(#1,#2)
    \begin{#3}
      #4
    \end{#3}
  \end{textblock*}
}