\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{BTMag}
\LoadClass[a4paper,10pt,openany]{book}


\RequirePackage[spanish,es-tabla,es-nodecimaldot]{babel}
\RequirePackage{ragged2e}
\RequirePackage{fontspec}
    \setmainfont{Crimson Pro}
    \setsansfont{Red Hat Display}

\RequirePackage{etoolbox}
    \appto\TPTnoteSettings{\scriptsize}
    
\RequirePackage[
    top=2.5cm,
    bottom=2cm,
    inner=1.25cm,
    outer=1.25cm,
    columnsep=0.65cm
]{geometry}

\RequirePackage{setspace}
    \setlength{\parindent}{0pt}
    \setstretch{1.15}

\RequirePackage{titlesec}
    \setcounter{secnumdepth}{3}
    \renewcommand{\thesection}{\arabic{section}}
    \titleformat{\section}{\sffamily\bfseries\large\MakeUppercase}{}{0em}{}
    \titleformat{\subsection}{\sffamily}{\thesubsection}{0.5em}{}
    \titleformat{\subsubsection}{\sffamily\small}{\thesubsubsection}{0.5em}{}  
  
\RequirePackage{enumitem}
    \setlist[itemize]{itemsep=2pt, topsep=4pt, parsep=2pt, partopsep=4pt}
    \setlist[enumerate]{itemsep=2pt, topsep=4pt, parsep=2pt, partopsep=4pt}

