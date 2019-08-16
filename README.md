<img src="icon.png" align="right" />

> its not for any html docs it is for [James S. Plank](http://web.eecs.utk.edu/~plank/) and his cs360 [lecture notes](http://web.eecs.utk.edu/~plank/plank/classes/cs360/lecture_notes.html) and [exams](http://web.eecs.utk.edu/~plank/plank/classes/cs360/tests.html)

> and program is actually doing just ``` html2text lecture.html | pygmentize > lecture.txt ```

## Dependencies (Homebrew/Linuxbrew)
```
$ brew install python
$ brew unlink python && brew link --overwrite python # make sure python links to python2
$ pip2 install --upgrade pip setuptools # upgrade to latest pip2
$ pip2 install pygments
$ brew install html2text
```
## Suggestion
```
$ alias pcat='pygmentize -f terminal256 -O style=monokai -g'
```
## Installation
```
$ git clone https://github.com/oguzhanlarca/html2pcat.git
$ cd html2pcat
$ mkdir bin build
$ make
$ make install
$ html2pcat
```
### Manuel Installation in bash shell
```
$ gcc -o html2pcat pretty.c
$ chmod a+x html2pcat
```
## Upgrade later
```
$ pip3 install pygments --upgrade
$ brew upgrade html2text
```
## Pygmentize Styles

* friendly:
    A modern style based on the VIM pyte theme.
* autumn:
    A colorful style, inspired by the terminal highlighting style.
* manni:
    A colorful style, inspired by the terminal highlighting style.
* monokai:
    This style mimics the Monokai color scheme.
* pastie:
    Style similar to the pastie default style.
* native(default):
    Pygments version of the "native" vim theme.
* rrt:
    Minimalistic "rrt" theme, based on Zap and Emacs defaults.
* rainbow-dash:
    A bright and colorful syntax highlighting theme.

### Authors
- [oguzhanlarca](https://github.com/oguzhanlarca) Sakarya Universitesi - Bilgisayar Muhendisligi - Sistem Programlama Ders Notlari
