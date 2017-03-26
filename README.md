# The Problem
A common problem I have stems from the fact that I use YCM and cscope. YCM
tends to work well, but not on the Linux source tree, which uses gcc. The gnu
language extensions appear to mess up libclang when it comes to figuring out
the type that a macro will expand to, and YCM uses libclang to analyze c-family
languages. Long story short, YCM's GoTo doesn't always work, so sometimes I'm
forced to use cscope for code search instead.

# The Solution
Most of the time, my ENTER key is bound to invoke YcmCompleter GoTo. But when I
have built a cscope database named 'cscope.out', it's because I want to use
cscope for the project instead. This plugin searches upwards from the currently
open file's cwd, looking for a file by the name of 'cscope.out'. If it finds
such a file, it will map the ENTER key (locally) to perform a cscope lookup. If
a cscope database is NOT found, the plugin maps the enter key to YcmCompleter
Goto.

# Prerequisites
* valloric/YouCompleteMe
* vim-scripts/cscope.vim
