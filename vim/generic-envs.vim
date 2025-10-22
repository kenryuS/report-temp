augroup latex_generic_envs_abbr
    iabbrev <buffer> emptyenv <Esc>i\begin{}<CR><CR>\end{}<Esc>k
    iabbrev <buffer> ugather <Esc>i\begin{gather*}<CR><CR>\end{gather*}<Esc>k
    iabbrev <buffer> uequi <Esc>i\begin{equation*}<CR><CR>\end{equation*}<Esc>k
    iabbrev <buffer> equi <Esc>i\begin{equation}<CR><CR>\end{equation}<Esc>k
    iabbrev <buffer> centerenv <Esc>i\begin{center}<CR><CR>\end{center}<Esc>k
    iabbrev <buffer> codelsenv <Esc>i\begin{lstlisting}[language=.,title={.}]<CR><CR>\end{lstlisting}<Esc>2k0f.vc
    iabbrev <buffer> itemenv <Esc>i\begin{itemize}<CR><CR>\end{itemize}<Esc>k
    iabbrev <buffer> enumenv <Esc>i\begin{enumerate}<CR><CR>\end{enumerate}<Esc>k
    iabbrev <buffer> figenv <Esc>i\begin{figure}[tbh]<CR>\centering<CR><CR>\end{figure}<Esc>k
augroup END
