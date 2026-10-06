# Max/MSP Abstractions:   
## br.tanh.1.0



By Brian Riordan  
[guaguanco127@gmail.com](mailto:guaguanco127@gmail.com)  
[brianriordanmusic@gmail.com](mailto:brianriordanmusic@gmail.com)  
[https://www.brianriordanmusic.com/](https://www.brianriordanmusic.com/) 
  
Repository for br.tanh.1.0, with all related files, can be found here: [https://github.com/guaguanco127/br.tanh](https://github.com/guaguanco127/br.tanh)  
Additional programs can be found here: [https://github.com/guaguanco127/plugins](https://github.com/guaguanco127/plugins)

These files were created with Max 9. 

## Table of Contents 

[About](#About)   
[What is an abstraction?](#Abstraction)  
[How To Install](#Install)  
[How To Use](#Use)  
[Example Patch](#Example)  
 
 

## <a name="About"></a>About

A mono tanh saturator for Max/MSP, built in gen~, for synthesis: audio oscillators and LFOs alike.

**Normalized:** The curve is tanh(Drive x input) / tanh(Drive), so a full-scale input always peaks at +-1: Drive changes the color, not the loudness. Drive 0 is clean, low Drive gently rounds the peaks, and high Drive turns any wave into a near-square, so Drive alone is a one-knob sweep from clean to square.

**Parallel saturation:** Mix blends the dry signal back in at any Drive. For example, heavy Drive at a low Mix keeps the clean fundamental with a layer of harmonics on top.

**Antialiased:** First-order ADAA (antiderivative antialiasing): each output sample is the average of the curve between the last input sample and this one, which removes most of the aliasing that heavy saturation causes. It is recomputed every sample under the current Drive, so it stays correct even while Drive moves.

**Click-free controls:** Drive and Mix always glide over 10 ms, so moving them never clicks.

**Mono, LFO-safe:** One signal in, one out. There is no DC filter, so an LFO keeps its full shape and center.

**Pairs with br.shaper:** The inlets (Input, Drive, Mix) match [br.shaper](https://github.com/guaguanco127/br.shaper)'s fold, wrap, clip and buchla shapers, so you can swap between them without rewiring.

### Controls

**Drive:** How hard the signal is pushed into tanh, from 0 to 64. 0 is clean, 1 gently rounds the peaks, 64 is nearly square, and the output peak stays at +-1 throughout. The dial is curved, so most of its travel covers 0 to 10. Low Drive slightly lifts the quieter parts of the signal, since the peaks stay put while the rest is pushed up toward them. The default is 2.

**Mix:** 0 is the dry input, 1 is fully saturated. The default is 1.

### How high can Drive go?

High Drive makes harmonics far above the pitch. Keep Drive x pitch under about 10 - 15 kHz and the sound stays clean: a 110 Hz bass is fine at 64, while at 440 Hz aliasing starts around 25 - 35. LFOs have no limit.

## <a name="Abstraction"></a>What is an Abstraction?

An abstraction is a subpatcher that is saved as an external file, and can be used just like a standard Max object. As long as your abstraction can be found in the Max file path, you can type its name into a new object box and it will be loaded directly into your patch.  

By saving your logic in an abstraction, you can create modules that can be used in future work with little or no additional programming. This allows you to parlay your Max knowledge into more efficient work in the future, and will help you create programming systems that are modular and easier to maintain.

## <a name="Install"></a>How To Install 

1. Make sure you have Max 9 installed in your computer. And, make sure you are using a Max patch that is inside of a folder.  

2. Copy and paste br.tanh.1.0.maxpat inside of the same folder as the Max patch you are using.

3. To use the built-in dials, create a bpatcher object. Then, go inside of its inspector, select "choose" next to "Patcher File" and select the abstraction located within the same folder as your project. Size the bpatcher to 110 x 79 to show all of the controls.

4. Alternatively, create an object with the abstraction's name ([br.tanh.1.0], do not include brackets) and control it through its inlets (see below).

## <a name="Use"></a>How To Use

The first inlet is your signal: audio or an LFO. Every control has its own inlet after that, in the same order as the dials. Sending a value to an inlet moves its on-screen dial too, so the display always matches the sound. Values outside a dial's range are limited to that range. Hover over an inlet in Max to see its range and default.

| Inlet | Control | Type | Range | Default |
|---|---|---|---|---|
| 1 | Input | Signal | audio or LFO | |
| 2 | Drive | Float | 0 - 64 | 2 |
| 3 | Mix | Float | 0 - 1 | 1 |

| Outlet | Name | Type |
|---|---|---|
| 1 | Output | Signal |

For stereo, use one br.tanh per channel.

## <a name="Example"></a>Example Patch

Open _br.tanh.example.1.0.maxpat (keep it in the same folder as the abstraction). The first page introduces br.tanh; the tabs at the top hold the examples.

- **audio:** br.tanh on a sine, saw or microphone source, with a frequency box. Turn on the audio with the toggle, then raise the gain slider, which starts muted. Raise Drive and watch the spectroscope~: more harmonics, same peak level. Lower Mix to blend the dry source back in.
- **lfo:** A slow sine through br.tanh, shown on a scope. Raise Drive to turn it into a rounded square: it moves fast through the middle and dwells at the ends.
