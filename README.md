# Max/MSP Patches, Abstractions, Externals, RNBO, VSTs, and Ableton Max for Live 

## br.tanh.1.0



By Brian Riordan  
[guaguanco127@gmail.com](mailto:guaguanco127@gmail.com)  
[brianriordanmusic@gmail.com](mailto:brianriordanmusic@gmail.com)  
[https://www.brianriordanmusic.com/](https://www.brianriordanmusic.com/) 
  
Repository for br.tanh.1.0, with all related files, can be found here: [https://github.com/guaguanco127/br.tanh](https://github.com/guaguanco127/br.tanh)  
Additional programs can be found here: [https://github.com/guaguanco127/br.max](https://github.com/guaguanco127/br.max)

These files were created with Max 9. 

## Links

[About](#About)   
[Max/MSP Abstraction](https://github.com/guaguanco127/br.tanh/tree/main/MaxMSP%20Abstraction) To use as an abstraction within Max/MSP   

This is a Max/MSP-only release (no Max for Live device).

## <a name="About"></a>About

A mono tanh saturator for Max/MSP, built in gen~, for synthesis: audio oscillators and LFOs alike.

**Normalized:** A full-scale input always peaks at +-1, so Drive changes the color, not the loudness. Drive 0 is clean, low Drive gently rounds the peaks, and high Drive turns any wave into a near-square, so Drive alone is a one-knob sweep from clean to square.

**Parallel saturation:** Mix blends the dry signal back in at any Drive. For example, heavy Drive at a low Mix keeps the clean fundamental with a layer of harmonics on top.

**Antialiased:** First-order ADAA (antiderivative antialiasing), computed so it stays correct even while Drive moves.

**Click-free controls:** Drive and Mix always glide over 10 ms.

**Mono, LFO-safe:** One signal in, one out. There is no DC filter, so an LFO keeps its full shape and center.

**Pairs with br.shaper:** The inlets (Input, Drive, Mix) match [br.shaper](https://github.com/guaguanco127/br.shaper)'s, so you can swap between them without rewiring.

The example patch (_br.tanh.example.1.0.maxpat) has a tab for audio and a tab with a saturated LFO on a scope.
