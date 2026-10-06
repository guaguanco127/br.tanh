{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 0,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [
            85.0,
            104.0,
            1000.0,
            640.0
        ],
        "bglocked": 0,
        "openinpresentation": 0,
        "default_fontsize": 12.0,
        "default_fontface": 0,
        "default_fontname": "Arial",
        "gridonopen": 1,
        "gridsize": [
            15.0,
            15.0
        ],
        "gridsnaponopen": 1,
        "objectsnaponopen": 1,
        "statusbarvisible": 2,
        "toolbarvisible": 1,
        "lefttoolbarpinned": 0,
        "toptoolbarpinned": 0,
        "righttoolbarpinned": 0,
        "bottomtoolbarpinned": 0,
        "toolbars_unpinned_last_save": 0,
        "tallnewobj": 0,
        "boxanimatetime": 200,
        "enablehscroll": 1,
        "enablevscroll": 1,
        "devicewidth": 0.0,
        "description": "",
        "digest": "",
        "tags": "",
        "style": "",
        "subpatcher_template": "",
        "assistshowspatchername": 0,
        "boxes": [
            {
                "box": {
                    "maxclass": "comment",
                    "id": "obj-1",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15,
                        15,
                        65.0,
                        20.0
                    ],
                    "text": "br.tanh",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "comment",
                    "id": "obj-2",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15,
                        40,
                        820,
                        20.0
                    ],
                    "text": "A mono tanh saturator in gen~ for synthesis, normalized: a full-scale input always peaks at +-1, so Drive changes the color, not the loudness.",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "comment",
                    "id": "obj-3",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15,
                        65,
                        820,
                        20.0
                    ],
                    "text": "Inlets: Input, Drive, Mix (the same as br.shaper, so they swap without rewiring). Hover an inlet for its range and default.",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "comment",
                    "id": "obj-4",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15,
                        90,
                        820,
                        20.0
                    ],
                    "text": "Antialiased (1st-order ADAA), even while Drive moves. Drive and Mix glide 10 ms. No DC filter, so LFOs pass through untouched.",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "comment",
                    "id": "obj-5",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15,
                        120,
                        500,
                        60.0
                    ],
                    "text": "Tabs:\n  audio: br.tanh on a sine, saw or microphone\n  lfo: a slow sine saturated toward a square, shown on a scope",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "comment",
                    "id": "obj-6",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15,
                        185,
                        600,
                        20.0
                    ],
                    "text": "Outputs start muted at -70 dB: turn on audio, then raise the slider slowly.",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "comment",
                    "id": "obj-7",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15,
                        210,
                        303.0,
                        20.0
                    ],
                    "text": "By Brian Riordan. github.com/guaguanco127",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "newobj",
                    "id": "obj-8",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15,
                        250,
                        65.0,
                        22.0
                    ],
                    "text": "p audio",
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 0,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [
                            85.0,
                            130.0,
                            1000.0,
                            640.0
                        ],
                        "bglocked": 0,
                        "openinpresentation": 0,
                        "default_fontsize": 12.0,
                        "default_fontface": 0,
                        "default_fontname": "Arial",
                        "gridonopen": 1,
                        "gridsize": [
                            15.0,
                            15.0
                        ],
                        "gridsnaponopen": 1,
                        "objectsnaponopen": 1,
                        "statusbarvisible": 2,
                        "toolbarvisible": 1,
                        "lefttoolbarpinned": 0,
                        "toptoolbarpinned": 0,
                        "righttoolbarpinned": 0,
                        "bottomtoolbarpinned": 0,
                        "toolbars_unpinned_last_save": 0,
                        "tallnewobj": 0,
                        "boxanimatetime": 200,
                        "enablehscroll": 1,
                        "enablevscroll": 1,
                        "devicewidth": 0.0,
                        "description": "",
                        "digest": "",
                        "tags": "",
                        "style": "",
                        "subpatcher_template": "",
                        "assistshowspatchername": 0,
                        "boxes": [
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-1",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        15,
                                        15,
                                        128.0,
                                        20.0
                                    ],
                                    "text": "br.tanh on audio",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-2",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        15,
                                        40,
                                        760,
                                        20.0
                                    ],
                                    "text": "Raise Drive and watch the spectroscope~: more harmonics, same peak level. Lower Mix to blend the dry source back in.",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-3",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        15,
                                        75,
                                        58.0,
                                        20.0
                                    ],
                                    "text": "source",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "umenu",
                                    "id": "obj-4",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        15,
                                        97,
                                        110.0,
                                        22.0
                                    ],
                                    "parameter_enable": 0,
                                    "items": [
                                        "sine",
                                        ",",
                                        "saw",
                                        ",",
                                        "input (adc~ 1)"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "newobj",
                                    "id": "obj-5",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        85,
                                        75,
                                        86.0,
                                        22.0
                                    ],
                                    "text": "loadmess 0",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-6",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        140,
                                        75,
                                        65.0,
                                        20.0
                                    ],
                                    "text": "freq Hz",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "flonum",
                                    "id": "obj-7",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        140,
                                        97,
                                        50.0,
                                        22.0
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "newobj",
                                    "id": "obj-8",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        215,
                                        75,
                                        100.0,
                                        22.0
                                    ],
                                    "text": "loadmess 110",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "newobj",
                                    "id": "obj-9",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "patching_rect": [
                                        15,
                                        130,
                                        72.0,
                                        22.0
                                    ],
                                    "text": "p source",
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 0,
                                            "revision": 0,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "box",
                                        "rect": [
                                            100.0,
                                            100.0,
                                            400.0,
                                            300.0
                                        ],
                                        "bglocked": 0,
                                        "openinpresentation": 0,
                                        "default_fontsize": 12.0,
                                        "default_fontface": 0,
                                        "default_fontname": "Arial",
                                        "gridonopen": 1,
                                        "gridsize": [
                                            15.0,
                                            15.0
                                        ],
                                        "gridsnaponopen": 1,
                                        "objectsnaponopen": 1,
                                        "statusbarvisible": 2,
                                        "toolbarvisible": 1,
                                        "lefttoolbarpinned": 0,
                                        "toptoolbarpinned": 0,
                                        "righttoolbarpinned": 0,
                                        "bottomtoolbarpinned": 0,
                                        "toolbars_unpinned_last_save": 0,
                                        "tallnewobj": 0,
                                        "boxanimatetime": 200,
                                        "enablehscroll": 1,
                                        "enablevscroll": 1,
                                        "devicewidth": 0.0,
                                        "description": "",
                                        "digest": "",
                                        "tags": "",
                                        "style": "",
                                        "subpatcher_template": "",
                                        "assistshowspatchername": 0,
                                        "boxes": [
                                            {
                                                "box": {
                                                    "maxclass": "inlet",
                                                    "id": "obj-1",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        50.0,
                                                        30.0,
                                                        30.0,
                                                        30.0
                                                    ],
                                                    "comment": "source index: 0 sine, 1 saw, 2 input"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "inlet",
                                                    "id": "obj-2",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        130.0,
                                                        30.0,
                                                        30.0,
                                                        30.0
                                                    ],
                                                    "comment": "frequency Hz (sine, saw)"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "outlet",
                                                    "id": "obj-3",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "outlettype": [],
                                                    "patching_rect": [
                                                        50.0,
                                                        280.0,
                                                        30.0,
                                                        30.0
                                                    ],
                                                    "comment": "source signal, full scale"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-4",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [
                                                        "",
                                                        "",
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        50,
                                                        80,
                                                        65.0,
                                                        22.0
                                                    ],
                                                    "text": "t i i i",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-5",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [
                                                        "",
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        330,
                                                        80,
                                                        51.0,
                                                        22.0
                                                    ],
                                                    "text": "t f f",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-6",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        "signal"
                                                    ],
                                                    "patching_rect": [
                                                        330,
                                                        120,
                                                        86.0,
                                                        22.0
                                                    ],
                                                    "text": "cycle~ 110",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-7",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        "signal"
                                                    ],
                                                    "patching_rect": [
                                                        420,
                                                        120,
                                                        72.0,
                                                        22.0
                                                    ],
                                                    "text": "saw~ 110",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-8",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        "signal"
                                                    ],
                                                    "patching_rect": [
                                                        510,
                                                        120,
                                                        58.0,
                                                        22.0
                                                    ],
                                                    "text": "adc~ 1",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-9",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        50,
                                                        120,
                                                        44.0,
                                                        22.0
                                                    ],
                                                    "text": "== 0",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "message",
                                                    "id": "obj-10",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        50,
                                                        150,
                                                        51.0,
                                                        22.0
                                                    ],
                                                    "text": "$1 20",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-11",
                                                    "numinlets": 2,
                                                    "numoutlets": 2,
                                                    "outlettype": [
                                                        "signal",
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        50,
                                                        180,
                                                        51.0,
                                                        22.0
                                                    ],
                                                    "text": "line~",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-12",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        "signal"
                                                    ],
                                                    "patching_rect": [
                                                        50,
                                                        230,
                                                        40.0,
                                                        22.0
                                                    ],
                                                    "text": "*~",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-13",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        140,
                                                        120,
                                                        44.0,
                                                        22.0
                                                    ],
                                                    "text": "== 1",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "message",
                                                    "id": "obj-14",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        140,
                                                        150,
                                                        51.0,
                                                        22.0
                                                    ],
                                                    "text": "$1 20",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-15",
                                                    "numinlets": 2,
                                                    "numoutlets": 2,
                                                    "outlettype": [
                                                        "signal",
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        140,
                                                        180,
                                                        51.0,
                                                        22.0
                                                    ],
                                                    "text": "line~",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-16",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        "signal"
                                                    ],
                                                    "patching_rect": [
                                                        140,
                                                        230,
                                                        40.0,
                                                        22.0
                                                    ],
                                                    "text": "*~",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-17",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        230,
                                                        120,
                                                        44.0,
                                                        22.0
                                                    ],
                                                    "text": "== 2",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "message",
                                                    "id": "obj-18",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        230,
                                                        150,
                                                        51.0,
                                                        22.0
                                                    ],
                                                    "text": "$1 20",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-19",
                                                    "numinlets": 2,
                                                    "numoutlets": 2,
                                                    "outlettype": [
                                                        "signal",
                                                        ""
                                                    ],
                                                    "patching_rect": [
                                                        230,
                                                        180,
                                                        51.0,
                                                        22.0
                                                    ],
                                                    "text": "line~",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "newobj",
                                                    "id": "obj-20",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [
                                                        "signal"
                                                    ],
                                                    "patching_rect": [
                                                        230,
                                                        230,
                                                        40.0,
                                                        22.0
                                                    ],
                                                    "text": "*~",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "maxclass": "comment",
                                                    "id": "obj-21",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "outlettype": [],
                                                    "patching_rect": [
                                                        50,
                                                        310,
                                                        548.0,
                                                        20.0
                                                    ],
                                                    "text": "each source has its own 20 ms fade: switching never clicks (selector~ would)",
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0
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
                                                        "obj-5",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-5",
                                                        1
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
                                                        "obj-5",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-6",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-4",
                                                        2
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
                                                        "obj-9",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-10",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-10",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-11",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-11",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-12",
                                                        1
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
                                                        "obj-12",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-12",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-3",
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
                                                        "obj-13",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-13",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-14",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-14",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-15",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-15",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-16",
                                                        1
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
                                                        "obj-16",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-16",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-3",
                                                        0
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
                                                        "obj-17",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-17",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-18",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-18",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-19",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-19",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-20",
                                                        1
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-8",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-20",
                                                        0
                                                    ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "source": [
                                                        "obj-20",
                                                        0
                                                    ],
                                                    "destination": [
                                                        "obj-3",
                                                        0
                                                    ]
                                                }
                                            }
                                        ],
                                        "dependency_cache": [],
                                        "autosave": 0
                                    },
                                    "saved_object_attributes": {
                                        "description": "",
                                        "digest": "",
                                        "globalpatchername": "",
                                        "tags": ""
                                    }
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-10",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        95,
                                        130,
                                        345.0,
                                        20.0
                                    ],
                                    "text": "fades 20 ms between sources: open it to see how",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "bpatcher",
                                    "id": "obj-11",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "patching_rect": [
                                        15,
                                        200,
                                        110.0,
                                        79.0
                                    ],
                                    "args": [],
                                    "bgmode": 0,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "enablehscroll": 0,
                                    "enablevscroll": 0,
                                    "lockeddragscroll": 0,
                                    "offset": [
                                        0.0,
                                        0.0
                                    ],
                                    "viewvisibility": 1,
                                    "name": "br.tanh.1.0.maxpat"
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-12",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        15,
                                        178,
                                        93.0,
                                        20.0
                                    ],
                                    "text": "br.tanh.1.0",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "live.scope~",
                                    "id": "obj-13",
                                    "numinlets": 2,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        15.0,
                                        300,
                                        250.0,
                                        130.0
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "spectroscope~",
                                    "id": "obj-14",
                                    "numinlets": 2,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        280.0,
                                        300,
                                        260.0,
                                        130.0
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "live.gain~",
                                    "id": "obj-15",
                                    "numinlets": 2,
                                    "numoutlets": 5,
                                    "outlettype": [
                                        "signal",
                                        "signal",
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        555.0,
                                        300,
                                        48.0,
                                        136.0
                                    ],
                                    "parameter_enable": 1,
                                    "varname": "out_audio",
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [
                                                -70.0
                                            ],
                                            "parameter_initial_enable": 1,
                                            "parameter_longname": "Out audio",
                                            "parameter_shortname": "Out",
                                            "parameter_mmin": -70.0,
                                            "parameter_mmax": 6.0,
                                            "parameter_modmode": 3,
                                            "parameter_type": 0,
                                            "parameter_unitstyle": 4
                                        }
                                    }
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-16",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        610,
                                        300,
                                        198.0,
                                        20.0
                                    ],
                                    "text": "starts muted: raise slowly",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "toggle",
                                    "id": "obj-17",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        610,
                                        330,
                                        24.0,
                                        24.0
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-18",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        635,
                                        330,
                                        100.0,
                                        20.0
                                    ],
                                    "text": "audio on/off",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "newobj",
                                    "id": "obj-19",
                                    "numinlets": 2,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        555,
                                        450,
                                        72.0,
                                        22.0
                                    ],
                                    "text": "dac~ 1 2",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-5",
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
                                        "obj-8",
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
                                        "obj-4",
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
                                        0
                                    ],
                                    "destination": [
                                        "obj-9",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-9",
                                        0
                                    ],
                                    "destination": [
                                        "obj-11",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-11",
                                        0
                                    ],
                                    "destination": [
                                        "obj-13",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-11",
                                        0
                                    ],
                                    "destination": [
                                        "obj-14",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-11",
                                        0
                                    ],
                                    "destination": [
                                        "obj-15",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-11",
                                        0
                                    ],
                                    "destination": [
                                        "obj-15",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-15",
                                        0
                                    ],
                                    "destination": [
                                        "obj-19",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-15",
                                        1
                                    ],
                                    "destination": [
                                        "obj-19",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-17",
                                        0
                                    ],
                                    "destination": [
                                        "obj-19",
                                        0
                                    ]
                                }
                            }
                        ],
                        "dependency_cache": [],
                        "autosave": 0,
                        "showontab": 1
                    },
                    "saved_object_attributes": {
                        "description": "",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    }
                }
            },
            {
                "box": {
                    "maxclass": "newobj",
                    "id": "obj-9",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        95,
                        250,
                        51.0,
                        22.0
                    ],
                    "text": "p lfo",
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 0,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [
                            85.0,
                            130.0,
                            1000.0,
                            640.0
                        ],
                        "bglocked": 0,
                        "openinpresentation": 0,
                        "default_fontsize": 12.0,
                        "default_fontface": 0,
                        "default_fontname": "Arial",
                        "gridonopen": 1,
                        "gridsize": [
                            15.0,
                            15.0
                        ],
                        "gridsnaponopen": 1,
                        "objectsnaponopen": 1,
                        "statusbarvisible": 2,
                        "toolbarvisible": 1,
                        "lefttoolbarpinned": 0,
                        "toptoolbarpinned": 0,
                        "righttoolbarpinned": 0,
                        "bottomtoolbarpinned": 0,
                        "toolbars_unpinned_last_save": 0,
                        "tallnewobj": 0,
                        "boxanimatetime": 200,
                        "enablehscroll": 1,
                        "enablevscroll": 1,
                        "devicewidth": 0.0,
                        "description": "",
                        "digest": "",
                        "tags": "",
                        "style": "",
                        "subpatcher_template": "",
                        "assistshowspatchername": 0,
                        "boxes": [
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-1",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        15,
                                        15,
                                        135.0,
                                        20.0
                                    ],
                                    "text": "saturating an LFO",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-2",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        15,
                                        40,
                                        820,
                                        20.0
                                    ],
                                    "text": "A slow sine through br.tanh, shown on the scope. Raise Drive to turn it into a rounded square: it moves fast through the middle and dwells at the ends.",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-3",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        15,
                                        75,
                                        58.0,
                                        20.0
                                    ],
                                    "text": "LFO Hz",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "flonum",
                                    "id": "obj-4",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        15,
                                        97,
                                        50.0,
                                        22.0
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "newobj",
                                    "id": "obj-5",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        85,
                                        75,
                                        93.0,
                                        22.0
                                    ],
                                    "text": "loadmess 1.",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "newobj",
                                    "id": "obj-6",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "patching_rect": [
                                        15,
                                        130,
                                        58.0,
                                        22.0
                                    ],
                                    "text": "cycle~",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "bpatcher",
                                    "id": "obj-7",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "patching_rect": [
                                        15,
                                        190,
                                        110.0,
                                        79.0
                                    ],
                                    "args": [],
                                    "bgmode": 0,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "enablehscroll": 0,
                                    "enablevscroll": 0,
                                    "lockeddragscroll": 0,
                                    "offset": [
                                        0.0,
                                        0.0
                                    ],
                                    "viewvisibility": 1,
                                    "name": "br.tanh.1.0.maxpat"
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-8",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        15,
                                        168,
                                        93.0,
                                        20.0
                                    ],
                                    "text": "br.tanh.1.0",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "live.scope~",
                                    "id": "obj-9",
                                    "numinlets": 2,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        15.0,
                                        290.0,
                                        250.0,
                                        130.0
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "comment",
                                    "id": "obj-10",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        145,
                                        190,
                                        170.0,
                                        20.0
                                    ],
                                    "text": "saturated LFO, -1 to 1",
                                    "fontname": "Arial",
                                    "fontsize": 12.0
                                }
                            },
                            {
                                "box": {
                                    "maxclass": "number~",
                                    "id": "obj-11",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "signal",
                                        ""
                                    ],
                                    "patching_rect": [
                                        145,
                                        212,
                                        56.0,
                                        22.0
                                    ],
                                    "parameter_enable": 0
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "obj-5",
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
                                        "obj-4",
                                        0
                                    ],
                                    "destination": [
                                        "obj-6",
                                        0
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
                                        "obj-7",
                                        0
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
                                        0
                                    ],
                                    "destination": [
                                        "obj-11",
                                        0
                                    ]
                                }
                            }
                        ],
                        "dependency_cache": [],
                        "autosave": 0,
                        "showontab": 1
                    },
                    "saved_object_attributes": {
                        "description": "",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    }
                }
            }
        ],
        "lines": [],
        "dependency_cache": [],
        "autosave": 0,
        "showrootpatcherontab": 0,
        "parameters": {
            "obj-8::obj-15": [
                "Out audio",
                "Out",
                0
            ],
            "inherited_shortname": 1
        }
    }
}