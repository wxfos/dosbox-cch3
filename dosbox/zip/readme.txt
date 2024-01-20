0.74-3
A security release for DOSBox 0.74:
- Fixed that a very long line inside a bat file would overflow the parsing 
  buffer (CVE-2019-7165 by Alexandre Bartel)
- Added a basic permission system so that a program running inside DOSBox 
  can't access the contents of /proc (e.g. /proc/self/mem) when / or /proc
  were (to be) mounted (CVE-2019-12594 by Alexandre Bartel)  
- Several other fixes for out of bounds access and buffer overflows.
- Some fixes to the OpenGL rendering.

It's recommended to use config -securemode when dealing with untrusted
files. 
The game compatibility should be identical to 0.74 and 0.74-2.

Full changelog:

0.74-3
  - Implement basic file access control for files available from within
    the emulation, so that programs running inside DOSBox can't access
    /proc (e.g. /proc/self/mem). (CVE-2019-12594)
  - Unify unmounting code and add some protections against out of bound access
    when DOS_DRIVES is not 26.
  - Use correct type for return value of strlen.
  - Change scan3x to a bit brighter.
  - Fix unitialized access to some isoDrive fields and improve stability 
    when switching CD images.
  - Small fix to hq3x.
  - Fix 256 colour mode encoding in zmbv.dll.
  - Some small aliassing fix.
  - Change SET to check the size of the MCB when adding variables. Fixes
    hangs with Norton Commander.
  - Check buffer length before doing tab completion.
  - Correct buffer overflow with very long lines in bat files. (CVE-2019-7165)
  - Correct the boundary check for the internal programs array.
  - Increase stability in max cycles mode by increasing the lower bound.
  - Fix command prompt in windows 3.11 with dynrec core.
  - Fix Win64 dynrec core.  
  - Always clear buffers before drawing in OpenGL mode. Fixes artifacts with 
    drivers that have more than 2 buffers and overlays. 
  - Fix red border that appeared when scaling the image in OpenGL 
    mode with Nvidia on Linux and Mac.
  - Change default output to opengl on Mac, as surface is very slow there in 64 bit.
  - Add workaround for the mouse unlocking problem with X.org 1.20.1.
  - Fix table access when USE_FULL_TLB is undefined (non-default configuration).
  - Several fixes to prevent compilation errors.
  - Update Visual studio file to fix missing files from 0.74-2.
  