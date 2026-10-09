# Max/MSP Abstractions:   
## br.tanh.1.1



By Brian Riordan  
[guaguanco127@gmail.com](mailto:guaguanco127@gmail.com)  
[brianriordanmusic@gmail.com](mailto:brianriordanmusic@gmail.com)  
[https://www.brianriordanmusic.com/](https://www.brianriordanmusic.com/) 
  
Repository for br.tanh.1.1, with all related files, can be found here: [https://github.com/guaguanco127/br.tanh](https://github.com/guaguanco127/br.tanh)  
Additional programs can be found here: [https://github.com/guaguanco127/br.max](https://github.com/guaguanco127/br.max)

These files were created with Max 9. 

## Table of Contents 

[What's new in 1.1](#New11)  
[About](#About)   
[Which file?](#Files)  
[What is an abstraction?](#Abstraction)  
[How To Install](#Install)  
[How To Use](#Use)  
[State outlet](#State)  
[Example Patch](#Example)  
[Credits](#Credits)  
 
 

## <a name="New11"></a>What's new in 1.1

- **Stereo:** br.tanh.stereo.1.1 and br.tanh.stereo.ui.1.1 saturate a stereo pair with one set of controls (Left, Right, Drive, Mix in; Left, Right out). Both channels share Drive and Mix and keep their own anti-aliasing memory.
- **Two files per width:** br.tanh.1.1 is the plain object, whose Drive and Mix inlets take signals as well as numbers (patch an LFO into Drive), and br.tanh.ui.1.1 is the version with dials, for a [bpatcher].
- **State outlet** on the .ui versions (the last outlet): sends drive and mix as named messages the moment they change.
- New RNBO patches, mono and stereo, to build your own Max external or VST/AU plugin.
- New example tabs: plain object, stereo and State outlet.
- Inlets, the Output outlet and the sound are unchanged. If you used 1.0 in a [bpatcher], choose br.tanh.ui.1.1; if you used it as an object box, type br.tanh.1.1.

## <a name="About"></a>About

A tanh saturator for Max/MSP, mono and stereo, built in gen~, for synthesis: audio oscillators and LFOs alike.

**Normalized:** The curve is tanh(Drive x input) / tanh(Drive), so a full-scale input always peaks at +-1: Drive changes the color, not the loudness. Drive 0 is clean, low Drive gently rounds the peaks, and high Drive turns any wave into a near-square, so Drive alone is a one-knob sweep from clean to square.

**Parallel saturation:** Mix blends the dry signal back in at any Drive. For example, heavy Drive at a low Mix keeps the clean fundamental with a layer of harmonics on top.

**Antialiased:** First-order ADAA (antiderivative antialiasing): each output sample is the average of the curve between the last input sample and this one, which removes most of the aliasing that heavy saturation causes. It is recomputed every sample under the current Drive, so it stays correct even while Drive moves.

**Click-free controls:** Drive and Mix always glide over 10 ms, so moving them never clicks.

**Mono or stereo, LFO-safe:** One signal in and out, or a stereo pair with the stereo files. There is no DC filter, so an LFO keeps its full shape and center.

**Pairs with br.shaper:** The inlets (Input, Drive, Mix) match [br.shaper](https://github.com/guaguanco127/br.shaper)'s fold, wrap, clip and buchla shapers, so you can swap between them without rewiring.

### Controls

**Drive:** How hard the signal is pushed into tanh, from 0 to 64. 0 is clean, 1 gently rounds the peaks, 64 is nearly square, and the output peak stays at +-1 throughout. The dial is curved, so most of its travel covers 0 to 10. Low Drive slightly lifts the quieter parts of the signal, since the peaks stay put while the rest is pushed up toward them. The default is 2.

**Mix:** 0 is the dry input, 1 is fully saturated. The default is 1.

### How high can Drive go?

High Drive makes harmonics far above the pitch. Keep Drive x pitch under about 10 - 15 kHz and the sound stays clean: a 110 Hz bass is fine at 64, while at 440 Hz aliasing starts around 25 - 35. LFOs have no limit.

## <a name="Files"></a>Which file?

| File | What it is |
|---|---|
| br.tanh.1.1 | Mono plain object, no UI. Drive and Mix take numbers or signals. Inlets: Input, Drive, Mix. Outlet: Output |
| br.tanh.ui.1.1 | The same with dials and a State outlet, ready for a [bpatcher]. Controls take numbers |
| br.tanh.stereo.1.1 | Stereo plain object. Inlets: Left, Right, Drive, Mix. Outlets: Left, Right |
| br.tanh.stereo.ui.1.1 | The stereo version with dials and a State outlet, for a [bpatcher] |
| _br.tanh.example.1.1 | Example patch: open this first |

Each .ui file contains its plain object, so keep them together. Each plain object and its .ui have the same inlets and outlets in the same order (the .ui adds State last), so they swap without rewiring.

## <a name="Abstraction"></a>What is an Abstraction?

An abstraction is a subpatcher that is saved as an external file, and can be used just like a standard Max object. As long as your abstraction can be found in the Max file path, you can type its name into a new object box and it will be loaded directly into your patch.  

By saving your logic in an abstraction, you can create modules that can be used in future work with little or no additional programming. This allows you to parlay your Max knowledge into more efficient work in the future, and will help you create programming systems that are modular and easier to maintain.

## <a name="Install"></a>How To Install 

1. Make sure you have Max 9 installed in your computer. And, make sure you are using a Max patch that is inside of a folder.  

2. Copy the files you need into the same folder as the Max patch you are using: br.tanh.1.1.maxpat + br.tanh.ui.1.1.maxpat for mono, br.tanh.stereo.1.1.maxpat + br.tanh.stereo.ui.1.1.maxpat for stereo (each .ui uses its plain object).

3. For the version with dials, create a bpatcher object. Then, go inside of its inspector, select "choose" next to "Patcher File" and select br.tanh.ui.1.1.maxpat (or br.tanh.stereo.ui.1.1.maxpat). Size the bpatcher to 85 x 79 to show all of the controls.

4. For the plain object, create an object called br.tanh.1.1 (or br.tanh.stereo.1.1, do not include brackets) and control it through its inlets (see below).

## <a name="Use"></a>How To Use

The first inlet is your signal: audio or an LFO. Every control has its own inlet after that, in the same order as the dials. On the .ui files, sending a value to an inlet moves its on-screen dial too, so the display always matches the sound. On the plain objects, Drive and Mix also take signals (Float below = Signal too). Values outside a dial's range are limited to that range. Hover over an inlet in Max to see its range and default.

| Inlet | Control | Type | Range | Default |
|---|---|---|---|---|
| 1 | Input | Signal | audio or LFO | |
| 2 | Drive | Float | 0 - 64 | 2 |
| 3 | Mix | Float | 0 - 1 | 1 |

| Outlet | Name | Type |
|---|---|---|
| 1 | Output | Signal |
| 2 | State (.ui only): the settings as named messages, see [State outlet](#State) | Message |

**Stereo** (br.tanh.stereo.1.1 / br.tanh.stereo.ui.1.1): inlets Left, Right, Drive, Mix; outlets Left, Right, and State on the .ui. Both channels share Drive and Mix.

## <a name="State"></a>State outlet

The last outlet of br.tanh.ui.1.1 and br.tanh.stereo.ui.1.1 (State) sends the current settings as named messages the moment they change, for example `drive 8.`, `mix 0.5`. Use it to keep a display, Mira or another patch in sync. Pick them out by name with [route drive mix], not by position, so your patch keeps working if a later version adds controls. Repeats are filtered out.

| Message | Type | Range |
|---|---|---|
| drive | Float | 0 to 64 |
| mix | Float | 0 to 1 |

Each message carries the same value its inlet takes, so a State message can go straight back into an inlet. The plain objects have no State outlet: whatever drives them already knows the values.

## <a name="Example"></a>Example Patch

Open _br.tanh.example.1.1.maxpat (keep it in the same folder as all four br.tanh files). The first page introduces br.tanh; the tabs at the top hold the examples.

- **audio:** br.tanh on a sine, saw or microphone source, with a frequency box. Turn on the audio with the toggle, then raise the gain slider, which starts muted. Raise Drive and watch the spectroscope~: more harmonics, same peak level. Lower Mix to blend the dry source back in.
- **lfo:** A slow sine through br.tanh, shown on a scope. Raise Drive to turn it into a rounded square: it moves fast through the middle and dwells at the ends. On the right, the plain br.tanh.1.1 gets an LFO on Drive too.
- **plain object:** br.tanh.1.1 with no dials on the same sources: a slow LFO (a signal) swells Drive from 1 to 31 while you listen, and a number box sets Mix.
- **stereo:** a source that plays a little higher on the Right, through br.tanh.stereo.ui.1.1 (with dials) and br.tanh.stereo.1.1 (plain, LFO on Drive), each with its own muted output slider.
- **State outlet:** the audio tab's settings, read by name with [route drive mix] into number boxes.

## <a name="Credits"></a>Credits

Antiderivative anti-aliasing (Parker, Zavalishin & Le Bivic, "Reducing the Aliasing of Nonlinear Waveshaping Using Continuous-Time Convolution", DAFx-16, 2016).
