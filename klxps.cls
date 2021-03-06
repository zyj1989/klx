%% This is file 'klxps.cls',
%% Used for klx latex render. Typically for math paper and answer sheet render

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{klxps}[2016/06/28 v0.1 test]
\LoadClass{article}
%\RequirePackage[paperwidth=195mm,paperheight=270mm,left=8mm,right=12mm,top=16mm,bottom=4mm,includefoot]{geometry}
%\usepackage[paperwidth=21.00cm, paperheight=29.70cm, left=2.40cm, right=2.40cm, top=5.85cm, bottom=2.70cm]{geometry}% Specified for answersheet layout
% Specified for answersheet layout
\RequirePackage[CJKmath=true]{xeCJK}

\RequirePackage{varwidth,calc}
\RequirePackage{amsmath, amssymb, yhmath}
\RequirePackage{graphicx,ulem}
\RequirePackage{multicol}
\RequirePackage{mathrsfs}
\RequirePackage[version=4]{mhchem}
\RequirePackage{pifont, picinpar, picins, fancyhdr,lastpage}
\pagestyle{empty}
\RequirePackage{ifthen,CJKnumb,mdwlist,enumerate,wrapfig}
\RequirePackage{newunicodechar}
\RequirePackage{zref-user}
\RequirePackage{zref-abspos}
\graphicspath{{/Users/zhangyingjie/var/data/img/}}
\usepackage[paperwidth=595.28pt, paperheight=841.89pt, left=2.40cm, right=2.40cm, top=5.85cm, bottom=2.70cm]{geometry}
\setCJKmainfont{STSong}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                  %
%   redefine some symbols for Chinese math style   %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newunicodechar{Ⅰ}{\text{$\mathrm{I}$}}
\newunicodechar{Ⅱ}{\text{$\mathrm{II}$}}
\newunicodechar{Ⅲ}{\text{$\mathrm{III}$}}
\newunicodechar{Ⅳ}{\text{$\mathrm{IV}$}}
\newunicodechar{Ⅴ}{\text{$\mathrm{V}$}}
\newunicodechar{Ⅵ}{\text{$\mathrm{VI}$}}
\newunicodechar{Ⅶ}{\text{$\mathrm{VII}$}}
\newunicodechar{Ⅷ}{\text{$\mathrm{VIII}$}}
\newunicodechar{Ⅸ}{\text{$\mathrm{IX}$}}
\newunicodechar{Ⅹ}{\text{$\mathrm{X}$}}
\newunicodechar{①}{\text{\ding{172}}}
\newunicodechar{②}{\text{\ding{173}}}
\newunicodechar{③}{\text{\ding{174}}}
\newunicodechar{④}{\text{\ding{175}}}
\newunicodechar{⑤}{\text{\ding{176}}}
\newunicodechar{⑥}{\text{\ding{177}}}
\newunicodechar{⑦}{\text{\ding{178}}}
\newunicodechar{⑧}{\text{\ding{179}}}
\newunicodechar{⑨}{\text{\ding{180}}}
\newunicodechar{⑩}{\text{\ding{181}}}
\newunicodechar{∴}{\text{\raisebox{0.15em}{$\therefore$}}}
\newunicodechar{∵}{\text{\raisebox{0.15em}{$\because$}}}
\DeclareMathSizes{10}{10}{5}{5}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                  %
%         fix some math formula appearance         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% dfrac appearance

