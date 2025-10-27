augroup latex_circuitikz_abbr
    iabbrev <buffer> ctikz <Esc>i\begin{circuitikz}<CR><CR>\end{circuitikz}<Esc>ki
    iabbrev <buffer> tobatt <Esc>ato [battery2, invert, v={$E$}]<Esc>a
    iabbrev <buffer> tores <Esc>ato [R={$R$}]<Esc>a
    iabbrev <buffer> toslo <Esc>ato [short, o-]<Esc>a
    iabbrev <buffer> toslc <Esc>ato [short, *-]<Esc>a
    iabbrev <buffer> tosro <Esc>ato [short, -o]<Esc>a
    iabbrev <buffer> tosrc <Esc>ato [short, -*]<Esc>a
    iabbrev <buffer> ndl <Esc>anode[left]{.}<Esc>5hf.vc
    iabbrev <buffer> ndr <Esc>anode[right]{.}<Esc>5hf.vc
    iabbrev <buffer> ndc <Esc>anode{.}<Esc>5hf.vc
    iabbrev <buffer> ohm <Esc>a\Omega<Esc>a
augroup END
