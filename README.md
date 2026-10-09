# Max/MSP Patches, Abstractions, Externals, RNBO and VSTs

## br.tanh.1.1



By Brian Riordan  
[guaguanco127@gmail.com](mailto:guaguanco127@gmail.com)  
[brianriordanmusic@gmail.com](mailto:brianriordanmusic@gmail.com)  
[https://www.brianriordanmusic.com/](https://www.brianriordanmusic.com/) 
  
Repository for br.tanh.1.1, with all related files, can be found here: [https://github.com/guaguanco127/br.tanh](https://github.com/guaguanco127/br.tanh)  
Additional programs can be found here: [https://github.com/guaguanco127/br.max](https://github.com/guaguanco127/br.max)

These files were created with Max 9, or RNBO.

## Links

[What's new in 1.1](#New11)  
[About](#About)   
[State outlet](#State)  
[Max/MSP Abstraction](https://github.com/guaguanco127/br.tanh/tree/main/MaxMSP%20Abstraction) To use as an abstraction within Max/MSP   
[Max/MSP RNBO for External or VST](https://github.com/guaguanco127/br.tanh/tree/main/RNBO%20Patchers%20for%20External%20or%20VST) To build your own Max external or VST/AU plugin, or to reuse the code in your own RNBO patches (needs RNBO)  

You can use it as an abstraction within Max/MSP. With RNBO you can also build your own Max external or plugin from the included RNBO patches.

## <a name="New11"></a>What's new in 1.1

- **Stereo:** br.tanh.stereo.1.1 and br.tanh.stereo.ui.1.1 saturate a stereo pair with one set of controls (Left, Right, Drive, Mix in; Left, Right out). Both channels share Drive and Mix and keep their own anti-aliasing memory.
- **Two files per width:** br.tanh.1.1 is the plain object, whose Drive and Mix inlets take signals as well as numbers (patch an LFO into Drive), and br.tanh.ui.1.1 is the version with dials, for a [bpatcher].
- **State outlet** on the .ui versions (the last outlet): sends drive and mix as named messages the moment they change.
- New RNBO patches, mono and stereo, to build your own Max external or VST/AU plugin.
- New example tabs: plain object, stereo and State outlet.
- Inlets, the Output outlet and the sound are unchanged. If you used 1.0 in a [bpatcher], choose br.tanh.ui.1.1; if you used it as an object box, type br.tanh.1.1.

## <a name="About"></a>About

A tanh saturator for Max/MSP, mono and stereo, built in gen~, for synthesis: audio oscillators and LFOs alike.

**Normalized:** A full-scale input always peaks at +-1, so Drive changes the color, not the loudness. Drive 0 is clean, low Drive gently rounds the peaks, and high Drive turns any wave into a near-square, so Drive alone is a one-knob sweep from clean to square.

**Parallel saturation:** Mix blends the dry signal back in at any Drive. For example, heavy Drive at a low Mix keeps the clean fundamental with a layer of harmonics on top.

**Antialiased:** First-order ADAA (antiderivative antialiasing), computed so it stays correct even while Drive moves.

**Click-free controls:** Drive and Mix always glide over 10 ms.

**Mono or stereo, LFO-safe:** One signal in and out, or a stereo pair with the stereo files. There is no DC filter, so an LFO keeps its full shape and center.

**Pairs with br.shaper:** The inlets (Input, Drive, Mix) match [br.shaper](https://github.com/guaguanco127/br.shaper)'s, so you can swap between them without rewiring.

**Signal control:** The plain objects take signals in Drive and Mix, so an LFO or envelope can sweep the saturation.

The example patch (_br.tanh.example.1.1.maxpat) has tabs for audio, a saturated LFO on a scope, the plain object with an LFO on Drive, both stereo files, and the State outlet.

## <a name="State"></a>State outlet

The last outlet of br.tanh.ui.1.1 and br.tanh.stereo.ui.1.1 (State) sends the current settings as named messages the moment they change, for example `drive 8.`, `mix 0.5`. Use it to keep a display, Mira or another patch in sync. Pick them out by name with [route drive mix]. Repeats are filtered out.

## <a name="Credits"></a>Credits

Antiderivative anti-aliasing (Parker, Zavalishin & Le Bivic, "Reducing the Aliasing of Nonlinear Waveshaping Using Continuous-Time Convolution", DAFx-16, 2016).
