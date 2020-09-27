# ConfigureAD

Runs `dsconfigad` with settings appropraite for my environment:

* `-mobile enable` (prefer mobile accounts)
* `-shell /bin/zsh` (macOS defaults to zsh now, AD users expect this too)
* `-groups Mac-LocalAdmin` (this AD group gets local admin rights)
