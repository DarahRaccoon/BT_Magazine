\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{BTMag}
\LoadClass[a4paper,12pt,openany]{book}



\RequirePackage[spanish,es-tabla,es-nodecimaldot]{babel}
\RequirePackage{fontspec}
    \setmainfont{Crimson}
    \setsansfont{Red Hat Display}

\RequirePackage{etoolbox}
    \appto\TPTnoteSettings{\scriptsize}
    \patchcmd{\@makechapterhead}{\normalfont}{\normalfont\sffamily}{}{}
    
\RequirePackage[
    top=2.25cm,
    headsep=0.75cm,
    bottom=2.5cm,
    footskip=1cm,
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
        \fancyhead[LE]{Manual de proyecto}
        \fancyhead[RO]{Revista Universitaria: TÍTULO}
        \fancyfoot[LE]{\thepage}
        \fancyfoot[RO]{\thepage}

\RequirePackage{multicol}

\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage[para]{threeparttable}
    \captionsetup[table]{
        singlelinecheck=false,
        justification=raggedright,
        font=scriptsize,
        labelfont={sf,bf,color=DarkBlue},
        skip=2pt
    }
    \captionsetup[figure]{
        skip=5pt,
        singlelinecheck=false,
        justification=raggedright,
        font=scriptsize,
        labelfont={sf,bf,color=DarkBlue}
    }
    \captionsetup[subfigure]{
        skip=5pt,
        singlelinecheck=false,
        justification=raggedright,
        font=scriptsize,
        labelfont={sf,bf,color=DarkBlue}
    }

\RequirePackage{amsmath}
\RequirePackage{tikz}
\RequirePackage{tcolorbox}
\RequirePackage[table]{xcolor}
    \definecolor{DarkBlue}{RGB}{9,60,113}
    \definecolor{Blue}{RGB}{0,160,224}
    \definecolor{LightBlue}{RGB}{138,222,255}
    \definecolor{Gold}{RGB}{245,230,80}
    \definecolor{Grey}{RGB}{242,242,242}
    \definecolor{White}{RGB}{255,255,255}

\RequirePackage[colorlinks=true, linkcolor=Blue, citecolor=Blue, urlcolor=DarkBlue, hyperfootnotes=false]{hyperref}

\RequirePackage{chapterbib}
\RequirePackage[sectionbib,square]{natbib}
    \bibliographystyle{apalike-ejor}

\RequirePackage{lipsum}

% --------------------------------------------------------------------------------------------------- %

\newcommand{\SetProyecto}[1]{\def\Proyecto{#1}}
\newcommand{\Proyecto}{}


\newcommand{\Portada}{
    \begin{tikzpicture}[remember picture, overlay]
        \node[inner sep=0] at (current page.center) {\includegraphics[width=\paperwidth]{Portada}};
        \fill[black, opacity=0.35] (current page.south west) rectangle (current page.north east);
        \node[anchor=north west,xshift=1cm,yshift=-1cm] at (current page.north west) {\includegraphics[width=6cm]{../Logo_UPSIN_Horizontal_Blanco}};
        \node[anchor=south west,xshift=0.75cm,yshift=7.5cm,font=\fontsize{36}{36}\selectfont,white,text width=15cm] at (current page.south west) {Manual de Proyecto:};
        \draw[white] (-2,-20) -- (15,-20);
        \node[anchor=north west,xshift=0.75cm,yshift=6.5cm,font=\sffamily\fontsize{42}{42}\selectfont\bfseries,white,text width=17cm,text badly ragged] at (current page.south west) {\Proyecto};
        \node[anchor=south west,xshift=1.5cm,yshift=0.5cm,font=\fontsize{12}{12}\selectfont,white,text width=17cm] at (current page.south west) {Última actualización: \today};
    \end{tikzpicture}
    \newpage
}

% INDICE
\makeatletter
    \renewcommand{\@pnumwidth}{3em}
    \patchcmd{\l@chapter}
        {\vskip \z@ \@plus 1pt}
        {\vskip 10pt}
        {}{}
    \renewcommand{\@dotsep}{2}
    \preto\tableofcontents{\begingroup\sffamily}
    \appto\tableofcontents{\endgroup}
\makeatother
    
\newcommand{\Indice}{
    \begingroup
    \hypersetup{linkcolor=black}
    \thispagestyle{empty}
    \renewcommand{\contentsname}{\sffamily{Índice}}
    \tableofcontents
    \endgroup
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

\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}

\newcommand{\theader}[1]{
    \sffamily\bfseries\cellcolor{DarkBlue}\textcolor{White}{#1}
}

\newcommand{\tmultiheader}[1]{
    \sffamily\bfseries\centering\textcolor{DarkBlue}{#1}
}