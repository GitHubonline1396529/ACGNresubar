%% This file is `resubar.cls'
%% Copyright 2024 - 2025 Githubonline1396529 <yyg249942899@163.com>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Githubonline1396529
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resubar}[
  2024/06/26 Custom LaTeX document class for ACGN resume bars
]
% This is a custom LaTeX document class for ACGN resume bars.
%
% It is based on the extarticle class and provides a simple way to create
% resume bars with a clean and modern design.
%
% The class supports UTF-8 encoding and includes several packages for
% formatting, including titlesec, xcolor, tcolorbox, and hyperref.
%
% It also provides options for customizing the appearance of the resume bar,
% including the color scheme and font size.
%
% The class includes commands for creating sections, subsections, and
% subsubsections, as well as for creating custom boxes for preferences,
% notices, minefields, and other types of content.
%
% The class also includes commands for inserting images and QR codes,
% as well as for defining metadata such as the title, avatar file,
% and tags.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here I use `kvoptions' to define the options for the class.

% The options are defined using the `DeclareStringOption' and
% `DeclareVoidOption' commands.
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=RESUBAR,
  prefix=RESUBAR@,
  setkeys=\kvsetkeys
}
% The options are defined here.

% The `light' and `dark' options are defined using the `DeclareStringOption'
% and `DeclareVoidOption' commands to control the color theme of the document.
\DeclareStringOption[light]{theme}
\DeclareVoidOption{light}{\kvsetkeys{RESUBAR}{theme=light}}
\DeclareVoidOption{dark}{\kvsetkeys{RESUBAR}{theme=dark}}

% The options are then processed using the `ProcessKeyvalOptions' command.
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{extarticle}
 }
\ProcessKeyvalOptions*\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The class is based on the `extarticle' class, which is a standard LaTeX class
% that provides a simple way to create articles with a clean and modern design.
\LoadClass{extarticle} % Load the extarticle class

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Import necessary packages and set up the document.
%
% The class imports several packages for formatting, including  titlesec,
% xcolor, tcolorbox, and hyperref.
\RequirePackage[UTF8]{ctex}
\RequirePackage[
left=0.5cm, right=0.5cm, 
top=0.5cm, bottom=0.5cm]{geometry}
\RequirePackage[explicit]{titlesec}
\RequirePackage{xhfill}
\RequirePackage{ulem}  % Used to add strikethrough text.
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{tcolorbox}
\RequirePackage{xparse}
\RequirePackage{atbegshi}
\RequirePackage{color}
\RequirePackage{float}
\RequirePackage{multirow}
\RequirePackage{enumitem}
\RequirePackage{amsthm}
\RequirePackage{subcaption}
\RequirePackage{fontawesome5}
% To support MiKTeX here should use fontawesome5 instead of fontawesome.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define colors for the document.
\definecolor{lightblue}{HTML}{8BACF3}
\definecolor{sakura}{HTML}{F4BDE6}
\definecolor{ginger}{HTML}{BE5504}
\definecolor{lightpink}{HTML}{FDE6E0}
\definecolor{darkpink}{HTML}{FB7299}
\definecolor{dullmagenta}{HTML}{9D446E}
\definecolor{maroon}{HTML}{800000}
\definecolor{steelblue}{HTML}{4682B4}
\definecolor{lavender}{HTML}{734F96}
\definecolor{lightlavender}{HTML}{CDB8D7}
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document theme colors.
%
% The colors are defined using the `definecolor' command, which allows you to
% define custom colors using RGB or HTML color codes.
%
% The colors are then used throughout the document to create a cohesive and 
% modern design.
\ifdefstring{\RESUBAR@theme}{light}{
  \definecolor{frontcolor}{HTML}{000000}%
  \definecolor{backgroundcolor}{HTML}{FDE6E0}%
  \definecolor{colorboxcolback}{HTML}{FFFFFF}%
}{\relax}
\ifdefstring{\RESUBAR@theme}{dark}{
  \definecolor{frontcolor}{HTML}{bbbbbb}%
  \definecolor{backgroundcolor}{HTML}{2F2F2F}%
  \definecolor{colorboxcolback}{HTML}{222222}%
}{\relax}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set hyperref options.
\RequirePackage[
  colorlinks=true,
  linkcolor=darkpink,
  urlcolor=darkpink,
  filecolor=darkpink,
  citecolor=darkpink
]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format settings for the main text of the document.

