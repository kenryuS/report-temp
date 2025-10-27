augroup latex_generic_abbr
    iabbrev <buffer> trm <Esc>a\textrm{}<Esc><Left>a
    iabbrev <buffer> ttt <Esc>a\texttt{}<Esc><Left>a
    iabbrev <buffer> tbf <Esc>a\textbf{}<Esc><Left>a
    iabbrev <buffer> tit <Esc>a\textit{}<Esc><Left>a
    iabbrev <buffer> sec <Esc>a\section{.}<Esc>3hf.vc
    iabbrev <buffer> ssec <Esc>a\subsection{.}<Esc>3hf.vc
    iabbrev <buffer> inm <Esc>a$$<Esc><Left>a
    iabbrev <buffer> m/ <Esc>a\frac{}{}<Esc>3ha
    iabbrev <buffer> mpl <Esc>a\left(<Esc>a
    iabbrev <buffer> mpr <Esc>a\right)<Esc>a
    iabbrev <buffer> minv <Esc>a\frac{1}{.}<Esc>3hf.vc
augroup END

function! Simpletexbang()
    let l:name = input("Name: ")
    let l:title = input("Title: ")
    let l:todayYear = strftime('%Y')
    let l:todayMonth = strftime('%m')
    let l:todayDay = strftime('%d')
    execute "normal i\\documentclass[xelatex,a4paper,11pt,ja=standard]{bxjsarticle}\n\n\\usepackage{tex/preamble}\n\\usepackage{tex/simple-title}\n\n"
    execute "normal i\\reportauthor{" . l:name . "}\n"
    execute "normal i\\reporttitle{" . l:title . "}\n"
    execute "normal i\\reportdate{" . l:todayYear . "年}{" . l:todayMonth . "月}{" . l:todayDay . "日}\n"
    execute "normal i\\turnindate{年}{月}{日}\n\n\\begin{document}\\end{document}"
    execute "normal 02f{bhi\n\\simpletitle\n"
endfunction

function! Detailedtexbang()
    let l:name = input("Name: ")
    let l:id = input("Student ID: ")
    let l:seat = input("Seating Number: ")
    let l:title = input("Title: ")
    let l:school = input("School: ")
    let l:dep = input("Department: ")
    let l:subj = input("Subject: ")
    let l:prof = input("Professor Name: ")
    let l:todayYear = strftime('%Y')
    let l:todayMonth = strftime('%m')
    let l:todayDay = strftime('%d')
    execute "normal i\\documentclass[xelatex,a4paper,11pt,ja=standard]{bxjsarticle}\n\n\\usepackage{tex/preamble}\n\\usepackage{tex/detailed-title}\n\n"
    execute "normal i\\reportauthor{" . l:name . "}\n"
    execute "normal i\\reporttitle{" . l:title . "}\n"
    execute "normal i\\reportdate{" . l:todayYear . "年}{" . l:todayMonth . "月}{" . l:todayDay . "日}\n"
    execute "normal i\\turnindate{年}{月}{日}\n"
    execute "normal i\\schoolname{" . l:school . "}\n"
    execute "normal i\\department{" . l:dep . "}\n"
    execute "normal i\\subject{" . l:subj . "}\n"
    execute "normal i\\professor{" . l:prof . "}\n"
    execute "normal i\\studentid{" . l:id . "}\n"
    execute "normal i\\seatingnum{" . l:seat . "}\n"
    execute "normal i\n\\begin{document}\\end{document}"
    execute "normal 02f{bhi\n\\detailedtitle\n"
endfunction