\newlength{\fracsep}
\setlength{\fracsep}{.15em}
\def\dfrac#1#2{
    \genfrac{}{}{}0{
        \raisebox{-0.15em}{\hspace*{\fracsep}$#1$\hspace*{\fracsep}}
    }{
        \hspace*{\fracsep}#2\hspace*{\fracsep}
    }
}
% cong, sim, parallel appearance
\renewcommand{\cong}{
    \text{\raisebox{-0.2em}{\includegraphics[height=1em]{U+224C.pdf}}}
}
\renewcommand{\parallel}{
    \text{\raisebox{-0.2em}{\includegraphics[height=1em]{U+2225.pdf}}}
}
\renewcommand{\backsim}{
    \text{\raisebox{-0.2em}{\includegraphics[height=1.2em]{U+223D.pdf}}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                  %
%             item & paper structure               %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% Counters %%%%%%%%%%%%%%%%%%%%%
\newcounter{ns}
\newcounter{nq}
\newcounter{nqq}[nq]
\newcounter{nqqq}[nqq]
\newcommand{\wq}{ 
    %\stepcounter{nq}
    \thenq.\hspace{.6em}}
%\newcommand{\wqq}{\stepcounter{nqq}\item[(\thenqq)]}
\newcommand{\wqq}{
    \stepcounter{nqq}
    \item[(\thenqq)]%
}
\newcommand{\wqqq}{\stepcounter{nqqq}\item[(\roman{nqqq})]}
\newcommand{\wns}[1]{\stepcounter{ns}{\bf \CJKnumber{\thens}、#1}}
\newcommand{\ws}[2]{\begin{minipage}[t]{\textwidth} {\heiti \wns #1 } #2 \end{minipage} }


\catcode`\^^M=10 % treat return as space
\linespread{1.2}
\columnsep=15pt
\columnseprule=0pt
\setlength{\fboxsep}{0pt}
\setlength{\fboxrule}{0pt}
\newlength{\imglength}
\newlength{\imgwidth}
\newlength{\imgheight}
\newlength{\imgdepth}
\newlength{\optwidth}
\newlength{\optheight}
\newlength{\descheight}
\newlength{\restheight}
\newlength{\optdepth}
\newlength{\descdepth}
\newlength{\opttotalheight}
\newlength{\desctotalheight}
\newlength{\heightdiff}
\newlength{\comlength}
\newlength{\itemtotalheight}
\newlength{\idxcorheight}
\newlength{\idxsep}
\newlength{\imgsep}
\newlength{\twidth}
\newsavebox{\descbox}
\newsavebox{\optbox}
\newsavebox{\combox}
\setlength{\comlength}{0pt}
\setlength{\heightdiff}{0pt}
\setlength{\idxsep}{.3em} % sep between idx and content
\setlength{\imgsep}{.4em} % sep between content and img
\setlength{\optwidth}{\textwidth}
\renewcommand{\headrulewidth}{0pt}
\newcommand{\dq}{\mbox{(\qquad)}}
\newcommand{\dd}{\mbox{\ \rule[-.25ex]{4em}{.5pt}}}
\newcounter{CheckBoxX}
\setcounter{CheckBoxX}{29054895}
\newlength{\CheckBoxSep}
\setlength{\CheckBoxSep}{1.2mm}
\newcommand{\CheckBox}{\zsaveposx{\thenq_pos}\ifnum\zposx{\thenq_pos}>\theCheckBoxX \par \else \relax\fi \hfill \fboxrule.4pt\fboxsep0pt\raisebox{-5pt}{\zsavepos{\thenq_CheckBox_ll}\framebox[9mm][c]{\rule{0pt}{4.3mm}}\hspace{\CheckBoxSep}\framebox[9mm][c]{\rule{0pt}{4.3mm}}\hspace{\CheckBoxSep}\framebox[9mm][c]{\rule{0pt}{4.3mm}}}%
    \immediate\write\MyWrite{%
        \thenq_CheckBox_ll: (\the\dimexpr\zposx{\thenq_CheckBox_ll}sp, \the\dimexpr\zposy{\thenq_CheckBox_ll}sp)%
    }
}
\DeclareFixedFont{\cbfont}{OT1}{put}{m}{n}{8}
\newcommand{\ChoiceBox}[1]{%
    \fboxsep=1.1pt\fboxrule=.4pt%
    \framebox[6mm][l]{%
        \zsavepos{\thenq_#1_ll}%
        \hspace*{-.5pt}\cbfont{#1}%
    }%
    \immediate\write\MyWrite{%
        \thenq_ChoiceBox_#1: (\the\dimexpr\zposx{\thenq_#1_ll}sp-\fboxsep, \the\dimexpr\zposy{\thenq_#1_ll}sp-\fboxsep)%
    }%
}
\newcommand{\AnswerBox}[1]{\fboxrule0.4pt\fbox{\begin{minipage}[t]{\textwidth}\begin{multicols}{2}\color{white}\fontsize{10}{10}\selectfont #1 \par \end{multicols}\end{minipage}}}

\newcommand{\fourch}[4]{% 四个选项一行
    \par%
    \begin{tabular}{*{4} {@{} p{0.23\optwidth}}}
    \ChoiceBox{A} #1 & \ChoiceBox{B} #2 & \ChoiceBox{C} #3 & \ChoiceBox{D} #4 
    \end{tabular}
}
\newcommand{\twoch}[4]{% 两个选项一行
    \par%
    \begin{tabular}{*{2} {@{} p{0.46\optwidth}}}
    \ChoiceBox{A} #1 & \ChoiceBox{B} #2 \\
    \ChoiceBox{C} #3 & \ChoiceBox{D} #4 
    \end{tabular}
}
\newcommand{\onech}[4]{\par%
\ChoiceBox{A} \hangafter1\hangindent=20pt#1 \par%
\ChoiceBox{B} \hangafter1\hangindent=20pt#2 \par%
\ChoiceBox{C} \hangafter1\hangindent=20pt#3 \par%
\ChoiceBox{D} \hangafter1\hangindent=20pt#4 \par%
}
%\newcommand{\imgch}[4]{
% \begin{tabular}{cccc}  \fbox{#1} &  \fbox{#2} & \fbox{#3} &  \fbox{#4} \\ A & B & C & D \end{tabular}}
\newlength{\cha}
\newlength{\chb}
\newlength{\chc}
\newlength{\chd}
\newlength{\che}
\newlength{\maxw}
\newcommand{\imgch}[8]{\def\arraystretch{0.4}%
    \settowidth{\cha}{#1}
    \settowidth{\chb}{#3}
    \settowidth{\chc}{#5}
    \settowidth{\chd}{#7}
    \addtolength{\cha}{\chb}
    \addtolength{\cha}{\chd}
    \addtolength{\cha}{\chc}
    \ifthenelse{\lengthtest{\cha = 0mm}}
    {%then no text in img_opts 
    \hspace*{-5pt}\begin{tabular}{*{4} {@{} p{0.248\optwidth}}c}
    \centering #2 & \centering #4 & \centering #6 & \centering #8 &\\
    \centering \ChoiceBox{A} & \centering \ChoiceBox{B} & \centering \ChoiceBox{C} & \centering \ChoiceBox{D}   &\\
    \end{tabular}
    }
    {%else some text in img_opts
    \hspace*{-0.5em}\begin{tabular}{*{4} {@{} p{0.248\optwidth}}c}
    \centering #2 & \centering #4 & \centering #6 & \centering #8 &\\
    \parbox{0.248\optwidth}{ \centering #1} & \parbox{0.248\optwidth}{\centering #3} & \parbox{0.248\optwidth}{\centering #5} &  \parbox{0.248\optwidth}{\centering #7} & \\
    \centering \ChoiceBox{A} & \centering \ChoiceBox{B} & \centering \ChoiceBox{C} & \centering \ChoiceBox{D}   &\\
    \end{tabular}
    }
}
\setlength{\parindent}{0em}
\setlength{\parskip}{0pt}
\newcommand{\ch}[8]{\def\arraystretch{0.4}%
    \settowidth{\cha}{A. #1}
    \settowidth{\chb}{B. #3}
    \settowidth{\chc}{C. #5}
    \settowidth{\chd}{D. #7}\setlength{\maxw}{\cha}
    \ifthenelse{\lengthtest{\chb > \maxw}}{\setlength{\maxw}{\chb}}{}
    \ifthenelse{\lengthtest{\chc > \maxw}}{\setlength{\maxw}{\chc}}{}
    \ifthenelse{\lengthtest{\chd > \maxw}}{\setlength{\maxw}{\chd}}{}
    \ifthenelse{\lengthtest{\maxw > 0.46\optwidth}}
    {\onech{#1}{#3}{#5}{#7}}
    {\ifthenelse{\lengthtest{\maxw >0.23\optwidth}}{\twoch{#1}{#3}{#5}{#7}}{\fourch{#1}{#3}{#5}{#7}}}
}
\newcommand{\trech}[6]{\def\arraystretch{0.4}%% 三个选项的选择题
    \par%
    \settowidth{\cha}{A. #1}%
    \settowidth{\chb}{B. #3}%
    \settowidth{\chc}{C. #5}%
    \setlength{\maxw}{\cha}%
    \ifthenelse{\lengthtest{\chb > \maxw}}{\setlength{\maxw}{\chb}}{}%
    \ifthenelse{\lengthtest{\chc > \maxw}}{\setlength{\maxw}{\chc}}{}%
    \ifthenelse{\lengthtest{\maxw > 0.31\optwidth}}{% then 
           \ChoiceBox{A} #1 \\ \ChoiceBox{B} #3 \\ \ChoiceBox{C} #5 }{% else three opts in one line
         \begin{tabular}{*{3} {@{} p{0.33\optwidth}}}\ChoiceBox{A} #1 & \ChoiceBox{B} #3 & \ChoiceBox{C} #5 \end{tabular}%
        }%
}
\newcommand{\fivch}[9]{\def\arraystretch{0.4}%% 五个选项的选择题
    \par
    \settowidth{\cha}{A. #1}
    \settowidth{\chb}{B. #3}
    \settowidth{\chc}{C. #5}
    \settowidth{\chd}{D. #7}
    \settowidth{\che}{E. #9}
    \setlength{\maxw}{\cha}
    \ifthenelse{\lengthtest{\chb > \maxw}}{\setlength{\maxw}{\chb}}{}
    \ifthenelse{\lengthtest{\chc > \maxw}}{\setlength{\maxw}{\chc}}{}
    \ifthenelse{\lengthtest{\chd > \maxw}}{\setlength{\maxw}{\chd}}{}
    \ifthenelse{\lengthtest{\che > \maxw}}{\setlength{\maxw}{\che}}{}
    \ifthenelse{\lengthtest{\maxw > 0.198\optwidth}}{% then 
         \ChoiceBox{A} #1 \\ \ChoiceBox{B} #3 \\ \ChoiceBox{C} #5 \\ \ChoiceBox{D} #7 \\ \ChoiceBox{E} #9}{% else 
         \begin{tabular}{*{5} {@{} p{0.198\optwidth}}} \ChoiceBox{A} #1 & \ChoiceBox{B} #3 & \ChoiceBox{C} #5 & \ChoiceBox{D} #7 & \ChoiceBox{E} #9 \end{tabular}
        }
}


\newlength{\indexlength}
\newlength{\contl}
\newlength{\sbcontl}
\newlength{\ssbcontl}
\setlength{\indexlength}{2em}
\setlength{\contl}{\textwidth}
\addtolength{\contl}{-1em}
\setlength{\sbcontl}{\contl}
\addtolength{\sbcontl}{-1em}
\setlength{\ssbcontl}{\sbcontl}
\addtolength{\ssbcontl}{-1em}
\newenvironment{questions}{% env for each item
    \stepcounter{nq}
    }{
    \par
}
%\newenvironment{subquestions}{%
%\begin{minipage}[t]{\indexlength}\wqq\end{minipage}\begin{minipage}[t]{\subcontentlength}
%}{%
%\end{minipage}\\
%} 
\newenvironment{subquestions}{\begin{enumerate*}}{\end{enumerate*}}
\newenvironment{subsubquestions}{
        \begin{enumerate*}
    }{
    \end{enumerate*}
}

\newcommand{\klxitem}[4]{

    %\begin{varwidth}{#4}
    \setlength{\optwidth}{\textwidth}
    \settoheight{\imgheight}{#3}
    \settowidth{\imgwidth}{#3}
    \ifthenelse{\lengthtest{\imgheight = 0pt}}{\setlength{\imgwidth}{0pt}}{\addtolength{\optwidth}{-1\imgwidth}}
    %\showthe\optwidth
    %\showthe\textwidth
    \savebox{\descbox}{\parbox[t]{\optwidth}{#1}}
    \savebox{\optbox}{\parbox[t]{\optwidth}{
    #1 \ \\ #2
    }}
    \settoheight{\descheight}{\usebox{\descbox}}
    \settodepth{\descdepth}{\usebox{\descbox}}
    \setlength{\desctotalheight}{\descheight}
    \addtolength{\desctotalheight}{\descdepth}
    \addtolength{\desctotalheight}{3.33pt}
    \settoheight{\optheight}{\usebox{\optbox}}
    \settodepth{\optdepth}{\usebox{\optbox}}
    \setlength{\opttotalheight}{\optheight}
    \addtolength{\opttotalheight}{\optdepth}
    \addtolength{\heightdiff}{\imgheight}
    \addtolength{\heightdiff}{-1\opttotalheight}
    \ifthenelse{\lengthtest{\heightdiff > 0pt}}{\setlength{\comlength}{\heightdiff}}{}
    \savebox{\combox}{\parbox[t]{\optwidth}{#1 \ \\ #2 
    \vspace*{\comlength} 
        }
    }
    \ifthenelse{\lengthtest{\imgheight = 0pt}}{\def\idxcor{\relax}}{\setlength{\idxcorheight}{\descheight}%
    \addtolength{\idxcorheight}{0pt}%
    \def\idxcor{\vspace*{\idxcorheight}}}
    %\showthe\idxcorheight
    \begin{minipage}[t]{\indexlength}
%    \hrule height-\idxcorheight depth-\idxcorheight
    %\idxcor
    \hfill \thenq. 
    \end{minipage}\hspace*{\idxsep}\begin{minipage}[t]{\contl}
    %\vspace{0pt}
   % \vspace*{-\descheight}
    \ifthenelse{\lengthtest{\imgheight = 0pt}}
        { % then
        \parbox[t]{\optwidth}{#1} #2
        }
        { % else
        %\vspace*{-.4em}
        \begin{window}[0,r,{#3},{}]
        \ifthenelse{\lengthtest{\desctotalheight > \imgheight}}
            { % then
            #1 
            \end{window} \setlength{\optwidth}{\textwidth}
             #2 }
            { % else
            \ifthenelse{\lengthtest{\opttotalheight > \imgheight}}
                {\usebox{\optbox}}
                {\usebox{\combox}}\end{window}}}
    %\showthe\optwidth
    %\showthe\imgwidth
    %\showthe\textwidth
    %\showthe\descheight
    %\showthe\descdepth
    %\showthe\imgheight
    %\showthe\opttotalheight
    %\showthe\comlength
    %\end{varwidth}
    \end{minipage}

}
\newcommand{\klxitemm}[2]{
    \settowidth{\imgwidth}{#1}
    %\showthe\imgwidth
    \ifthenelse{\lengthtest{\imgwidth=0pt}}{}{
        \addtolength{\imgwidth}{\imgsep}
    }
    \addtolength{\contl}{-\imgwidth}
    \setlength{\optwidth}{\contl}
    \begin{minipage}[t]{\indexlength}
    \hfill \thenq.
    \end{minipage}\hspace*{\idxsep}%
    \begin{minipage}[t]{\contl}
    #2
    \end{minipage}\hspace*{\imgsep}%
    \begin{minipage}[t]{\imgwidth}
    \vspace{-1em}%
    #1
    \end{minipage}
}
\newcommand{\klxitemans}[1]{
    \thenq. #1 
}
\def\qssep{\hrule height0pt\vspace*{5pt}}   
\newcommand{\klxqs}[2]{\par%
    \stepcounter{nqq}
    \settowidth{\imgwidth}{#1}
    \ifthenelse{\lengthtest{\imgwidth=0pt}}{}{
        \addtolength{\imgwidth}{\imgsep}
    }
    \setlength{\sbcontl}{\contl}
    \addtolength{\sbcontl}{-\imgwidth}
    \addtolength{\sbcontl}{-\imgsep}
    \addtolength{\sbcontl}{-\indexlength}
    \begin{minipage}[t]{\indexlength}
    \hfill (\thenqq)
    \end{minipage}\hspace*{\idxsep}%
    \begin{minipage}[t]{\sbcontl}
    #2
    \end{minipage}\hspace*{\imgsep}%
    \begin{minipage}[t]{\imgwidth}
    \vspace{-1em}%
    #1
    \end{minipage}
    \qssep
}   
\newcommand{\klxqsans}[1]{\par%
    \stepcounter{nqq}
    (\thenqq) #1 
}
\newcommand{\klxqss}[2]{\par%
    \stepcounter{nqqq}
    \settowidth{\imgwidth}{#1}
    \ifthenelse{\lengthtest{\imgwidth=0pt}}{}{
        \addtolength{\imgwidth}{\imgsep}
    }
    \setlength{\ssbcontl}{\sbcontl}
    \addtolength{\ssbcontl}{-\imgwidth}
    \addtolength{\ssbcontl}{-\indexlength}
    \begin{minipage}[t]{\indexlength-0.5em}
    \hfill \roman{nqqq}
    \end{minipage}\hspace*{\idxsep}
    \begin{minipage}[t]{\ssbcontl}
    #2
    \end{minipage}\hspace*{\imgsep}%

}
\newenvironment{displayimgs}{
    \centering \bgroup
}{
    \egroup \par
}
\newcommand{\tabximg}[2]{
    \begin{center}
        \vspace*{-1em}

        \vspace*{-1em}
    \end{center}
}

\cfoot{
    \ifthenelse%
        {\thepage > \pageref{endofquestion}}%
        {答案}%
        {第 \thepage 页，共 \pageref{endofquestion} 页}%
}
\newcommand{\klxanshead}[1]{
    \label{endofquestion}
    \twocolumn[\vspace{-1.5em}\centering  #1---答案 \vspace{.5em} ]

    \setlength{\contl}{\columnwidth-1em}
    \setcounter{ns}{0}
    \setcounter{nq}{0}
    \CJKfontspec{STKaiti}% redefine in Windows or Linux, default for OS X
    \fontsize{8pt}{8pt}\selectfont
}
\newwrite\MyWrite
\immediate\openout\MyWrite=\jobname.pos\relax
