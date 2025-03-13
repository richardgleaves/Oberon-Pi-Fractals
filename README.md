## Oberon Pi Fractals

These modules demonstrate the formal expressiveness of iterated function systems (IFS) for generating fractal imagery in the Oberon Pi system.

Michael Barnsley describes IFS as “a simple, beautiful, deep, unified, natural, mathematical framework that all undergraduates in the mathematical sciences and engineering should know”.


### Fractal modules

The eight modules *Bolt*, *Dragon*, *Fern*, *Galaxy*, *Ice*, *Leaf*, *Ruler*, and *Shrimp* all support a common *Draw* command, which renders the associated fractal image in a graphics window opened in the Oberon system display.

While these modules can be used independently, they are most compelling when used together as a group. The file *Fractal.Proj* serves as a project file for working with these modules as a collection – for details on project files see the Oberon Pi system user guide.


### Support modules

The modules *XYplane* and *RandomNumbers* are used by the eight fractal modules.

*XYplane* is a new version of the module with the same name that is provided in the Oberon Pi release. It is functionally equivalent to the original version, except that the procedure “XYplane.Open” now accepts a window title as a parameter.

*XYplaneDemo* is a new version of the module with the same name that is provided in the Oberon Pi release. It has been updated to use the newer *XYplane* module.


### Using the modules

To render a fractal image, execute the corresponding module command:
```
   Bolt.Draw
   Ice.Draw
```
Note that the images do not appear instantly – on the Raspberry Pi, they can take up to four seconds to render completely. During this time, the Oberon mouse pointer disappears to indicate that the system is busy. The mouse pointer reappears once the image has been completed.

The graphics window opened by the fractal modules does not support certain conventions of the Oberon window system. Only one window instance can be open at a time, with successive fractal modules overwriting the existing image rather than creating a new window. The window also cannot be resized or overlaid by another window without deforming the image it contains.

NOTE – The graphics modules *Hilbert*, *Sierpinski*, and *Checkerboard* in the Oberon Pi release do not use module *XYplane*, and so do not have the above restrictions.


### Modifying the modules

Each fractal module is parameterized for the position and size of the image in the graphics window, and the number of iterations performed to render the image.

It can be instructive to vary these parameters for each of the fractal modules. In particular, performing additional iterations may not result in a better-looking image (though this is ultimately a subjective matter).


### Sources

For an introduction to IFS see "Fractals Everywhere", by Michael F. Barnsley.

The fractal modules are based on an example presented in chapter 7 of “Programming in Oberon: Steps Beyond Pascal and Modula”, by Martin Reiser and Niklaus Wirth.

The *XYplane* module was developed by Martin Reiser, with changes by Hans Klaver (hk) and Richard Gleaves (RG).

