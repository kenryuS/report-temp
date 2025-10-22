augroup latex_generic_abbr
    iabbrev <buffer> trm <Esc>a\textrm{}<Esc><Left>a
    iabbrev <buffer> ttt <Esc>a\texttt{}<Esc><Left>a
    iabbrev <buffer> tbf <Esc>a\textbf{}<Esc><Left>a
    iabbrev <buffer> tit <Esc>a\textit{}<Esc><Left>a
    iabbrev <buffer> inm <Esc>a$$<Esc><Left>a
    iabbrev <buffer> simpletexbang <Esc>a\documentclass[xelatex,a4paper,11pt,ja=standard]{bxjsarticle}<CR><CR>\usepackage{tex/preamble}<CR>\usepackage{tex/simple-title}<CR>\usepackage{tex/report-paper}<CR><CR>\reporttitle{}<CR>\reportauthor{}<CR>\reportdate{}{}{}<CR>\turnindate{}{}{}<CR><CR>\begin{document}<CR><Tab>\simpletitle<CR>\end{document}<Esc>gg6jf{a
    iabbrev <buffer> detailedtexbang <Esc>a\documentclass[xelatex,a4paper,11pt,ja=standard]{bxjsarticle}<CR><CR>\usepackage{tex/preamble}<CR>\usepackage{tex/detailed-title}<CR>\usepackage{tex/report-paper}<CR><CR>\reporttitle{}<CR>\reportauthor{}<CR>\reportdate{}{}{}<CR>\turnindate{}{}{}<CR>\schoolname{}<CR>\department{}<CR>\subject{}<CR>\professor{}<CR>\studentid{}<CR>\seatingnum{}<CR><CR>\begin{document}<CR><Tab>\detailedtitle<CR>\end{document}<Esc>gg6jf{a
augroup END
