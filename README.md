# Mindscape protection installer for Commodore floppy disks
This tool uses a a Commodore 64 and 1541 drive to write illegal GCR data to track/sector 1/0 of a cloned Mindscape floppy disk, in order to cause weak bits at read time and pass the Mindscape copy protection.\
The tool is provided for research purposes only. It's the end user's responsibility to use it:
- in a way that does not infringe copyright laws and agreements still in effect, and
- only for personal purposes, without any intent to sell or distribute illegal clones of original software.

## Notes
- Assemble source files with `64tass` by Soci/Singular. Version 1.56.2625 from [Sourceforge](https://sourceforge.net/projects/tass64/) has been successfully tested. A Windows executable is provided for user convenience.
- The `makedisk` tool is available from Covert Bitops' [Tools page](https://cadaver.github.io/tools.html). A Windows executable is provided for user convenience.
- The `petcat` tool is available from VICE's [Web page](http://vice-emu.sourceforge.net/index.html#download). A Windows executable is provided for user convenience.
- The tool `file2data` is used. Build this tool first. A Windows executable is provided for user convenience.
- To use the provided `Makefile` you need GNU `make`. A Windows executable is provided for user convenience.
- Under Windows you might want to run `win32/mindscapevar.bat` to setup your build environment, then either run `make` or the provided batch file.

## Games that use this protection
So far I was able to confirm that this protection is used in Zaxxon.
