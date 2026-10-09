{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 4,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "openinpresentation": 0,
        "boxes": [
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-signature",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        800.0,
                        15.0,
                        520.0,
                        80.0
                    ],
                    "text": "br.tanh.1.1 -- Created by Brian Riordan, guaguanco127@gmail.com\nhttps://github.com/guaguanco127/\nCredits: antiderivative anti-aliasing (Parker, Zavalishin & Le Bivic, \"Reducing the Aliasing of Nonlinear Waveshaping Using Continuous-Time Convolution\", DAFx-16, 2016).",
                    "linecount": 5
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        380.0,
                        15.0,
                        44.0,
                        20.0
                    ],
                    "text": "tanh",
                    "textcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "Input (Signal) audio or LFO to saturate",
                    "id": "obj-2",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        15.0,
                        15.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "Drive (Signal/Float) 0 - 64. How hard the signal is pushed into tanh. The output peak stays at +-1 at any Drive: 0 = clean, 1 = gentle rounding, 64 = nearly square. Above ~10, keep Drive x pitch under ~10-15 kHz to stay clean. Default 2",
                    "id": "obj-3",
                    "index": 2,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        140.0,
                        15.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "Mix (Signal/Float) 0 - 1. 0 = dry input, 1 = fully saturated. Default 1",
                    "id": "obj-4",
                    "index": 3,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        265.0,
                        15.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 4,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [
                            100.0,
                            100.0,
                            600.0,
                            450.0
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        50.0,
                                        20.0,
                                        127.0,
                                        22.0
                                    ],
                                    "text": "in 1 @comment signal"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        240.5,
                                        20.0,
                                        358.0,
                                        22.0
                                    ],
                                    "text": "in 2 @comment drive @default 2 @min 0.01 @max 64"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        431.0,
                                        54.0,
                                        403.0,
                                        22.0
                                    ],
                                    "text": "in 3 @comment mix 0-1 @default 1 @min 0 @max 1"
                                }
                            },
                            {
                                "box": {
                                    "code": "// br.tanh.1.1 -- normalized tanh saturator, mono\n// Curve: tanh(drive * x) / tanh(drive), so a full-scale input always peaks at +-1:\n//   Drive changes the color, not the loudness. Drive 0 is clean (the curve becomes a straight line), high Drive approaches a square.\n// Antialiased with 1st-order ADAA: each output sample is the average of the curve between\n//   the last input sample and this one: difference of the antiderivative / difference of the input.\n// Drive sits inside the curve, so the antiderivative is computed fresh for BOTH samples under the\n//   current Drive every sample: a stored one would belong to an older Drive and spike while Drive moves.\n// log-cosh written as |z| + log(1 + exp(-2|z|)) - log(2), which never overflows.\n// Drive is held at 0.01 or more so nothing divides by zero; at 0.01 the output matches the input within 0.003%.\n// Drive and Mix glide 10 ms inside, so moving them never clicks. No DC filtering: LFOs pass untouched.\n// Every stored value is read first and written last, never read after a write.\n// in1 signal, in2 drive, in3 mix 0-1\n// out1 shaped signal\n\nHistory x1(0);\nHistory drive_s(2);\nHistory mixv_s(1);\nHistory c_c(0);\nHistory sr_last(0);\n\n// --- 10 ms glide coefficient: once, and again if the samplerate changes ---\nsr = samplerate;\nc = c_c;\nif (sr != sr_last) {\n\tc = 1 - exp(-1 / (0.01 * sr));\n}\n\ndrive = drive_s + c * (clip(in2, 0.01, 64) - drive_s);\nmixv = mixv_s + c * (clip(in3, 0, 1) - mixv_s);\n\nx = in1;\nnorm = 1 / (drive * tanh(drive));\nza = abs(drive * x);\nzb = abs(drive * x1);\nFa = (za + log(1 + exp(-2 * za)) - 0.6931471805599453) * norm;\nFb = (zb + log(1 + exp(-2 * zb)) - 0.6931471805599453) * norm;\ndx = x - x1;\nwet = (abs(dx) < 1e-6) ? tanh(drive * 0.5 * (x + x1)) / tanh(drive) : (Fa - Fb) / dx;\n\nout1 = x + mixv * (wet - x);\n\nx1 = x;\ndrive_s = drive;\nmixv_s = mixv;\nc_c = c;\nsr_last = sr;\n",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-4",
                                    "maxclass": "codebox",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        50.0,
                                        93.0,
                                        400.0,
                                        200.0
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        50.0,
                                        333.0,
                                        198.0,
                                        22.0
                                    ],
                                    "text": "out 1 @comment shaped out"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-4",
                                        0
                                    ],
                                    "source": [
                                        "obj-1",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-4",
                                        1
                                    ],
                                    "source": [
                                        "obj-2",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-4",
                                        2
                                    ],
                                    "source": [
                                        "obj-3",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-5",
                                        0
                                    ],
                                    "source": [
                                        "obj-4",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        15.0,
                        80.0,
                        280.0,
                        22.0
                    ],
                    "text": "gen~ @title br.tanh.1.1",
                    "varname": "br_tanh"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        15.0,
                        170.0,
                        352.0,
                        20.0
                    ],
                    "text": "one gen~, mono; drive and mix glide 10 ms inside"
                }
            },
            {
                "box": {
                    "comment": "Output (Signal) saturated signal",
                    "id": "obj-9",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        15.0,
                        125.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-why",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        380.0,
                        45.0,
                        400.0,
                        74.0
                    ],
                    "text": "The plain object: Drive and Mix go straight into gen~, so they take numbers OR signals. An LFO patched into Drive sweeps the saturation smoothly; both glide 10 ms inside gen~, so jumps never click. [br.tanh.ui.1.1] wraps this file with dials and a State outlet.",
                    "linecount": 5
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [
                        "obj-2",
                        0
                    ],
                    "destination": [
                        "obj-7",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        0
                    ],
                    "destination": [
                        "obj-7",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-4",
                        0
                    ],
                    "destination": [
                        "obj-7",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-7",
                        0
                    ],
                    "destination": [
                        "obj-9",
                        0
                    ]
                }
            }
        ],
        "description": "br.tanh.1.1 -- Created by Brian Riordan, guaguanco127@gmail.com -- https://github.com/guaguanco127/ -- Credits: antiderivative anti-aliasing (Parker, Zavalishin & Le Bivic, \"Reducing the Aliasing of Nonlinear Waveshaping Using Continuous-Time Convolution\", DAFx-16, 2016)."
    }
}