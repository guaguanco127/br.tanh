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
                    "text": "br.tanh.stereo.1.1 -- Created by Brian Riordan, guaguanco127@gmail.com\nhttps://github.com/guaguanco127/\nCredits: antiderivative anti-aliasing (Parker, Zavalishin & Le Bivic, \"Reducing the Aliasing of Nonlinear Waveshaping Using Continuous-Time Convolution\", DAFx-16, 2016).",
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
                        80.0,
                        20.0
                    ],
                    "text": "tanh stereo",
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
                    "comment": "Left In (Signal) audio or LFO to saturate",
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
                    "numinlets": 4,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
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
                                    "text": "in 1 @comment left"
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
                                        145.0,
                                        54.0,
                                        127.0,
                                        22.0
                                    ],
                                    "text": "in 2 @comment right"
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
                                        240.5,
                                        20.0,
                                        358.0,
                                        22.0
                                    ],
                                    "text": "in 3 @comment drive @default 2 @min 0.01 @max 64"
                                }
                            },
                            {
                                "box": {
                                    "code": "// br.tanh.stereo.1.1 -- normalized tanh saturator, stereo\n// Curve: tanh(drive * x) / tanh(drive), so a full-scale input always peaks at +-1:\n//   Drive changes the color, not the loudness. Drive 0 is clean (the curve becomes a straight line), high Drive approaches a square.\n// Antialiased with 1st-order ADAA: each output sample is the average of the curve between\n//   the last input sample and this one: difference of the antiderivative / difference of the input.\n// Drive sits inside the curve, so the antiderivative is computed fresh for BOTH samples under the\n//   current Drive every sample: a stored one would belong to an older Drive and spike while Drive moves.\n// log-cosh written as |z| + log(1 + exp(-2|z|)) - log(2), which never overflows.\n// Drive is held at 0.01 or more so nothing divides by zero; at 0.01 the output matches the input within 0.003%.\n// Drive and Mix glide 10 ms inside, so moving them never clicks. No DC filtering: LFOs pass untouched.\n// Left and Right share Drive and Mix (one glide, one normalization) and keep their own last input sample.\n// Every stored value is read first and written last, never read after a write.\n// in1 left, in2 right, in3 drive, in4 mix 0-1\n// out1 left, out2 right\n\nHistory x1l(0);\nHistory x1r(0);\nHistory drive_s(2);\nHistory mixv_s(1);\nHistory c_c(0);\nHistory sr_last(0);\n\n// --- 10 ms glide coefficient: once, and again if the samplerate changes ---\nsr = samplerate;\nc = c_c;\nif (sr != sr_last) {\n\tc = 1 - exp(-1 / (0.01 * sr));\n}\n\ndrive = drive_s + c * (clip(in3, 0.01, 64) - drive_s);\nmixv = mixv_s + c * (clip(in4, 0, 1) - mixv_s);\ntd = tanh(drive);\nnorm = 1 / (drive * td);\n\n// --- left ---\nxl = in1;\nzal = abs(drive * xl);\nzbl = abs(drive * x1l);\nFal = (zal + log(1 + exp(-2 * zal)) - 0.6931471805599453) * norm;\nFbl = (zbl + log(1 + exp(-2 * zbl)) - 0.6931471805599453) * norm;\ndxl = xl - x1l;\nwetl = (abs(dxl) < 1e-6) ? tanh(drive * 0.5 * (xl + x1l)) / td : (Fal - Fbl) / dxl;\n\n// --- right ---\nxr = in2;\nzar = abs(drive * xr);\nzbr = abs(drive * x1r);\nFar = (zar + log(1 + exp(-2 * zar)) - 0.6931471805599453) * norm;\nFbr = (zbr + log(1 + exp(-2 * zbr)) - 0.6931471805599453) * norm;\ndxr = xr - x1r;\nwetr = (abs(dxr) < 1e-6) ? tanh(drive * 0.5 * (xr + x1r)) / td : (Far - Fbr) / dxr;\n\nout1 = xl + mixv * (wetl - xl);\nout2 = xr + mixv * (wetr - xr);\n\nx1l = xl;\nx1r = xr;\ndrive_s = drive;\nmixv_s = mixv;\nc_c = c;\nsr_last = sr;\n",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-4",
                                    "maxclass": "codebox",
                                    "numinlets": 4,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
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
                                    "text": "out 1 @comment left"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-6",
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
                                    "text": "in 4 @comment mix 0-1 @default 1 @min 0 @max 1"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        260.0,
                                        333.0,
                                        198.0,
                                        22.0
                                    ],
                                    "text": "out 2 @comment right"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-1",
                                        0
                                    ],
                                    "destination": [
                                        "obj-4",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-2",
                                        0
                                    ],
                                    "destination": [
                                        "obj-4",
                                        1
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
                                        "obj-4",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-6",
                                        0
                                    ],
                                    "destination": [
                                        "obj-4",
                                        3
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
                                        "obj-5",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-4",
                                        1
                                    ],
                                    "destination": [
                                        "obj-7",
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
                    "text": "gen~ @title br.tanh.stereo.1.1",
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
                        480.0,
                        20.0
                    ],
                    "text": "one gen~, stereo; drive and mix glide 10 ms inside, shared by Left and Right"
                }
            },
            {
                "box": {
                    "comment": "Left Out (Signal) saturated signal",
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
            },
            {
                "box": {
                    "comment": "Right In (Signal) audio or LFO to saturate",
                    "id": "obj-2r",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        77.0,
                        15.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "Right Out (Signal) saturated signal",
                    "id": "obj-9r",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        265.0,
                        125.0,
                        30.0,
                        30.0
                    ]
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
                        "obj-2r",
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
                        "obj-3",
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
                        "obj-4",
                        0
                    ],
                    "destination": [
                        "obj-7",
                        3
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
            },
            {
                "patchline": {
                    "source": [
                        "obj-7",
                        1
                    ],
                    "destination": [
                        "obj-9r",
                        0
                    ]
                }
            }
        ],
        "description": "br.tanh.stereo.1.1 -- Created by Brian Riordan, guaguanco127@gmail.com -- https://github.com/guaguanco127/ -- Credits: antiderivative anti-aliasing (Parker, Zavalishin & Le Bivic, \"Reducing the Aliasing of Nonlinear Waveshaping Using Continuous-Time Convolution\", DAFx-16, 2016)."
    }
}