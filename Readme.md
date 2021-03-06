# TermCalc 

## Description
This is a simple Terminal Inline Calculator. It allows you to handle simple calculations without Gtk or GUI, simply by typing the operation to do and the numbers. For now it allows you to only perform classical arithmetic operations plus Pow, SQRT, Square, Cube, CBRT, Abs, with either integer numbers or float numbers. In the next releases i will add the aggregation of two or more functions to compute more complex calculations, plus more of the standard math things such as Logarithms, Sin, Cos,...

## Usage
First of all, you will have to download this tarball file in order to install it:
~~~
wget http://luiggi.it/Packages/termcalc-0.5.tar.gz
~~~

After this, on the same terminal window, just type: (Warning: You may run "make" and "make install" in sudo mode)
```
./configure
make
make install
```
And wait the installation progress. After that, you should be able to use TermCalc. Just type:
```
termCalc --help
```

### Examples

If you want to do something like: 1+2+3+4+5+6+7 just type:
~~~
termCalc add 1 2 3 4 5 6 7
~~~
or
~~~
termCalc -a 1 2 3 4 5 6 7
~~~
or
~~~
termCalc --add 1 2 3 4 5 6 7
~~~

And the output will be:
```
Result: 28
```
That's it!

To see the complete list of available commands just type:
~~~
termCalc -h
~~~
or
~~~
termCalc --help
~~~
To check your version just type:
~~~
termCalc -v
~~~
or
~~~
termCalc --version
~~~

### Uninstall
If for some reason you will then wish to uninstall TermCalc, just go to the same directory you just cloned and open a terminal window, then type:
~~~
make uninstall
~~~
and wait until the uninstall process has completed. After the message, you can then remove the entire directory with the remaining files!

## LICENSE
This software is completely free; see <a href="LICENSE">GNU General Public License</a>.