% Set the document font color and background color.
\AtBeginDocument{
  \makeatletter
  \color{frontcolor}\global\let\default@color\current@color
  \makeatother
}
\pagecolor{backgroundcolor} % Background color.

% Set global text indentation and spacing.
\setlength{\parindent}{0pt} % Set no paragraph indent.
\setlength{\parskip}{0em} % Set paragraph skip to zero.
\linespread{1} % Set line spread value to 1.

% Set list spacing and indentation.
\setlist[itemize]{noitemsep, leftmargin=*}
\setlist[enumerate]{noitemsep, leftmargin=*}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title format for sections and subsections.
\titlespacing{\section}{0pt}{1\baselineskip}{0.5\baselineskip}
\titlespacing{\subsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing{\subsubsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}

\renewcommand\thesection{
  \arabic{section}
}
\renewcommand\thesubsection{
  \arabic{section}.\arabic{subsection}
}
\renewcommand\thesubsubsection{
  \arabic{section}.\arabic{subsection}.\arabic{subsubsection}
}

% The `titleformat' command is used to define the format of the sections and
% subsections in the document. The format includes the font size, color,
% and style of the section titles, as well as the numbering format.
\titleformat{\section}
  {\normalfont\large\bfseries\filcenter}%
  {}%
  {0em}%
  {
    \color{frontcolor}%
    \xrfill[0.3ex]{1.5pt}[frontcolor]~%
    \textcolor{frontcolor}{\Roman{section}.~#1}~%
    \xrfill[0.3ex]{1.5pt}[frontcolor]
  }
\titleformat{\subsection}%
  {\raggedright\bfseries\normalsize}%
  {\thesubsection}%
  {1em}%
  {\textcolor{frontcolor}{#1}}
% Note that `titlesec' must use `#1' to display title text in exclicit mode.

\titleformat{\subsubsection}[runin]%
  {\small\bfseries} % subsection title format.
  {\thesubsubsection} % Unnumbered
  {1em} % Indentation
  {\textcolor{frontcolor}{#1}} % No additional format

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Defile colorbox style.
%
% Here are five different colorbox styles defined using the `tcolorbox' package
% and the styles are defined using the `newtcolorbox' command, which allowss 
% you to create custom boxes with different colors, fonts, and styles.
% 
% 1. `preference`: This style is used for preferences and is defined with a
%    blue background.
% 2. `notice`: This style is used for notices and is defined with a ginger
%    background. It is used to highlight important information.
% 3. `minefield`: This style is used for minefields and is defined with a 
%    maroon background. It is used to highlight which you really hate and even
%    talking about it is like walking in a minefield.
% 4. `oshi`: This style is used for oshi and is defined with a lavender
%    background. It is used to highlight your oshi.
% 5. `cp`: This style is used for CP and is defined with a dull magenta
%    background. It is used to highlight your favourite ACGN CPs.
\tcbuselibrary{skins, breakable}

\newtcolorbox[auto counter, number within=section]{preference}[1][]{%
  enhanced,
  breakable,
  colback=colorboxcolback, % Background color.
  colframe=steelblue, % Border color.
  coltitle=white, % Title color.
  fonttitle=\bfseries, % Bold font for title.
  fontupper=\bfseries\color{frontcolor},  % Bold font for text.
  boxrule=0.75mm, % Border thickness.
  % arc=2mm, % Corner radius.
  left=2.5pt, right=2.5pt, % 内边距
  top=2.5pt, bottom=2.5pt,
  title={\faThumbsUp\ 偏好~\thetcbcounter}, % Title format.
}

\newtcolorbox[auto counter, number within=section]{notice}[1][]{%
  enhanced,
  breakable,
  colback=colorboxcolback, % Background color.
  colframe=ginger, % Border color.
  coltitle=white, % Title color.
  fonttitle=\bfseries, % Bold font for title.
  fontupper=\bfseries\color{frontcolor}, % Bold font for text.
  boxrule=0.75mm, % Border thickness.
  % arc=2mm, % Corner radius.
  left=2.5pt, right=2.5pt, % Inner padding.
  top=2.5pt, bottom=2.5pt,
  title={\faExclamation\ 注意~\thetcbcounter}, % Title format.
}

\newtcolorbox[auto counter, number within=section]{minefield}[1][]{%
  enhanced,
  breakable,
  colback=colorboxcolback, % Background color.
  colframe=maroon, % Border color.
  coltitle=white, % Title color.
  fonttitle=\bfseries, % Bold font for title.
  fontupper=\bfseries\color{frontcolor}, % Bold font for text.
  boxrule=0.75mm, % Border thickness.
  % arc=2mm, % Corner radius.
  left=2.5pt, right=2.5pt,  % Inner padding.
  top=2.5pt, bottom=2.5pt,
  title={\faBomb\ 雷点~\thetcbcounter}, % Title format.
}

\newtcolorbox[auto counter, number within=section]{oshi}[1][]{%
  enhanced,
  breakable,
  colback=colorboxcolback, % Background color.
  colframe=lavender, % Border color.
  coltitle=white, % Title color.
  fonttitle=\bfseries, % Bold font for title.
  fontupper=\bfseries\color{frontcolor}, % Bold font for text.
  boxrule=0.75mm, % Border thickness.
  % arc=2mm, % Corner radius.
  left=2.5pt, right=2.5pt,  % Inner padding.
  top=2.5pt, bottom=2.5pt,
  title={\faUser\ 我推~\thetcbcounter}, % Title format.
}

\newtcolorbox[auto counter, number within=section]{cp}[1][]{%
  enhanced,
  breakable,
  colback=colorboxcolback, % Background color.
  colframe=dullmagenta, % Border color.
  coltitle=white, % Title color.
  fonttitle=\bfseries, % Bold font for title.
  fontupper=\bfseries\color{frontcolor}, % Bold font for text.
  boxrule=0.75mm, % Border thickness.
  % arc=2mm, % Corner radius.
  left=2.5pt, right=2.5pt,  % Inner padding.
  top=2.5pt, bottom=2.5pt,
  title={\faHeart\ CP~\thetcbcounter}, % Title format.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Customized commands are difined as the following.
% The commands are used to insert images, QR codes, and other elements
% into the document.

% Customized command for QR code.
% The `qrcode' command is used to insert a QR code image into the document.
\newcommand{\qrcode}[1]{%
  \begin{figure}[H]
    \centering
    \includegraphics[width=4cm]{#1}
  \end{figure}
}

% Customized command for figure.
% The `fig' command is used to insert a figure into the document.
\newcommand{\fig}[1]{%
  \includegraphics[width=\textwidth]{#1}
}

% Customized command for two figures.
\newcommand{\twofigs}[2]{%
  \begin{figure}[H]
    \begin{minipage}{0.49\textwidth}
      \includegraphics[width=\textwidth]{#1}
    \end{minipage}
    \begin{minipage}{0.49\textwidth}
      \includegraphics[width=\textwidth]{#2}
    \end{minipage}
  \end{figure}
}

% Commands to specify metadata of the document.
\renewcommand{\title}[1]{\def\@title{#1}}

\newcommand{\avatarfile}[1]{\def\@avatarfile{#1}}
% \newcommand{\avatarsize}[1]{\def\@avatarsize{#1}}

\newcommand{\cosname}[1]{\def\@cosname{#1}}

\newcommand\tagA[1]{\def\@tagA{#1}}
\newcommand\tagB[1]{\def\@tagB{#1}}
\newcommand\tagC[1]{\def\@tagC{#1}}

% Default metadata to be displayed if the user does not specify them.
\title{基于 \LaTeX 的二次亲友扩列条}
\cosname{你的圈名}
\tagA{Tag 1}
\tagB{Tag 2}
\tagC{Tag 3}
\avatarfile{figure/avatar}
\newlength{\avatarwidth}
\setlength{\avatarwidth}{2.375cm} % Default to be 2.375cm

% Define the title format.
\renewcommand\maketitle{
  \begin{center}%
  \bfseries\Large\@title\vspace{0.5em}

  % Create a table with five rows and two columns, hiding the lines.
  \begin{tabular}{ c l }
      \multirow{4}{1.05\avatarwidth}{
          \centering\includegraphics[
              width=\avatarwidth
              ]{\@avatarfile}} &
      \textbf{cn：\@cosname} \\
      & \textnormal{\faTags\ \@tagA} \\
      & \textnormal{\faTags\ \@tagB} \\
      & \textnormal{\faTags\ \@tagC} \\
  \end{tabular}
\end{center}
}

\endinput