\RequirePackage{fancyhdr}
    \pagestyle{fancy}
        \fancyhf{} 
        \fancyhead[RE]{\sffamily\bfseries\selectfont \TituloActual \ | \href{https://darahraccoon.github.io/BT_Magazine/}{REVISTA}}
        \fancyhead[LE]{No. \Numero, \ \PublDate}
        \fancyhead[LO]{\sffamily\bfseries\selectfont \href{https://darahraccoon.github.io/BT_Magazine/}{REVISTA} | \TituloActual}
        \fancyhead[RO]{No. \Numero, \ \PublDate}
        \fancyfoot[LE]{\thepage}
        \fancyfoot[RO]{\thepage}

\RequirePackage[bottom, multiple]{footmisc}

\RequirePackage{multicol}

\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{wrapfig}

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
\RequirePackage[export]{adjustbox}

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

\RequirePackage{siunitx}
\RequirePackage{lipsum}

% --------------------------------------------------------------------------------------------------- %

\newcommand{\SetVol}[1]{\def\Vol{#1}}
\newcommand{\SetNum}[1]{\def\Numero{#1}}
\newcommand{\SetPublDate}[1]{\def\PublDate{#1}}
\newcommand{\SetTituloActual}[1]{
    \def\TituloActual{}
    \def\TituloActual{#1}
}

\newcommand{\Vol}{}
\newcommand{\Numero}{}
\newcommand{\PublDate}{}
\newcommand{\TituloActual}{}


\newcommand{\TituloEspecial}[1]{\node[anchor=north west,text width=0.5\paperwidth,white,text badly ragged,font=\sffamily\bfseries\fontsize{42}{36}\selectfont] at (0,0) {#1};}

\newcommand{\TituloArticulo}[3]{
    \node[anchor=north east,text width=0.3\paperwidth,white,text badly ragged,font=\sffamily\bfseries\fontsize{14}{12}\selectfont,align=flush right] at (19.2,-{#2}) {#1};
    \draw[white] (18,-{#3}) -- (19,-{#3});
}

\newenvironment{cover}
    {\thispagestyle{empty}\newgeometry{top=1cm,bottom=1cm,left=1cm,right=1cm}
    \begin{tikzpicture}[remember picture, overlay]
        \node[inner sep=0] at (current page.center) {\includegraphics[width=\paperwidth]{Portada}};
        \fill[black, opacity=0.4] (current page.south west) rectangle (current page.north east);
        \node[anchor=south west,text width=0.8\paperwidth,white,text badly ragged,font=\bfseries\fontsize{60}{48}\selectfont] at (0,-24.85) {TITULO REVISTA};
        \node[anchor=west] at (0,-26.5) {\includegraphics[width=0.2\paperwidth]{../../Recursos/Logo_UPSIN_Horizontal_Blanco}};
        \draw[white] (4.5,-25.85) -- (4.5,-27.15);
        \node[anchor=west,font=\sffamily\bfseries\fontsize{10}{12}\selectfont,white,text width=10cm] at (4.75,-26.5) {No. \Numero \\ \PublDate};
    }{\end{tikzpicture}\newpage\restoregeometry}



\newcommand{\ViejaPortada}{
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture, overlay]
        \node[inner sep=0] at (current page.center) {\includegraphics[width=\paperwidth]{Portada}};
        \fill[black, opacity=0.35] (current page.south west) rectangle (current page.north east);
        \node[anchor=north west, xshift=1.25cm, yshift=-1.25cm, scale=2] at (current page.north west) {\includegraphics[width=2.5cm]{../../Recursos/Logo_UPSIN_Horizontal_Blanco}};
        \node[anchor=south west,xshift=0.75cm,yshift=8.25cm,font=\fontsize{36}{36}\selectfont,white,text width=15cm] at (current page.south west) {BT Magazine};
        \fill[white] (-2,-19.05) rectangle (15.5,-19);
        \node[anchor=north west,xshift=0.75cm,yshift=7.25cm,font=\fontsize{42}{42}\selectfont\bfseries,white,text width=17cm,text badly ragged] at (current page.south west) {No. de muestra};
        \node[anchor=south west,xshift=1.5cm,yshift=0.725cm,font=\fontsize{12}{12}\selectfont,white,text width=17cm] at (current page.south west) {\PublDate};
        \node[anchor=south west,xshift=1.5cm,yshift=1.25cm,font=\fontsize{12}{12}\selectfont,white,text width=17cm] at (current page.south west) {No. \Numero};
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

\newcommand{\Indice}[1]{
    \newgeometry{
        top=4cm,
        bottom=2cm,
        left=3cm,
        right=0.4\paperwidth
    }
    \begingroup
    \hypersetup{linkcolor=black}
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture, overlay]
        \node[anchor=west,xshift=-0.125cm] at (current page.west) {\includegraphics[height=\paperheight,width=0.35\paperwidth]{Indice}}; % Rel. asp = 28/99
        \fill[black, opacity=0.25] (current page.north west) rectangle (-0.05\paperwidth,-30);
        \node[anchor=south west,xshift=0.75cm,yshift=1cm,font=\sffamily\itshape\fontsize{14}{12}\selectfont,white,text width=0.275\paperwidth] at (current page.south west) {#1};
    \end{tikzpicture}
    \begin{minipage}{\linewidth}
        \renewcommand{\contentsname}{\sffamily{Índice}}
        \setcounter{tocdepth}{0}
        \tableofcontents
    \end{minipage}
    \endgroup
    \restoregeometry
    \newpage
}


\newcommand{\Inicio}[3]{
    \thispagestyle{empty}
    \addcontentsline{toc}{chapter}{#2}
    
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
    \setcounter{figure}{0}
    \setcounter{table}{0}
    \setcounter{equation}{0}
    
    \ifstrequal{#1}{REVIEW}
        {
        \def\miColor{DarkBlue}
        \def\miLongitud{5.65em}
        }
    {\ifstrequal{#1}{ARTÍCULO DE INVESTIGACIÓN}
        {
        \def\miColor{Blue}
        \def\miLongitud{21.75em}
        }
    {\ifstrequal{#1}{ESPECIAL}{
        \def\miColor{Gold}
        \def\miLongitud{7em}
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
    \begin{tcolorbox}[arc=0pt,top=12pt]
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