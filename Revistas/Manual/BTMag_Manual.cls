\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{BTMag}
\LoadClass[a4paper,12pt,openany]{book}



\RequirePackage[spanish,es-tabla,es-nodecimaldot]{babel}
\RequirePackage{fontspec}
    \setmainfont{Crimson}
    \setsansfont{Red Hat Display}

\RequirePackage{etoolbox}
    \appto\TPTnoteSettings{\scriptsize}
    
\RequirePackage[
    top=3cm,
    bottom=2cm,
    left=1.5cm,
    right=1.5cm,
    columnsep=0.65cm
]{geometry}

\RequirePackage{setspace}
    \setlength{\parindent}{0pt}
    \setstretch{1.15}

\RequirePackage{titlesec}
    \setcounter{secnumdepth}{3}
    \renewcommand{\thesection}{\arabic{section}}
    \titleformat{\chapter}{\sffamily\bfseries\huge}{\thechapter}{0em}{. }
    \titleformat{\section}{\sffamily\bfseries\large\MakeUppercase}{\thesection}{0em}{. }
    \titleformat{\subsection}{\sffamily\bfseries}{\thesubsection.}{0em}{. }
    \titleformat{\subsubsection}{\sffamily\itshape\small}{\thesubsubsection}{0em}{. }  
  
\RequirePackage{enumitem}
    \setlist[itemize]{itemsep=2pt, topsep=4pt, parsep=2pt, partopsep=4pt}
    \setlist[enumerate]{itemsep=2pt, topsep=4pt, parsep=2pt, partopsep=4pt}

\RequirePackage[bottom, multiple]{footmisc}
\RequirePackage{fancyhdr}

\pagestyle{fancy}
    \fancyhf{} 
    \fancyhead[LE]{\thepage}
    \fancyhead[RO]{\thepage}
    \fancyfoot{}

\RequirePackage{multicol}

\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{subcaption}

\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage[para]{threeparttable}

\captionsetup[table]{
    font=small,
    labelfont=bf,
    skip=2pt
}
\captionsetup[figure]{
    skip=5pt,
    font=scriptsize,
    labelfont=bf
}
\captionsetup[subfigure]{
    skip=5pt,
    font=scriptsize,
    labelfont=bf
}

\RequirePackage{amsmath}
\RequirePackage{tikz}
\RequirePackage{tcolorbox}
\RequirePackage{xcolor}

\RequirePackage[colorlinks=true, linkcolor=black, citecolor=blue, urlcolor=blue, hyperfootnotes=false]{hyperref}

\RequirePackage{chapterbib}
\RequirePackage[sectionbib,square]{natbib}
    \bibliographystyle{apalike-ejor}

\RequirePackage{lipsum}

% --------------------------------------------------------------------------------------------------- %

\newcommand{\SetVol}[1]{\def\Vol{#1}}
\newcommand{\SetNum}[1]{\def\Numero{#1}}
\newcommand{\SetPublDate}[1]{\def\PublDate{#1}}

\newcommand{\Vol}{}
\newcommand{\Numero}{}
\newcommand{\PublDate}{}

\definecolor{DarkBlue}{RGB}{9,60,113}
\definecolor{LightBlue}{RGB}{0,160,224}
\definecolor{Gold}{RGB}{247,232,81}

\newcommand{\Portada}{
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture, overlay]
        \node[inner sep=0] at (current page.center) {\includegraphics[width=\paperwidth]{Portada}};
        \fill[black, opacity=0.35] (current page.south west) rectangle (current page.north east);
        \node[anchor=north west, xshift=1.25cm, yshift=-1.25cm, scale=2] at (current page.north west) {\includegraphics[width=2.5cm]{../Logo_UPSIN_Horizontal_Blanco}};
        \node[anchor=south west,xshift=0.75cm,yshift=8.25cm,font=\fontsize{36}{36}\selectfont,white,text width=15cm] at (current page.south west) {BT Magazine};
        \fill[white] (-2,-19.05) rectangle (15.5,-19);
        \node[anchor=north west,xshift=0.75cm,yshift=7.25cm,font=\fontsize{42}{42}\selectfont\bfseries,white,text width=17cm,text badly ragged] at (current page.south west) {No. de muestra};
    \end{tikzpicture}
    \newpage
}

% INDICE
\makeatletter
    \renewcommand{\@pnumwidth}{1.5em}
    \patchcmd{\l@chapter}
        {\vskip \z@ \@plus .2pt}
        {\vskip 10pt}
        {}{}
    \renewcommand{\@dotsep}{2}
\makeatother
    
\newcommand{\Indice}{
    \newgeometry{
        top=4cm,
        bottom=2cm,
        left=1.5cm,
        right=0.45\paperwidth
    }
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture, overlay]
        \node[anchor=west,xshift=-0.125cm] at (current page.west) 
            {\includegraphics[height=\paperheight]{Indice}}; % Relación de aspecto: 28/99
    \end{tikzpicture}
    \begin{minipage}{\linewidth}
        \renewcommand{\contentsname}{Índice}
        \tableofcontents
    \end{minipage}
    \restoregeometry
    \newpage
}

\newcommand{\Inicio}[3]{
    \thispagestyle{empty}
    \addcontentsline{toc}{chapter}{#2}
    
    \ifstrequal{#1}{REVIEW}
        {
        \def\miColor{DarkBlue}
        \def\miLongitud{0.13\textwidth}
        }
    {\ifstrequal{#1}{ARTÍCULO CIENTÍFICO}
        {
        \def\miColor{LightBlue}
        \def\miLongitud{0.325\textwidth}
        }
    {\ifstrequal{#1}{ESPECIAL}{
        \def\miColor{Gold}
        \def\miLongitud{0.145\textwidth}
        }
        {\def\miColor{DarkBlue} \def\miLongitud{0.325\textwidth} }}}
    
    \vspace*{-5em}
    {\sffamily\Large\textbf {\color{\miColor}{#1}} \par}
    \vspace*{-0.5em}
    {\color{\miColor}{\rule{\miLongitud}{1.25pt}} \par}
    
    \vspace*{2.5em}
    
    {\setstretch{1}\sffamily\LARGE\bfseries{#2} \par}
    \vspace*{1.25em}
    \begin{minipage}{0.85\textwidth}
        {\raggedright\large{#3} \par}
    \end{minipage}
    
    \vspace*{1.5em}
    \rule{\textwidth}{0.75pt}
    \vspace*{0.75em}
}    
    
\newcommand{\Resumen}[2]{
    \begin{tcolorbox}[
        arc=0pt,
        top=12pt,
    ]

    {\sffamily\section*{Resumen}}

    {#1}

    \par \vspace*{18pt}

    \textbf{Palabras clave:} {#2}.
    \end{tcolorbox}
    \vspace*{0.75em}
}