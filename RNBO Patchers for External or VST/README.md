# Max/MSP RNBO Patches for External Creation: br.tanh.rnbo.1.1 and br.tanh.stereo.rnbo.1.1  
   
By Brian Riordan  
[guaguanco127@gmail.com](mailto:guaguanco127@gmail.com)  
[brianriordanmusic@gmail.com](mailto:brianriordanmusic@gmail.com)  
[https://www.brianriordanmusic.com/](https://www.brianriordanmusic.com/) 
  
Repository for br.tanh.1.1, with all related files, can be found here: [https://github.com/guaguanco127/br.tanh](https://github.com/guaguanco127/br.tanh)  
Additional programs can be found here: [https://github.com/guaguanco127/br.max](https://github.com/guaguanco127/br.max)

These files were created with Max 9 and RNBO.

## Table of Contents 

[About](#About)   
[What is an External for Max/MSP?](#External)  
[How To Export as a Max/MSP External](#Export)  
[A Note on VST and AU Plugins](#VST)  
[Credits](#Credits) 

## <a name="About"></a>About

A normalized, antialiased tanh saturator: a full-scale input always peaks at +-1, so Drive changes the color, not the loudness, from clean (0) to near-square (64). Mix blends the dry signal back in. Both glide over 10 ms, so they never click.

There are two patches:

| Patch | Inlets / Outlets | Same as |
|---|---|---|
| br.tanh.rnbo.1.1 | Input, Drive, Mix / Output | br.tanh.1.1 |
| br.tanh.stereo.rnbo.1.1 | Left, Right, Drive, Mix / Left, Right | br.tanh.stereo.1.1 |

Inside each [rnbo~], Drive (0 - 64, default 2) and Mix (0 - 1, default 1) are params, and the Drive and Mix inlets set the same params, so each external has the same inlets and outlets as its plain abstraction. The gen~ code inside is the same as the abstraction's, so you can also copy it into your own RNBO patches. To try one, drop a sample into the [playlist~] and use the attrui controls.

There is no State output: whatever drives the external or plugin already knows the values, and in a DAW they are normal plugin parameters.

## <a name="External"></a>What is an External for Max/MSP?

An external is a type of object that does not come with your Max/MSP library. Unlike the typical objects that you can call on all versions of Max/MSP, an external must be installed on the user's computer a specific way. 

## <a name="Export"></a>How To Export as a Max/MSP External

1. Make sure Max 9 is installed on your computer, and that you have an RNBO license.

2. Open br.tanh.rnbo.1.1.maxpat (mono) or br.tanh.stereo.rnbo.1.1.maxpat (stereo).

3. Double-click the [rnbo~] object while the patch is locked.

4. Click "Show Export Sidebar" on the right-hand side.

5. Select "Max External Export".

6. Name the object br.tanh.1.1~ (or br.tanh.stereo.1.1~) and export.

**Keep the ~ at the end of the name.** Without it, the external has exactly the same name as the abstraction, and Max loads whichever one it finds first, so you can't be sure which one you're using. The ~ also follows the Max convention for objects that process audio. Any other name is fine as long as it isn't the name of an abstraction you also use.

7. Copy the exported .mxo (Mac) or .mxe64 (Windows) into a folder on Max's search path, for example Documents/Max 9/Externals, and add that folder in Options > File Preferences if it isn't listed. Then create an object with that name in any patch. It has the same inlets and outlets as the plain abstraction, except that Drive and Mix take numbers only.

## <a name="VST"></a>A Note on VST and AU Plugins

RNBO can also export these patches as VST3 or AU plugins (Export Sidebar > Audio Plugin Export). Drive and Mix become the plugin's parameters. For a DAW track, export the stereo patch.

## <a name="Credits"></a>Credits

Antiderivative anti-aliasing (Parker, Zavalishin & Le Bivic, "Reducing the Aliasing of Nonlinear Waveshaping Using Continuous-Time Convolution", DAFx-16, 2016).
