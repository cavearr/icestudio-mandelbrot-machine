{
  "version": "1.2",
  "package": {
    "name": "Text Terminal for VGA",
    "version": "1.0",
    "description": "Aparently simple, but complex design to discuss about PLL and global variables in Icestudio",
    "author": "Carlos Venegas @cavearr",
    "image": ""
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
        {
          "id": "fd8f118e-4798-4d31-9778-8070cabe431b",
          "type": "basic.outputLabel",
          "data": {
            "name": "pllCLK",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -808
          }
        },
        {
          "id": "b150f6d9-85bf-4002-b436-374f52bf1254",
          "type": "basic.outputLabel",
          "data": {
            "name": "rst_sys",
            "blockColor": "yellow",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -760
          }
        },
        {
          "id": "5b905848-6848-4445-8d46-9dade25c4e47",
          "type": "basic.outputLabel",
          "data": {
            "name": "pllCLK",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 192,
            "y": -672
          }
        },
        {
          "id": "6db61e6e-c297-455d-b8a8-5648fc209b29",
          "type": "basic.outputLabel",
          "data": {
            "name": "padX",
            "range": "[9:0]",
            "blockColor": "mediumvioletred",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -672
          }
        },
        {
          "id": "936f86ea-6c24-4bce-873f-c6f2f10ea1c3",
          "type": "basic.inputLabel",
          "data": {
            "name": "pixelRGB",
            "range": "[11:0]",
            "blockColor": "turquoise",
            "virtual": true,
            "pins": [
              {
                "index": "11",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "10",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 944,
            "y": -656
          }
        },
        {
          "id": "fbe559b3-32d7-4f0f-a732-8297b2d1ac7d",
          "type": "basic.outputLabel",
          "data": {
            "name": "padY",
            "range": "[9:0]",
            "blockColor": "mediumvioletred",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -624
          }
        },
        {
          "id": "d2642d17-4b55-4275-b4db-b71d6434f9f7",
          "type": "basic.outputLabel",
          "data": {
            "name": "pix444",
            "range": "[11:0]",
            "blockColor": "darkorange",
            "virtual": true,
            "pins": [
              {
                "index": "11",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "10",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 192,
            "y": -616
          }
        },
        {
          "id": "c5827cb1-7921-45bb-b1f3-57bc537eb459",
          "type": "basic.outputLabel",
          "data": {
            "name": "systemHsync",
            "blockColor": "slateblue",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 192,
            "y": -568
          }
        },
        {
          "id": "a4fe2d5f-ead5-464d-ab63-7937db59e35a",
          "type": "basic.outputLabel",
          "data": {
            "name": "buttonU",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -560
          }
        },
        {
          "id": "b8198d29-6ee5-4ca8-93b0-1be62e4491a9",
          "type": "basic.inputLabel",
          "data": {
            "name": "vpixelR",
            "range": "[1:0]",
            "blockColor": "red",
            "virtual": true,
            "pins": [
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1952,
            "y": -520
          }
        },
        {
          "id": "5dc3ab69-2450-4b97-8a46-2529411ee0e1",
          "type": "basic.outputLabel",
          "data": {
            "name": "systemVsync",
            "blockColor": "gold",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 192,
            "y": -512
          }
        },
        {
          "id": "2b69b267-5e70-45fd-8fe8-ea89d216a17f",
          "type": "basic.outputLabel",
          "data": {
            "name": "buttonD",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -512
          }
        },
        {
          "id": "9f790f37-be01-4cce-bb64-9ffed8844fc8",
          "type": "basic.inputLabel",
          "data": {
            "name": "nespad_gin",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -344,
            "y": -504
          }
        },
        {
          "id": "3a7e2d18-f365-474b-94c0-0ba93c4381cb",
          "type": "basic.outputLabel",
          "data": {
            "name": "pixelRGB",
            "range": "[11:0]",
            "blockColor": "turquoise",
            "virtual": true,
            "pins": [
              {
                "index": "11",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "10",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1248,
            "y": -472
          }
        },
        {
          "id": "1584c643-08d5-4529-93fd-846bde36b326",
          "type": "basic.outputLabel",
          "data": {
            "name": "buttonL",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -464
          }
        },
        {
          "id": "312d8009-7aa3-461a-b2a0-972bb876990b",
          "type": "basic.outputLabel",
          "data": {
            "name": "hCounter",
            "range": "[9:0]",
            "blockColor": "steelblue",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 192,
            "y": -456
          }
        },
        {
          "id": "9c3c24bd-1046-4b0d-8043-b521b4373897",
          "type": "basic.inputLabel",
          "data": {
            "name": "vpixelG",
            "range": "[1:0]",
            "blockColor": "springgreen",
            "virtual": true,
            "pins": [
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1952,
            "y": -448
          }
        },
        {
          "id": "0265abcc-c2b8-4844-b85a-2da4a945f90b",
          "type": "basic.outputLabel",
          "data": {
            "name": "buttonR",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -416
          }
        },
        {
          "id": "5c102dc0-9d48-49cf-8d58-674ebf791bb5",
          "type": "basic.outputLabel",
          "data": {
            "name": "vCounter",
            "range": "[9:0]",
            "blockColor": "gold",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 192,
            "y": -408
          }
        },
        {
          "id": "940f4c59-1d1c-4829-a07f-dc06bef4a2df",
          "type": "basic.inputLabel",
          "data": {
            "name": "vpixelB",
            "range": "[1:0]",
            "blockColor": "deepskyblue",
            "virtual": true,
            "pins": [
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1952,
            "y": -368
          }
        },
        {
          "id": "53a8f256-affe-4531-bfe6-c9c831113a78",
          "type": "basic.outputLabel",
          "data": {
            "name": "buttonA",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -368
          }
        },
        {
          "id": "e16a8db3-4305-4351-bbfa-1eb72ce46abe",
          "type": "basic.inputLabel",
          "data": {
            "name": "pllCLK",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1688,
            "y": -368
          }
        },
        {
          "id": "c241192d-d415-45a7-b115-bc7fcfb0936f",
          "type": "basic.inputLabel",
          "data": {
            "name": "screenHsync",
            "blockColor": "slateblue",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 880,
            "y": -344
          }
        },
        {
          "id": "0e4a1380-f000-45d8-99bf-753381c06e6c",
          "type": "basic.input",
          "data": {
            "name": "CLKIN",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "CLK",
                "value": "49"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -2192,
            "y": -336
          }
        },
        {
          "id": "700da4a5-7352-495f-8afd-2394f4c1e586",
          "type": "basic.outputLabel",
          "data": {
            "name": "buttonB",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -320
          }
        },
        {
          "id": "d203341d-6a50-4966-8304-7888e73eff11",
          "type": "basic.outputLabel",
          "data": {
            "name": "posX",
            "range": "[9:0]",
            "blockColor": "mediumvioletred",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 192,
            "y": -304
          }
        },
        {
          "id": "f3ea9f09-3d4e-4188-b3d1-419ef83fd046",
          "type": "basic.inputLabel",
          "data": {
            "name": "screenVsync",
            "blockColor": "yellow",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 880,
            "y": -264
          }
        },
        {
          "id": "7ca66133-799f-442f-89d6-0ac2b3cb282a",
          "type": "basic.outputLabel",
          "data": {
            "name": "nespad_glat",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -256
          }
        },
        {
          "id": "6d469d65-1209-4a40-9111-69be41ded9d2",
          "type": "basic.outputLabel",
          "data": {
            "name": "posY",
            "range": "[9:0]",
            "blockColor": "mediumvioletred",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 192,
            "y": -248
          }
        },
        {
          "id": "74be30ec-0e7b-4f5e-b60f-80c6eb9f608c",
          "type": "basic.outputLabel",
          "data": {
            "name": "nespad_gclk",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1080,
            "y": -208
          }
        },
        {
          "id": "5af85aff-4ad0-4d02-824a-77225ec76992",
          "type": "basic.outputLabel",
          "data": {
            "name": "systemVsync",
            "blockColor": "gold",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 2024,
            "y": -152
          }
        },
        {
          "id": "434fd55d-6363-4fe1-8d09-527024027ddb",
          "type": "basic.output",
          "data": {
            "name": "VH",
            "range": "[1:0]",
            "pins": [
              {
                "index": "1",
                "name": "D7",
                "value": "9"
              },
              {
                "index": "0",
                "name": "D6",
                "value": "10"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 2368,
            "y": -136
          }
        },
        {
          "id": "cfd57c08-b349-46a9-85a0-cfb41005339f",
          "type": "basic.outputLabel",
          "data": {
            "name": "systemHsync",
            "blockColor": "slateblue",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 2024,
            "y": -88
          }
        },
        {
          "id": "82af9d35-aa56-44b5-9b8e-658de052bb43",
          "type": "basic.output",
          "data": {
            "name": "R",
            "range": "[1:0]",
            "pins": [
              {
                "index": "1",
                "name": "D0",
                "value": "2"
              },
              {
                "index": "0",
                "name": "D1",
                "value": "1"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 2368,
            "y": 88
          }
        },
        {
          "id": "b879becb-3c0b-4e39-889f-674558aa35d8",
          "type": "basic.outputLabel",
          "data": {
            "name": "pllCLK",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -2216,
            "y": 88
          }
        },
        {
          "id": "0c7db44c-dec7-4006-b3d6-77841cd3ec38",
          "type": "basic.outputLabel",
          "data": {
            "name": "vpixelR",
            "range": "[1:0]",
            "blockColor": "red",
            "virtual": true,
            "pins": [
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 2216,
            "y": 104
          }
        },
        {
          "id": "be3d08a8-5ff0-496b-a124-d049a2988731",
          "type": "basic.inputLabel",
          "data": {
            "name": "pix444",
            "range": "[11:0]",
            "blockColor": "darkorange",
            "virtual": true,
            "pins": [
              {
                "index": "11",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "10",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -224,
            "y": 112
          }
        },
        {
          "id": "28029fa1-0457-4651-9d62-5275737587ff",
          "type": "basic.inputLabel",
          "data": {
            "name": "rst_sys",
            "blockColor": "yellow",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1648,
            "y": 144
          }
        },
        {
          "id": "870773c4-14ec-4893-a5a0-0327d52221ef",
          "type": "basic.outputLabel",
          "data": {
            "name": "pllCLK",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1104,
            "y": 160
          }
        },
        {
          "id": "8dac09b2-de98-45a1-b98e-3ae1d2a2bdbd",
          "type": "basic.inputLabel",
          "data": {
            "name": "systemVsync",
            "blockColor": "yellow",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -224,
            "y": 168
          }
        },
        {
          "id": "6923cc5d-2ea5-44dc-a454-8d8b520b795b",
          "type": "basic.outputLabel",
          "data": {
            "name": "pllCLK",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 768,
            "y": 176
          }
        },
        {
          "id": "188b8258-0eff-428e-8c73-a2fb949aed18",
          "type": "basic.output",
          "data": {
            "name": "G",
            "range": "[1:0]",
            "pins": [
              {
                "index": "1",
                "name": "D2",
                "value": "4"
              },
              {
                "index": "0",
                "name": "D3",
                "value": "3"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 2368,
            "y": 200
          }
        },
        {
          "id": "379f2d37-d5bf-4c5a-82aa-ada4076d41c7",
          "type": "basic.outputLabel",
          "data": {
            "name": "vpixelG",
            "range": "[1:0]",
            "blockColor": "springgreen",
            "virtual": true,
            "pins": [
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 2224,
            "y": 216
          }
        },
        {
          "id": "73991ab6-51c5-41f2-afd2-1c3e5a0d20a7",
          "type": "basic.inputLabel",
          "data": {
            "name": "systemHsync",
            "blockColor": "slateblue",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -224,
            "y": 224
          }
        },
        {
          "id": "81c18286-a84a-411c-ba2a-638f67eb57da",
          "type": "basic.outputLabel",
          "data": {
            "name": "xwe",
            "blockColor": "deepskyblue",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 768,
            "y": 248
          }
        },
        {
          "id": "22311f62-aca3-484d-ac74-46760a1d355b",
          "type": "basic.inputLabel",
          "data": {
            "name": "vCounter",
            "range": "[9:0]",
            "blockColor": "gold",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -224,
            "y": 280
          }
        },
        {
          "id": "ed9e92b8-38a2-45ea-a25d-c6106851e2de",
          "type": "basic.output",
          "data": {
            "name": "B",
            "range": "[1:0]",
            "pins": [
              {
                "index": "1",
                "name": "D4",
                "value": "8"
              },
              {
                "index": "0",
                "name": "D5",
                "value": "7"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 2368,
            "y": 312
          }
        },
        {
          "id": "079c8ad7-9595-4e5f-9469-49ab42c33272",
          "type": "basic.outputLabel",
          "data": {
            "name": "rst_sys",
            "blockColor": "yellow",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1104,
            "y": 320
          }
        },
        {
          "id": "80c02b07-d2fd-4b48-bf4d-8476f62ba68b",
          "type": "basic.outputLabel",
          "data": {
            "name": "vpixelB",
            "range": "[1:0]",
            "blockColor": "deepskyblue",
            "virtual": true,
            "pins": [
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 2224,
            "y": 328
          }
        },
        {
          "id": "443f57c1-8e19-41bf-9a1b-22a315ef29f6",
          "type": "basic.outputLabel",
          "data": {
            "name": "xoe",
            "blockColor": "deepskyblue",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 768,
            "y": 328
          }
        },
        {
          "id": "ac75181d-dc41-4688-893d-90fcc3d76021",
          "type": "basic.inputLabel",
          "data": {
            "name": "hCounter",
            "range": "[9:0]",
            "blockColor": "steelblue",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -224,
            "y": 336
          }
        },
        {
          "id": "99561096-4ef0-4df5-8a49-4aed04c6501b",
          "type": "basic.inputLabel",
          "data": {
            "name": "xwe",
            "blockColor": "deepskyblue",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -232,
            "y": 512
          }
        },
        {
          "id": "2adcd46f-e639-4c3e-8115-6ae6bd6875db",
          "type": "basic.outputLabel",
          "data": {
            "name": "posX",
            "range": "[9:0]",
            "blockColor": "mediumvioletred",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 776,
            "y": 552
          }
        },
        {
          "id": "e99ad0ae-132a-4752-addc-aeec631cf6a4",
          "type": "basic.inputLabel",
          "data": {
            "name": "xoe",
            "blockColor": "deepskyblue",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -232,
            "y": 568
          }
        },
        {
          "id": "b9ceea4f-7756-4e66-b1d5-f9c34151c960",
          "type": "basic.inputLabel",
          "data": {
            "name": "nespad_gclk",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -232,
            "y": 624
          }
        },
        {
          "id": "5cf0394e-ec20-449e-97b4-9df79e4b3d82",
          "type": "basic.input",
          "data": {
            "name": "",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "SW1",
                "value": "34"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -2904,
            "y": 624
          }
        },
        {
          "id": "ca3cc083-3566-4761-bd24-f159c5396484",
          "type": "basic.outputLabel",
          "data": {
            "name": "posY",
            "range": "[9:0]",
            "blockColor": "mediumvioletred",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 776,
            "y": 624
          }
        },
        {
          "id": "e75f2126-e3e9-4ea9-969f-8a2b6601db3f",
          "type": "basic.outputLabel",
          "data": {
            "name": "nespad_gin",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1096,
            "y": 632
          }
        },
        {
          "id": "f2b51d69-85d6-46e0-a8dc-249f05f2073a",
          "type": "basic.inputLabel",
          "data": {
            "name": "nespad_glat",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -232,
            "y": 680
          }
        },
        {
          "id": "2dd7664a-8763-4653-b793-cdcbd0a1f012",
          "type": "basic.input",
          "data": {
            "name": "",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "SW2",
                "value": "33"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -2904,
            "y": 744
          }
        },
        {
          "id": "ee653720-f0ef-4e02-8ee4-6c55bf7f56ab",
          "type": "basic.inputLabel",
          "data": {
            "name": "buttonD",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1632,
            "y": 856
          }
        },
        {
          "id": "00fc4634-7d9e-4013-9899-3a9ab533ac9a",
          "type": "basic.inputLabel",
          "data": {
            "name": "buttonB",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -2352,
            "y": 856
          }
        },
        {
          "id": "c3709e6b-cda8-4b7d-b999-73c45c6a9680",
          "type": "basic.outputLabel",
          "data": {
            "name": "joy_down",
            "blockColor": "springgreen",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -2648,
            "y": 856
          }
        },
        {
          "id": "b9f21861-6480-4aaa-bacd-8403a6ac68ba",
          "type": "basic.inputLabel",
          "data": {
            "name": "buttonA",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -2344,
            "y": 1080
          }
        },
        {
          "id": "072b4fa1-6192-4917-976a-ad5d7cd423b8",
          "type": "basic.outputLabel",
          "data": {
            "name": "joy_up",
            "blockColor": "springgreen",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -2648,
            "y": 1080
          }
        },
        {
          "id": "6e421228-4135-4003-a566-125d994ca58e",
          "type": "basic.outputLabel",
          "data": {
            "name": "pllCLK",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 776,
            "y": 1104
          }
        },
        {
          "id": "33dd84dd-e26e-468b-bdc9-ae6cbca1ab70",
          "type": "basic.inputLabel",
          "data": {
            "name": "buttonU",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1624,
            "y": 1120
          }
        },
        {
          "id": "266acbb0-8af8-40f1-90d2-88eb904c00cb",
          "type": "basic.outputLabel",
          "data": {
            "name": "xwe",
            "blockColor": "deepskyblue",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 776,
            "y": 1176
          }
        },
        {
          "id": "a69052bc-3760-43f6-ad73-f9696983e1c5",
          "type": "basic.inputLabel",
          "data": {
            "name": "buttonL",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1624,
            "y": 1216
          }
        },
        {
          "id": "3a9cb767-e0ed-4a2e-a490-8d9a1bfaec62",
          "type": "basic.outputLabel",
          "data": {
            "name": "xoe",
            "blockColor": "deepskyblue",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 776,
            "y": 1256
          }
        },
        {
          "id": "83dfe13b-ccbd-4180-b252-475c34a659e8",
          "type": "basic.outputLabel",
          "data": {
            "name": "joy_left",
            "blockColor": "springgreen",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1880,
            "y": 1264
          }
        },
        {
          "id": "8a4e6ce3-906e-43b6-bda3-49eaf331668f",
          "type": "basic.inputLabel",
          "data": {
            "name": "buttonR",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1616,
            "y": 1376
          }
        },
        {
          "id": "60477a56-6527-454b-bee2-cff8316a6d96",
          "type": "basic.outputLabel",
          "data": {
            "name": "joy_right",
            "blockColor": "springgreen",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1872,
            "y": 1424
          }
        },
        {
          "id": "e020e4fd-7d7d-47bb-a0c9-89ac8d11ed3f",
          "type": "basic.outputLabel",
          "data": {
            "name": "posX",
            "range": "[9:0]",
            "blockColor": "mediumvioletred",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 768,
            "y": 1480
          }
        },
        {
          "id": "b4bf0e7d-93fa-4b97-845d-364efbfa4743",
          "type": "basic.outputLabel",
          "data": {
            "name": "posY",
            "range": "[9:0]",
            "blockColor": "mediumvioletred",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 768,
            "y": 1552
          }
        },
        {
          "id": "fe7ab3fc-aa38-411e-a68a-93723f4f88ce",
          "type": "basic.outputLabel",
          "data": {
            "name": "pllCLK",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -2384,
            "y": 2040
          }
        },
        {
          "id": "89a70508-6226-4f29-a275-8016e5001c4f",
          "type": "basic.inputLabel",
          "data": {
            "name": "posX",
            "range": "[9:0]",
            "blockColor": "mediumvioletred",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1560,
            "y": 2088
          }
        },
        {
          "id": "19e61d92-3c67-48ef-b306-50df0e6089fb",
          "type": "basic.outputLabel",
          "data": {
            "name": "rst_sys",
            "blockColor": "yellow",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -2384,
            "y": 2144
          }
        },
        {
          "id": "66129c75-ebee-470a-80f9-d72160e33216",
          "type": "basic.outputLabel",
          "data": {
            "name": "pllCLK",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -3296,
            "y": 2256
          }
        },
        {
          "id": "5725bb86-3b17-4057-92af-3b34f89ba1c3",
          "type": "basic.inputLabel",
          "data": {
            "name": "posY",
            "range": "[9:0]",
            "blockColor": "mediumvioletred",
            "virtual": true,
            "pins": [
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -1560,
            "y": 2304
          }
        },
        {
          "id": "304346ab-91d5-4879-b9cb-07ae296b2b1e",
          "type": "basic.outputLabel",
          "data": {
            "name": "pllCLK",
            "blockColor": "fuchsia",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -3856,
            "y": 2344
          }
        },
        {
          "id": "95136be7-5b81-4b3f-954a-031f46c000ab",
          "type": "basic.outputLabel",
          "data": {
            "name": "rst_sys",
            "blockColor": "yellow",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -3856,
            "y": 2416
          }
        },
        {
          "id": "29a52865-04dd-4c11-b14c-cd5364e12362",
          "type": "basic.inputLabel",
          "data": {
            "name": "joy_up",
            "blockColor": "springgreen",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -2456,
            "y": 2456
          }
        },
        {
          "id": "b308273e-117f-4364-b2eb-df3c5edab447",
          "type": "basic.input",
          "data": {
            "name": "int",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "ADC_INT",
                "value": "90"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -3856,
            "y": 2488
          }
        },
        {
          "id": "6b370190-c932-40cd-b32f-fb19e68525b5",
          "type": "basic.output",
          "data": {
            "name": "sda",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "ADC_SDA",
                "value": "83"
              }
            ],
            "inout": true
          },
          "position": {
            "x": -3528,
            "y": 2560
          }
        },
        {
          "id": "aa8f299a-56b6-439c-97d1-34921b300ba6",
          "type": "basic.inputLabel",
          "data": {
            "name": "joy_down",
            "blockColor": "springgreen",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -2456,
            "y": 2560
          }
        },
        {
          "id": "e8d2c1d5-d46b-4fe5-98ba-a65abe8ee948",
          "type": "basic.outputLabel",
          "data": {
            "name": "systemVsync",
            "blockColor": "gold",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -3304,
            "y": 2632
          }
        },
        {
          "id": "a1e9f17c-30a3-4e28-a884-697b5a41d7e9",
          "type": "basic.output",
          "data": {
            "name": "scl",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "ADC_SCL",
                "value": "84"
              }
            ],
            "inout": true
          },
          "position": {
            "x": -3536,
            "y": 2656
          }
        },
        {
          "id": "c1a89581-5e6b-4e74-838c-1437fecb0f97",
          "type": "basic.inputLabel",
          "data": {
            "name": "joy_left",
            "blockColor": "springgreen",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -2456,
            "y": 2664
          }
        },
        {
          "id": "5fcac866-9f4b-4819-9730-68e4c1c03a15",
          "type": "basic.outputLabel",
          "data": {
            "name": "rst_sys",
            "blockColor": "yellow",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -3304,
            "y": 2760
          }
        },
        {
          "id": "78a3d585-0380-4721-8c4f-0ce4fcf01d5f",
          "type": "basic.inputLabel",
          "data": {
            "name": "joy_right",
            "blockColor": "springgreen",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": -2456,
            "y": 2768
          }
        },
        {
          "id": "978a3aae-7b36-4352-ba63-ba32ae90e906",
          "type": "basic.constant",
          "data": {
            "name": "FCLK",
            "value": "25000000",
            "local": false
          },
          "position": {
            "x": -3784,
            "y": 2200
          }
        },
        {
          "id": "aaed2c56-a553-40b5-b322-1ccb4262870f",
          "type": "basic.constant",
          "data": {
            "name": "FSCL",
            "value": "400000",
            "local": false
          },
          "position": {
            "x": -3600,
            "y": 2208
          }
        },
        {
          "id": "a9db4152-53be-4d86-ac70-c8145b1a8e36",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "0",
            "local": false
          },
          "position": {
            "x": -2160,
            "y": -592
          }
        },
        {
          "id": "b1348aa3-c399-454a-b1b3-88ad4899b31c",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "66",
            "local": false
          },
          "position": {
            "x": -2048,
            "y": -592
          }
        },
        {
          "id": "499686d8-d7b1-4f55-b2de-f682ec0656f5",
          "type": "basic.constant",
          "data": {
            "name": "ms",
            "value": "500",
            "local": true
          },
          "position": {
            "x": -1992,
            "y": 40
          }
        },
        {
          "id": "77ba297f-9309-4232-b304-b72a90bba4dd",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "5",
            "local": false
          },
          "position": {
            "x": -1936,
            "y": -592
          }
        },
        {
          "id": "647fb37e-3126-43ce-b09c-e9fbcbccd2c7",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "1",
            "local": false
          },
          "position": {
            "x": -1800,
            "y": 40
          }
        },
        {
          "id": "9823e130-213a-4d02-b241-b9113d6eb514",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "1",
            "local": false
          },
          "position": {
            "x": -1792,
            "y": -592
          }
        },
        {
          "id": "36fc2030-9ef8-4ee8-8306-f7582712696d",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "4",
            "local": false
          },
          "position": {
            "x": 416,
            "y": -792
          }
        },
        {
          "id": "c2e0368e-9941-484b-b66f-3025f217ab08",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "192",
            "local": false
          },
          "position": {
            "x": 544,
            "y": -792
          }
        },
        {
          "id": "fbf39330-832a-4389-9820-81ab6f42eee4",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "100",
            "local": false
          },
          "position": {
            "x": 672,
            "y": -792
          }
        },
        {
          "id": "3a3b957a-953b-446d-b272-4b55c026ef82",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "64",
            "local": false
          },
          "position": {
            "x": 1056,
            "y": -8
          }
        },
        {
          "id": "ab9a18cb-716a-4f56-819b-1eba7b7ba738",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "192",
            "local": false
          },
          "position": {
            "x": 1088,
            "y": 888
          }
        },
        {
          "id": "0e0807b1-3cad-40bc-a5c1-d786de69efc3",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "60",
            "local": false
          },
          "position": {
            "x": 1368,
            "y": -16
          }
        },
        {
          "id": "0ac64f72-725c-4b36-9e2c-8ab92293a356",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "100",
            "local": false
          },
          "position": {
            "x": 1400,
            "y": 880
          }
        },
        {
          "id": "c6555fb5-819d-4e40-8e6b-0bb711ad9df1",
          "type": "e2b7ebc8987796fd3d9166d6b1e579783928ff08",
          "position": {
            "x": -1976,
            "y": -352
          },
          "size": {
            "width": 160,
            "height": 96
          }
        },
        {
          "id": "ff7fd0c2-ab70-448a-ab88-2bf8bf3de8d6",
          "type": "basic.info",
          "data": {
            "info": "HS (HORIZONTAL)  ",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": -72
          },
          "size": {
            "width": 152,
            "height": 32
          }
        },
        {
          "id": "2c4bf928-43e2-40ac-af85-a6427b7a7934",
          "type": "basic.info",
          "data": {
            "info": "**SINCRONISMO**",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": -136
          },
          "size": {
            "width": 136,
            "height": 32
          }
        },
        {
          "id": "bea69e58-8464-4ff7-9664-bac064e4fc6d",
          "type": "basic.info",
          "data": {
            "info": "VS (VERTICAL)  ",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": -104
          },
          "size": {
            "width": 152,
            "height": 32
          }
        },
        {
          "id": "8750b8c6-3ff2-4a60-b340-0e656d225e0a",
          "type": "basic.info",
          "data": {
            "info": "**VGA CONTROL SIGNALS**",
            "readonly": true
          },
          "position": {
            "x": 2368,
            "y": -168
          },
          "size": {
            "width": 320,
            "height": 32
          }
        },
        {
          "id": "ca7ab839-07c9-4ec7-a121-ef00cde59e94",
          "type": "basic.info",
          "data": {
            "info": "R0",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": 152
          },
          "size": {
            "width": 80,
            "height": 40
          }
        },
        {
          "id": "0de6e302-211f-4c9f-8003-55a76eda0d19",
          "type": "basic.info",
          "data": {
            "info": "R1",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": 120
          },
          "size": {
            "width": 80,
            "height": 40
          }
        },
        {
          "id": "c864012a-aa20-48ea-80e7-7abe6c46f869",
          "type": "basic.info",
          "data": {
            "info": "**RED**",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": 96
          },
          "size": {
            "width": 88,
            "height": 32
          }
        },
        {
          "id": "f5b3bbd8-b546-4c00-b933-72a572e9fe6e",
          "type": "basic.info",
          "data": {
            "info": "B0",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": 376
          },
          "size": {
            "width": 80,
            "height": 40
          }
        },
        {
          "id": "e18d9249-df4b-4c75-9129-8d92254e5ba8",
          "type": "basic.info",
          "data": {
            "info": "B1",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": 344
          },
          "size": {
            "width": 80,
            "height": 40
          }
        },
        {
          "id": "154d011b-35d4-4843-ab19-b1173f167bcb",
          "type": "basic.info",
          "data": {
            "info": "**BLUE**",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": 320
          },
          "size": {
            "width": 88,
            "height": 32
          }
        },
        {
          "id": "ad20699f-72fe-4cf4-962f-12de59be3cae",
          "type": "basic.info",
          "data": {
            "info": "G0",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": 264
          },
          "size": {
            "width": 80,
            "height": 40
          }
        },
        {
          "id": "3073d353-eecc-47ee-9580-415095d9b34c",
          "type": "basic.info",
          "data": {
            "info": "G1",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": 232
          },
          "size": {
            "width": 80,
            "height": 40
          }
        },
        {
          "id": "f53198d7-7930-47e0-a10c-c3f74e18c47a",
          "type": "basic.info",
          "data": {
            "info": "**GREEN**",
            "readonly": true
          },
          "position": {
            "x": 2480,
            "y": 200
          },
          "size": {
            "width": 88,
            "height": 32
          }
        },
        {
          "id": "29a9c35a-af70-4f48-a7bf-9065d6b68d75",
          "type": "basic.info",
          "data": {
            "info": "**VGA RGB CHANNELS**:  \n0: black pixel \n1: Color Pixel ",
            "readonly": true
          },
          "position": {
            "x": 2368,
            "y": 16
          },
          "size": {
            "width": 264,
            "height": 64
          }
        },
        {
          "id": "4e765bac-fb8b-4be4-a2d5-d701adc9cc0a",
          "type": "basic.info",
          "data": {
            "info": " **1)** PLL at  25MHz to provide clock for 512 x 384 resolution,\n Values are calculated for Alhambra II board at 12Mhz",
            "readonly": true
          },
          "position": {
            "x": -2160,
            "y": -656
          },
          "size": {
            "width": 496,
            "height": 72
          }
        },
        {
          "id": "e7389d1d-9ba2-4677-82d6-d58fe9fabfe6",
          "type": "basic.info",
          "data": {
            "info": "The new clock will be used for all of the top level blocks",
            "readonly": true
          },
          "position": {
            "x": -1720,
            "y": -288
          },
          "size": {
            "width": 192,
            "height": 112
          }
        },
        {
          "id": "1277c965-30d2-4a6c-b8d7-7d5afa6e9a4e",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [],
              "out": []
            },
            "params": [],
            "code": "// @include fix_mpy.v\n// @include fmul.v\n// @include fmul24.v\n// @include fmulbooth.v\n// @include videomodule.v\n// @include SYSTEM.v\n// @include sram_model.v\n// @include window_checker.v\n// @include resize_mapper.v\n// @include sram_resize.v\n// @include vga_smooth.v\n// @include rgb_444_to_222_lineal.v\n// @include nespad_module.v\n// @include joystick_controller.v\n// @include window_mapping.v"
          },
          "position": {
            "x": -2904,
            "y": -568
          },
          "size": {
            "width": 408,
            "height": 272
          }
        },
        {
          "id": "26adf42c-bc08-469a-b1c8-231f0573acc9",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "we_n"
                },
                {
                  "name": "oe_n"
                },
                {
                  "name": "addr",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "din",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "start_x",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "start_y",
                  "range": "[9:0]",
                  "size": 10
                }
              ],
              "out": [
                {
                  "name": "_dout",
                  "range": "[15:0]",
                  "size": 16
                }
              ]
            },
            "params": [
              {
                "name": "REDUCED_W"
              },
              {
                "name": "REDUCED_H"
              }
            ],
            "code": "wire data_valid;      \n\n\n                 sram_resize#(.REDUCED_W(REDUCED_W),\n                 .REDUCED_H(REDUCED_H)\n                 )sram_inst (\n        .clk(clk),\n        .ce_n(1'b0),             // Always enabled\n        .oe_n(oe_n),             // Output enable from SYSTEM\n        .we_n(we_n),             // Write enable from SYSTEM\n        .bhe_n(1'b0),            // Both bytes enabled\n        .ble_n(1'b0),\n        .addr({2'b00, addr}),     // Extend 16-bit xa to 18-bit addr\n        .data_in(din),            // Data from SYSTEM to SRAM\n        .data_out(_dout),         // Data from SRAM to SYSTEM\n        .data_valid(data_valid),  // Data valid (not used by SYSTEM)\n        .sx(start_x),\n        .sy(start_y[8:0])\n    );"
          },
          "position": {
            "x": 952,
            "y": 168
          },
          "size": {
            "width": 616,
            "height": 528
          }
        },
        {
          "id": "9674abe2-c2cc-420d-b1cc-260f269fce50",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "we_n"
                },
                {
                  "name": "oe_n"
                },
                {
                  "name": "addr",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "din",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "start_x",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "start_y",
                  "range": "[9:0]",
                  "size": 10
                }
              ],
              "out": [
                {
                  "name": "in_window"
                },
                {
                  "name": "_dout",
                  "range": "[15:0]",
                  "size": 16
                }
              ]
            },
            "params": [
              {
                "name": "WINDOW_WIDTH"
              },
              {
                "name": "WINDOW_HEIGHT"
              }
            ],
            "code": "wire data_valid;      \n\n // SRAM model\n    sram_model#(.WIN_W(WINDOW_WIDTH),\n                 .WIN_H(WINDOW_HEIGHT)\n                 )sram_inst (\n        .clk(clk),\n        .ce_n(1'b0),             // Always enabled\n        .oe_n(oe_n),             // Output enable from SYSTEM\n        .we_n(we_n),             // Write enable from SYSTEM\n        .bhe_n(1'b0),            // Both bytes enabled\n        .ble_n(1'b0),\n        .addr({2'b00, addr}),     // Extend 16-bit xa to 18-bit addr\n        .data_in(din),            // Data from SYSTEM to SRAM\n        .data_out(_dout),         // Data from SRAM to SYSTEM\n        .data_valid(data_valid),  // Data valid (not used by SYSTEM)\n        .sx(start_x),\n        .sy(start_y[8:0]),\n        .in_window(in_window)\n    );\n  "
          },
          "position": {
            "x": 984,
            "y": 1096
          },
          "size": {
            "width": 616,
            "height": 528
          }
        },
        {
          "id": "40fc49b4-6b0a-4337-ac74-b82fae6e5071",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "B",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "in_window"
                },
                {
                  "name": "A",
                  "range": "[15:0]",
                  "size": 16
                }
              ],
              "out": [
                {
                  "name": "C",
                  "range": "[15:0]",
                  "size": 16
                }
              ]
            },
            "params": [],
            "code": "assign C = (in_window) ? A : B;\n"
          },
          "position": {
            "x": 1848,
            "y": 1176
          },
          "size": {
            "width": 312,
            "height": 112
          }
        },
        {
          "id": "05cbfccc-9638-415b-9c92-f9f2afc51778",
          "type": "80ac841b78ab68b7668296f4d0b0b4daadc7bcf9",
          "position": {
            "x": 2192,
            "y": -120
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "d16b69b3-53fa-45f0-8189-0916839708ae",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "pixel",
                  "range": "[11:0]",
                  "size": 12
                }
              ],
              "out": [
                {
                  "name": "pixelConv",
                  "range": "[5:0]",
                  "size": 6
                },
                {
                  "name": "R",
                  "range": "[1:0]",
                  "size": 2
                },
                {
                  "name": "G",
                  "range": "[1:0]",
                  "size": 2
                },
                {
                  "name": "B",
                  "range": "[1:0]",
                  "size": 2
                }
              ]
            },
            "params": [],
            "code": "rgb444_to_rgb222 rgb_converter (\n    .pixel_in(pixel),  \n    .pixel_out(pixelConv)  \n);\n\nassign R=pixelConv[5:4];\nassign G=pixelConv[3:2];\nassign B=pixelConv[1:0];"
          },
          "position": {
            "x": 1440,
            "y": -520
          },
          "size": {
            "width": 368,
            "height": 160
          }
        },
        {
          "id": "1edfb855-3ae2-47d8-80f7-5c4f68ebbd5c",
          "type": "febcfed8636b8ee9a98750b96ed9e53a165dd4a8",
          "position": {
            "x": 24,
            "y": -352
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "d522c3c9-e4d5-41c9-9267-afeac6e9b632",
          "type": "basic.info",
          "data": {
            "info": "**FPGA board frequency**",
            "readonly": true
          },
          "position": {
            "x": -3800,
            "y": 2168
          },
          "size": {
            "width": 144,
            "height": 32
          }
        },
        {
          "id": "6225fb07-0e34-42a5-b52b-cf7c0bafc138",
          "type": "basic.info",
          "data": {
            "info": "**I2C frequency**",
            "readonly": true
          },
          "position": {
            "x": -3600,
            "y": 2176
          },
          "size": {
            "width": 88,
            "height": 32
          }
        },
        {
          "id": "b8cb5cc2-c360-4489-8922-4846003de480",
          "type": "basic.info",
          "data": {
            "info": "Connects to the physical SDA pin of the ADC",
            "readonly": true
          },
          "position": {
            "x": -3520,
            "y": 2496
          },
          "size": {
            "width": 152,
            "height": 32
          }
        },
        {
          "id": "cbe75943-ef3b-451e-b054-133bf766271a",
          "type": "basic.info",
          "data": {
            "info": "Connects to the physical SCL pin of the ADC",
            "readonly": true
          },
          "position": {
            "x": -3536,
            "y": 2736
          },
          "size": {
            "width": 152,
            "height": 32
          }
        },
        {
          "id": "1d06cc82-23ff-4034-9038-76b0737db751",
          "type": "basic.info",
          "data": {
            "info": "Connects to the physical INT pin of the ADC",
            "readonly": true
          },
          "position": {
            "x": -3856,
            "y": 2568
          },
          "size": {
            "width": 160,
            "height": 32
          }
        },
        {
          "id": "6e84f01c-b5ad-40c4-9f03-0afbe5151512",
          "type": "ea7a9febdda190d38f531ff33c9624741a805384",
          "position": {
            "x": -3696,
            "y": 2336
          },
          "size": {
            "width": 96,
            "height": 224
          }
        },
        {
          "id": "808c5974-ff29-4055-9fed-53aff7ceca15",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "reset"
                },
                {
                  "name": "posX",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "posY",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "button_up"
                },
                {
                  "name": "button_down"
                },
                {
                  "name": "button_left"
                },
                {
                  "name": "button_right"
                },
                {
                  "name": "button_a"
                },
                {
                  "name": "button_b"
                },
                {
                  "name": "glat"
                },
                {
                  "name": "gclk"
                }
              ],
              "out": [
                {
                  "name": "gin"
                }
              ]
            },
            "params": [],
            "code": "reg [7:0] stateb;\n\nalways @(posedge clk) begin \n    stateb<={ button_a,\n              button_b,\n              1'b0,\n              1'b0,\n              button_up,\n              button_down,\n              button_left,\n              button_right};\nend\n\n// NES pad simulator\nnespad_module nespad (\n        .clk(clk),\n        .reset(reset),\n        .gclk(gclk),\n        .glat(glat),\n        .gin(gin),\n        .buttons(stateb)\n);"
          },
          "position": {
            "x": -832,
            "y": -760
          },
          "size": {
            "width": 432,
            "height": 568
          }
        },
        {
          "id": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "pixRGB",
                  "range": "[11:0]",
                  "size": 12
                },
                {
                  "name": "hsync_in"
                },
                {
                  "name": "vsync_in"
                },
                {
                  "name": "hc",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "vc",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "bypass"
                },
                {
                  "name": "bx",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "by",
                  "range": "[9:0]",
                  "size": 10
                }
              ],
              "out": [
                {
                  "name": "pixel_smoothed",
                  "range": "[11:0]",
                  "size": 12
                },
                {
                  "name": "Ro",
                  "range": "[1:0]",
                  "size": 2
                },
                {
                  "name": "Go",
                  "range": "[1:0]",
                  "size": 2
                },
                {
                  "name": "Bo",
                  "range": "[1:0]",
                  "size": 2
                },
                {
                  "name": "hsync_out"
                },
                {
                  "name": "vsync_out"
                }
              ]
            },
            "params": [
              {
                "name": "BPP"
              },
              {
                "name": "B_W"
              },
              {
                "name": "B_H"
              }
            ],
            "code": "vga_smooth #(\n    .BITS_PER_PIXEL(BPP),\n    .BWIDTH(B_W),\n    .BHEIGHT(B_H)\n) smooth_inst (\n    .clk(clk),\n    .pixel_in(pixRGB),\n    .hc(hc),\n    .vc(vc),\n    .hsync_in(hsync_in),\n    .vsync_in(vsync_in),\n    .bypass(bypass), // 0 o 1\n    .bx(bx),        // Por ejemplo, 100\n    .by(by),        // Por ejemplo, 100\n    .pixel_out(pixel_smoothed),\n    .hsync_out(hsync_out),\n    .vsync_out(vsync_out)\n);\n"
          },
          "position": {
            "x": 400,
            "y": -664
          },
          "size": {
            "width": 384,
            "height": 472
          }
        },
        {
          "id": "57f4cabe-4a43-4a1c-bf8d-17d6588aa1f0",
          "type": "0a6cbed722ec27aad536f9305b8770282dee40cf",
          "position": {
            "x": -1992,
            "y": 160
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "a7958c79-0b48-42e6-9875-a13e39f080fb",
          "type": "a20433be5bd652b5ca9dc0339207d2f694145338",
          "position": {
            "x": -1800,
            "y": 144
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "cd7ae747-d0a0-4b74-a0f1-90cd4d20116e",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "rst"
                },
                {
                  "name": "joy_x",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "joy_y",
                  "range": "[9:0]",
                  "size": 10
                }
              ],
              "out": [
                {
                  "name": "win_x",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "win_y",
                  "range": "[9:0]",
                  "size": 10
                }
              ]
            },
            "params": [],
            "code": "window_mapping #(\n.POS_WIDTH(10),\n      .POS_CENTER_X(10'd1000), \n      .POS_CENTER_Y(10'd1000), \n      .WIDTH(192),\n      .HEIGHT(100),\n      .MAX_W(640),\n      .MAX_H(480)\n\n  ) win_map (\n      .clk  (clk),\n      .rst  (rst),\n      .pos_x(joy_x),   // 10 bits\n      .pos_y(joy_y),   // 10 bits\n      .winx (win_x),   // 10 bits\n      .winy (win_y)    // 10 bits\n  );\n"
          },
          "position": {
            "x": -2208,
            "y": 2016
          },
          "size": {
            "width": 536,
            "height": 424
          }
        },
        {
          "id": "e40c14fa-ed26-4e35-a0e5-c77a400266fe",
          "type": "370abb401e524efd3125464b094b41328bfde9b4",
          "position": {
            "x": -2488,
            "y": 1120
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "3381af51-b9dc-405e-b91b-e91395b67b35",
          "type": "370abb401e524efd3125464b094b41328bfde9b4",
          "position": {
            "x": -2496,
            "y": 896
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "c7ba8372-e9b9-4908-b0c5-cb0222ba60d6",
          "type": "ba518ee261a2be13a9739cd3a01cdcebe0ef63c0",
          "position": {
            "x": -1752,
            "y": 1216
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "3f448262-5710-41b1-81d5-1d2d76c12855",
          "type": "3676a00f3a70e406487ed14b901daf3e4984e63d",
          "position": {
            "x": -2664,
            "y": 704
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "8e85e0b6-dd9f-4afb-b374-344d472987c7",
          "type": "ba518ee261a2be13a9739cd3a01cdcebe0ef63c0",
          "position": {
            "x": -1744,
            "y": 1376
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "d3062644-17ab-452d-8ef2-25ce787a1a16",
          "type": "ba518ee261a2be13a9739cd3a01cdcebe0ef63c0",
          "position": {
            "x": -1760,
            "y": 856
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "20ea9390-1b2b-41f5-8de6-0fd449f36404",
          "type": "ba518ee261a2be13a9739cd3a01cdcebe0ef63c0",
          "position": {
            "x": -1752,
            "y": 1120
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "aac5a871-5386-4dc1-b3b3-43005f5a25bb",
          "type": "3676a00f3a70e406487ed14b901daf3e4984e63d",
          "position": {
            "x": -2664,
            "y": 624
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "1d08a921-3564-4a2a-88d0-908d68b53e86",
          "type": "ba518ee261a2be13a9739cd3a01cdcebe0ef63c0",
          "position": {
            "x": -2056,
            "y": 1360
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "93b15880-76ee-4ce7-910f-a6925eba4178",
          "type": "basic.info",
          "data": {
            "info": "Global Reset circuit, maintain system reset for 500ms at startup",
            "readonly": true
          },
          "position": {
            "x": -2016,
            "y": -32
          },
          "size": {
            "width": 496,
            "height": 72
          }
        },
        {
          "id": "882a2f64-c76a-418c-9fe5-0c3d794f544a",
          "type": "basic.info",
          "data": {
            "info": "Import code block, this list of files have been loaded by Icestudio",
            "readonly": true
          },
          "position": {
            "x": -2896,
            "y": -640
          },
          "size": {
            "width": 496,
            "height": 72
          }
        },
        {
          "id": "42c5df75-6d7b-4738-b4a9-d345b4065a74",
          "type": "basic.info",
          "data": {
            "info": "Button mode cirtcuit, simple logic to change ux interaction\n\n| SW1 | SW2 | ACTION |\n|---- |---- | -----  |\n| [ ] | [ ] | fractal moves with joystick movement, red window indicates direction |\n| [X] | [ ] | fractal freeze, red window could move freely |\n| [ ] | [X] | move joystick up and down for zoom+/- |",
            "readonly": true
          },
          "position": {
            "x": -2912,
            "y": 376
          },
          "size": {
            "width": 528,
            "height": 200
          }
        },
        {
          "id": "f9eeeea8-1e95-480a-9549-49a9821547dd",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "adc_y",
                  "range": "[11:0]",
                  "size": 12
                },
                {
                  "name": "adc_x",
                  "range": "[11:0]",
                  "size": 12
                },
                {
                  "name": "vsync_in"
                },
                {
                  "name": "reset"
                }
              ],
              "out": [
                {
                  "name": "x_out",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "y_out",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "up"
                },
                {
                  "name": "down"
                },
                {
                  "name": "left"
                },
                {
                  "name": "right"
                }
              ]
            },
            "params": [],
            "code": "\n\njoystick_controller u_joystick (\n    .clk    (clk),\n    .mclk   (vsync_in),     // Por ejemplo, 1kHz de muestreo\n    .rst  (reset),\n    .x_adc  (adc_x),\n    .y_adc  (adc_y),\n    .x_out  (x_out),\n    .y_out  (y_out),\n    .up     (up),\n    .down   (down),\n    .left   (left),\n    .right  (right)\n);"
          },
          "position": {
            "x": -3128,
            "y": 2224
          },
          "size": {
            "width": 552,
            "height": 632
          }
        },
        {
          "id": "6f6fea1d-95e7-4fd3-8dc3-42f04a74a340",
          "type": "basic.info",
          "data": {
            "info": "ADC Joystick adquisition, this bloscks, read the joystick via ADC, then filter it to remove noise and do more stable, and translate to our screen coordinate system.\n",
            "readonly": true
          },
          "position": {
            "x": -3256,
            "y": 2032
          },
          "size": {
            "width": 496,
            "height": 72
          }
        },
        {
          "id": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "rst"
                },
                {
                  "name": "xdi",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "gin"
                }
              ],
              "out": [
                {
                  "name": "pixRGB444",
                  "range": "[11:0]",
                  "size": 12
                },
                {
                  "name": "_vsync"
                },
                {
                  "name": "_hsync"
                },
                {
                  "name": "vc",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "hc",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "xa",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "xdo",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "xwe"
                },
                {
                  "name": "xoe"
                },
                {
                  "name": "gclk"
                },
                {
                  "name": "glat"
                }
              ]
            },
            "params": [],
            "code": "wire txd;\nwire mosi;\nwire sss;\nwire fss;\nwire sck;\nwire pinout;\n\n\n// Instantiate SYSTEM module\n    SYSTEM sys_inst (\n        .clk(clk),\n        .reset(rst),             // Active high, matches top.v\n        .hsyn(_hsync),\n        .vsyn(_vsync),\n        .hc(hc),\n        .vc(vc),\n        .video(pixRGB444),\n        .xwe(xwe),\n        .xoe(xoe),\n        .xa(xa),\n        .xdo(xdo),\n        .xdi(xdi), \n        .pinin(0),\n        .pinout(pinout),\n        .rxd(0),\n        .txd(txd),\n        .sck(sck),\n        .mosi(mosi),\n        .miso(0),\n        .fss(fss),\n        .sss(sss),\n        .gclk(gclk),\n        .glat(glat),\n        .gin(gin)\n        // .deb0(), .deb1()      // Debug signals (not connected)\n    );\n"
          },
          "position": {
            "x": -944,
            "y": 112
          },
          "size": {
            "width": 584,
            "height": 632
          }
        },
        {
          "id": "b28c209f-3c4d-4aeb-989b-4b803d967b11",
          "type": "basic.info",
          "data": {
            "info": "Jesus Arias Mandelbrot Machine core ",
            "readonly": true
          },
          "position": {
            "x": -792,
            "y": 40
          },
          "size": {
            "width": 496,
            "height": 72
          }
        },
        {
          "id": "8e8c10ee-f3d3-4803-9510-5b46439043d7",
          "type": "basic.info",
          "data": {
            "info": "SRAM emulator and resizer",
            "readonly": true
          },
          "position": {
            "x": 1160,
            "y": -104
          },
          "size": {
            "width": 496,
            "height": 72
          }
        },
        {
          "id": "95b35d64-1d91-49d4-9c88-bdecd85b9df6",
          "type": "basic.info",
          "data": {
            "info": "Nespad emulator",
            "readonly": true
          },
          "position": {
            "x": -712,
            "y": -856
          },
          "size": {
            "width": 496,
            "height": 72
          }
        },
        {
          "id": "be0fb26a-7503-4d2a-a5d5-6057d244821b",
          "type": "basic.info",
          "data": {
            "info": "Smooth VGA output in realtime",
            "readonly": true
          },
          "position": {
            "x": 416,
            "y": -880
          },
          "size": {
            "width": 496,
            "height": 72
          }
        },
        {
          "id": "0c6bf700-76e1-4fbb-bfe5-45eb737f5461",
          "type": "basic.info",
          "data": {
            "info": "Color Conversion",
            "readonly": true
          },
          "position": {
            "x": 1568,
            "y": -592
          },
          "size": {
            "width": 192,
            "height": 72
          }
        },
        {
          "id": "7bb57af8-0990-4944-a8a1-dadeb48f3cd8",
          "type": "basic.info",
          "data": {
            "info": "VGA OUTPUT",
            "readonly": true
          },
          "position": {
            "x": 2280,
            "y": -256
          },
          "size": {
            "width": 192,
            "height": 72
          }
        },
        {
          "id": "f13f9e9b-31a2-4651-b2ec-6b24415363fe",
          "type": "basic.info",
          "data": {
            "info": "```\n  ███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗██╗     ██████╗ ██████╗  ██████╗ ████████╗ \n  ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝██║     ██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝ \n  ██╔████╔██║███████║██╔██╗ ██║██║  ██║█████╗  ██║     ██████╔╝██████╔╝██║   ██║   ██║    \n  ██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║██╔══╝  ██║     ██╔══██╗██╔══██╗██║   ██║   ██║    \n  ██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████╗███████╗██████╔╝██║  ██║╚██████╔╝   ██║    \n  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝    \n                                                                                            \n                         M A C H I N E   @   A L H A M B R A   I I                          \n\n\n Copyright (c) 2025 Carlos Venegas <carlos@magnitude.es>\n  X: @cavearr | github: @cavearr | FPGAwars: charliva@gmail.com\n \n  This work is dedicated to the public domain under the Creative Commons \n  Zero (CC0) 1.0 Universal. To the extent possible under law, the author(s) \n  have waived all copyright and related or neighboring rights to this work \n  worldwide. No rights are reserved.\n  Full text: https://creativecommons.org/publicdomain/zero/1.0/\n \n  -- Citing authorship is a personal ethical decision -- \n  \n  This work is built over Jesus Arias' awesome Mandelbrot Machine\n  Web: https://www.ele.uva.es/~jesus\n```\n\n\n",
            "readonly": true
          },
          "position": {
            "x": -672,
            "y": 912
          },
          "size": {
            "width": 664,
            "height": 448
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "9823e130-213a-4d02-b241-b9113d6eb514",
            "port": "constant-out"
          },
          "target": {
            "block": "c6555fb5-819d-4e40-8e6b-0bb711ad9df1",
            "port": "90399137-a8c3-4ed5-840d-ca4d8761e77b"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "77ba297f-9309-4232-b304-b72a90bba4dd",
            "port": "constant-out"
          },
          "target": {
            "block": "c6555fb5-819d-4e40-8e6b-0bb711ad9df1",
            "port": "98ad1141-8aab-4a8a-aafa-05e9e26f5c88"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "b1348aa3-c399-454a-b1b3-88ad4899b31c",
            "port": "constant-out"
          },
          "target": {
            "block": "c6555fb5-819d-4e40-8e6b-0bb711ad9df1",
            "port": "3f49b9df-fcf4-4280-b5c6-debfc6bc2bc8"
          },
          "vertices": [
            {
              "x": -1928,
              "y": -456
            },
            {
              "x": -1928,
              "y": -416
            }
          ]
        },
        {
          "source": {
            "block": "a9db4152-53be-4d86-ac70-c8145b1a8e36",
            "port": "constant-out"
          },
          "target": {
            "block": "c6555fb5-819d-4e40-8e6b-0bb711ad9df1",
            "port": "2fd92240-60a4-44c9-be80-6766ca83f848"
          }
        },
        {
          "source": {
            "block": "0e4a1380-f000-45d8-99bf-753381c06e6c",
            "port": "out"
          },
          "target": {
            "block": "c6555fb5-819d-4e40-8e6b-0bb711ad9df1",
            "port": "2574504e-cb31-48e0-927c-a5a9d25a32ee"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "870773c4-14ec-4893-a5a0-0327d52221ef",
            "port": "outlabel"
          },
          "target": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "c6555fb5-819d-4e40-8e6b-0bb711ad9df1",
            "port": "c1d27914-585a-465d-bcb5-058c17f59330"
          },
          "target": {
            "block": "e16a8db3-4305-4351-bbfa-1eb72ce46abe",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "079c8ad7-9595-4e5f-9469-49ab42c33272",
            "port": "outlabel"
          },
          "target": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "rst"
          }
        },
        {
          "source": {
            "block": "6923cc5d-2ea5-44dc-a454-8d8b520b795b",
            "port": "outlabel"
          },
          "target": {
            "block": "26adf42c-bc08-469a-b1c8-231f0573acc9",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "xa"
          },
          "target": {
            "block": "26adf42c-bc08-469a-b1c8-231f0573acc9",
            "port": "addr"
          },
          "vertices": [
            {
              "x": 624,
              "y": 432
            }
          ],
          "size": 16
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "xdo"
          },
          "target": {
            "block": "26adf42c-bc08-469a-b1c8-231f0573acc9",
            "port": "din"
          },
          "vertices": [],
          "size": 16
        },
        {
          "source": {
            "block": "ab9a18cb-716a-4f56-819b-1eba7b7ba738",
            "port": "constant-out"
          },
          "target": {
            "block": "9674abe2-c2cc-420d-b1cc-260f269fce50",
            "port": "WINDOW_WIDTH"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "0ac64f72-725c-4b36-9e2c-8ab92293a356",
            "port": "constant-out"
          },
          "target": {
            "block": "9674abe2-c2cc-420d-b1cc-260f269fce50",
            "port": "WINDOW_HEIGHT"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "6e421228-4135-4003-a566-125d994ca58e",
            "port": "outlabel"
          },
          "target": {
            "block": "9674abe2-c2cc-420d-b1cc-260f269fce50",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "3a3b957a-953b-446d-b272-4b55c026ef82",
            "port": "constant-out"
          },
          "target": {
            "block": "26adf42c-bc08-469a-b1c8-231f0573acc9",
            "port": "REDUCED_W"
          }
        },
        {
          "source": {
            "block": "0e0807b1-3cad-40bc-a5c1-d786de69efc3",
            "port": "constant-out"
          },
          "target": {
            "block": "26adf42c-bc08-469a-b1c8-231f0573acc9",
            "port": "REDUCED_H"
          }
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "xa"
          },
          "target": {
            "block": "9674abe2-c2cc-420d-b1cc-260f269fce50",
            "port": "addr"
          },
          "vertices": [
            {
              "x": 592,
              "y": 1336
            }
          ],
          "size": 16
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "xdo"
          },
          "target": {
            "block": "9674abe2-c2cc-420d-b1cc-260f269fce50",
            "port": "din"
          },
          "vertices": [
            {
              "x": 240,
              "y": 1400
            }
          ],
          "size": 16
        },
        {
          "source": {
            "block": "9674abe2-c2cc-420d-b1cc-260f269fce50",
            "port": "_dout"
          },
          "target": {
            "block": "40fc49b4-6b0a-4337-ac74-b82fae6e5071",
            "port": "A"
          },
          "vertices": [
            {
              "x": 1688,
              "y": 1376
            }
          ],
          "size": 16
        },
        {
          "source": {
            "block": "9674abe2-c2cc-420d-b1cc-260f269fce50",
            "port": "in_window"
          },
          "target": {
            "block": "40fc49b4-6b0a-4337-ac74-b82fae6e5071",
            "port": "in_window"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "26adf42c-bc08-469a-b1c8-231f0573acc9",
            "port": "_dout"
          },
          "target": {
            "block": "40fc49b4-6b0a-4337-ac74-b82fae6e5071",
            "port": "B"
          },
          "vertices": [
            {
              "x": 1680,
              "y": 984
            }
          ],
          "size": 16
        },
        {
          "source": {
            "block": "40fc49b4-6b0a-4337-ac74-b82fae6e5071",
            "port": "C"
          },
          "target": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "xdi"
          },
          "vertices": [
            {
              "x": 2264,
              "y": 1696
            },
            {
              "x": -1240,
              "y": 1288
            }
          ],
          "size": 16
        },
        {
          "source": {
            "block": "5b905848-6848-4445-8d46-9dade25c4e47",
            "port": "outlabel"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "c5827cb1-7921-45bb-b1f3-57bc537eb459",
            "port": "outlabel"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "hsync_in"
          }
        },
        {
          "source": {
            "block": "5dc3ab69-2450-4b97-8a46-2529411ee0e1",
            "port": "outlabel"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "vsync_in"
          }
        },
        {
          "source": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "hsync_out"
          },
          "target": {
            "block": "c241192d-d415-45a7-b115-bc7fcfb0936f",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "vsync_out"
          },
          "target": {
            "block": "f3ea9f09-3d4e-4188-b3d1-419ef83fd046",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "5af85aff-4ad0-4d02-824a-77225ec76992",
            "port": "outlabel"
          },
          "target": {
            "block": "05cbfccc-9638-415b-9c92-f9f2afc51778",
            "port": "969e11ca-69e8-403b-a566-7bf2fbe3a5a8"
          }
        },
        {
          "source": {
            "block": "cfd57c08-b349-46a9-85a0-cfb41005339f",
            "port": "outlabel"
          },
          "target": {
            "block": "05cbfccc-9638-415b-9c92-f9f2afc51778",
            "port": "e4111201-8441-4e7d-bcd2-bcf9d265d043"
          }
        },
        {
          "source": {
            "block": "05cbfccc-9638-415b-9c92-f9f2afc51778",
            "port": "99661aef-c9bf-473e-93c4-8f5edf511d36"
          },
          "target": {
            "block": "434fd55d-6363-4fe1-8d09-527024027ddb",
            "port": "in"
          },
          "vertices": [],
          "size": 2
        },
        {
          "source": {
            "block": "0c7db44c-dec7-4006-b3d6-77841cd3ec38",
            "port": "outlabel"
          },
          "target": {
            "block": "82af9d35-aa56-44b5-9b8e-658de052bb43",
            "port": "in"
          },
          "size": 2
        },
        {
          "source": {
            "block": "379f2d37-d5bf-4c5a-82aa-ada4076d41c7",
            "port": "outlabel"
          },
          "target": {
            "block": "188b8258-0eff-428e-8c73-a2fb949aed18",
            "port": "in"
          },
          "size": 2
        },
        {
          "source": {
            "block": "80c02b07-d2fd-4b48-bf4d-8476f62ba68b",
            "port": "outlabel"
          },
          "target": {
            "block": "ed9e92b8-38a2-45ea-a25d-c6106851e2de",
            "port": "in"
          },
          "size": 2
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "_vsync"
          },
          "target": {
            "block": "8dac09b2-de98-45a1-b98e-3ae1d2a2bdbd",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "_hsync"
          },
          "target": {
            "block": "73991ab6-51c5-41f2-afd2-1c3e5a0d20a7",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "pixRGB444"
          },
          "target": {
            "block": "be3d08a8-5ff0-496b-a124-d049a2988731",
            "port": "inlabel"
          },
          "size": 12
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "vc"
          },
          "target": {
            "block": "22311f62-aca3-484d-ac74-46760a1d355b",
            "port": "inlabel"
          },
          "size": 10
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "hc"
          },
          "target": {
            "block": "ac75181d-dc41-4688-893d-90fcc3d76021",
            "port": "inlabel"
          },
          "size": 10
        },
        {
          "source": {
            "block": "5c102dc0-9d48-49cf-8d58-674ebf791bb5",
            "port": "outlabel"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "vc"
          },
          "size": 10
        },
        {
          "source": {
            "block": "312d8009-7aa3-461a-b2a0-972bb876990b",
            "port": "outlabel"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "hc"
          },
          "size": 10
        },
        {
          "source": {
            "block": "d2642d17-4b55-4275-b4db-b71d6434f9f7",
            "port": "outlabel"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "pixRGB"
          },
          "size": 12
        },
        {
          "source": {
            "block": "3a7e2d18-f365-474b-94c0-0ba93c4381cb",
            "port": "outlabel"
          },
          "target": {
            "block": "d16b69b3-53fa-45f0-8189-0916839708ae",
            "port": "pixel"
          },
          "size": 12
        },
        {
          "source": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "pixel_smoothed"
          },
          "target": {
            "block": "936f86ea-6c24-4bce-873f-c6f2f10ea1c3",
            "port": "inlabel"
          },
          "size": 12
        },
        {
          "source": {
            "block": "d16b69b3-53fa-45f0-8189-0916839708ae",
            "port": "R"
          },
          "target": {
            "block": "b8198d29-6ee5-4ca8-93b0-1be62e4491a9",
            "port": "inlabel"
          },
          "size": 2
        },
        {
          "source": {
            "block": "d16b69b3-53fa-45f0-8189-0916839708ae",
            "port": "G"
          },
          "target": {
            "block": "9c3c24bd-1046-4b0d-8043-b521b4373897",
            "port": "inlabel"
          },
          "size": 2
        },
        {
          "source": {
            "block": "d16b69b3-53fa-45f0-8189-0916839708ae",
            "port": "B"
          },
          "target": {
            "block": "940f4c59-1d1c-4829-a07f-dc06bef4a2df",
            "port": "inlabel"
          },
          "size": 2
        },
        {
          "source": {
            "block": "1edfb855-3ae2-47d8-80f7-5c4f68ebbd5c",
            "port": "3d584b0a-29eb-47af-8c43-c0822282ef05"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "bypass"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "2adcd46f-e639-4c3e-8115-6ae6bd6875db",
            "port": "outlabel"
          },
          "target": {
            "block": "26adf42c-bc08-469a-b1c8-231f0573acc9",
            "port": "start_x"
          },
          "size": 10
        },
        {
          "source": {
            "block": "e020e4fd-7d7d-47bb-a0c9-89ac8d11ed3f",
            "port": "outlabel"
          },
          "target": {
            "block": "9674abe2-c2cc-420d-b1cc-260f269fce50",
            "port": "start_x"
          },
          "size": 10
        },
        {
          "source": {
            "block": "6e84f01c-b5ad-40c4-9f03-0afbe5151512",
            "port": "086227c3-aa9d-4b22-b817-4171cef9ddf1"
          },
          "target": {
            "block": "a1e9f17c-30a3-4e28-a884-697b5a41d7e9",
            "port": "in"
          },
          "vertices": [
            {
              "x": -3552,
              "y": 2592
            }
          ]
        },
        {
          "source": {
            "block": "6e84f01c-b5ad-40c4-9f03-0afbe5151512",
            "port": "3e36071d-ca4a-4b1c-a867-6f5dc933f1de"
          },
          "target": {
            "block": "6b370190-c932-40cd-b32f-fb19e68525b5",
            "port": "in"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "b308273e-117f-4364-b2eb-df3c5edab447",
            "port": "out"
          },
          "target": {
            "block": "6e84f01c-b5ad-40c4-9f03-0afbe5151512",
            "port": "7cea6d3b-d266-41a5-90da-ccf4919a5af1"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "978a3aae-7b36-4352-ba63-ba32ae90e906",
            "port": "constant-out"
          },
          "target": {
            "block": "6e84f01c-b5ad-40c4-9f03-0afbe5151512",
            "port": "d61afcc3-679d-4c6a-bf85-0f606fbe3557"
          },
          "vertices": [
            {
              "x": -3704,
              "y": 2288
            }
          ]
        },
        {
          "source": {
            "block": "aaed2c56-a553-40b5-b322-1ccb4262870f",
            "port": "constant-out"
          },
          "target": {
            "block": "6e84f01c-b5ad-40c4-9f03-0afbe5151512",
            "port": "6fc383b5-da59-42b6-9634-f4538a0b1717"
          },
          "vertices": [
            {
              "x": -3616,
              "y": 2288
            }
          ]
        },
        {
          "source": {
            "block": "95136be7-5b81-4b3f-954a-031f46c000ab",
            "port": "outlabel"
          },
          "target": {
            "block": "6e84f01c-b5ad-40c4-9f03-0afbe5151512",
            "port": "0b783276-8c26-4986-b520-a65d9baab8eb"
          }
        },
        {
          "source": {
            "block": "ca3cc083-3566-4761-bd24-f159c5396484",
            "port": "outlabel"
          },
          "target": {
            "block": "26adf42c-bc08-469a-b1c8-231f0573acc9",
            "port": "start_y"
          },
          "size": 10
        },
        {
          "source": {
            "block": "b4bf0e7d-93fa-4b97-845d-364efbfa4743",
            "port": "outlabel"
          },
          "target": {
            "block": "9674abe2-c2cc-420d-b1cc-260f269fce50",
            "port": "start_y"
          },
          "size": 10
        },
        {
          "source": {
            "block": "6d469d65-1209-4a40-9111-69be41ded9d2",
            "port": "outlabel"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "by"
          },
          "size": 10
        },
        {
          "source": {
            "block": "304346ab-91d5-4879-b9cb-07ae296b2b1e",
            "port": "outlabel"
          },
          "target": {
            "block": "6e84f01c-b5ad-40c4-9f03-0afbe5151512",
            "port": "25dc1567-a6cf-4afc-be1f-6fe455dd8ac8"
          }
        },
        {
          "source": {
            "block": "66129c75-ebee-470a-80f9-d72160e33216",
            "port": "outlabel"
          },
          "target": {
            "block": "f9eeeea8-1e95-480a-9549-49a9821547dd",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "e8d2c1d5-d46b-4fe5-98ba-a65abe8ee948",
            "port": "outlabel"
          },
          "target": {
            "block": "f9eeeea8-1e95-480a-9549-49a9821547dd",
            "port": "vsync_in"
          }
        },
        {
          "source": {
            "block": "fd8f118e-4798-4d31-9778-8070cabe431b",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "b150f6d9-85bf-4002-b436-374f52bf1254",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "reset"
          }
        },
        {
          "source": {
            "block": "d203341d-6a50-4966-8304-7888e73eff11",
            "port": "outlabel"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "bx"
          },
          "size": 10
        },
        {
          "source": {
            "block": "6db61e6e-c297-455d-b8a8-5648fc209b29",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "posX"
          },
          "size": 10
        },
        {
          "source": {
            "block": "fbe559b3-32d7-4f0f-a732-8297b2d1ac7d",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "posY"
          },
          "size": 10
        },
        {
          "source": {
            "block": "53a8f256-affe-4531-bfe6-c9c831113a78",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "button_a"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "gin"
          },
          "target": {
            "block": "9f790f37-be01-4cce-bb64-9ffed8844fc8",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "e75f2126-e3e9-4ea9-969f-8a2b6601db3f",
            "port": "outlabel"
          },
          "target": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "gin"
          }
        },
        {
          "source": {
            "block": "7ca66133-799f-442f-89d6-0ac2b3cb282a",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "glat"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "74be30ec-0e7b-4f5e-b60f-80c6eb9f608c",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "gclk"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "gclk"
          },
          "target": {
            "block": "b9ceea4f-7756-4e66-b1d5-f9c34151c960",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "glat"
          },
          "target": {
            "block": "f2b51d69-85d6-46e0-a8dc-249f05f2073a",
            "port": "inlabel"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "1584c643-08d5-4529-93fd-846bde36b326",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "button_left"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "0265abcc-c2b8-4844-b85a-2da4a945f90b",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "button_right"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "700da4a5-7352-495f-8afd-2394f4c1e586",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "button_b"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "a4fe2d5f-ead5-464d-ab63-7937db59e35a",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "button_up"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "2b69b267-5e70-45fd-8fe8-ea89d216a17f",
            "port": "outlabel"
          },
          "target": {
            "block": "808c5974-ff29-4055-9fed-53aff7ceca15",
            "port": "button_down"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "36fc2030-9ef8-4ee8-8306-f7582712696d",
            "port": "constant-out"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "BPP"
          }
        },
        {
          "source": {
            "block": "c2e0368e-9941-484b-b66f-3025f217ab08",
            "port": "constant-out"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "B_W"
          }
        },
        {
          "source": {
            "block": "fbf39330-832a-4389-9820-81ab6f42eee4",
            "port": "constant-out"
          },
          "target": {
            "block": "c24a40aa-f85f-4990-92e2-d9a7c7511b69",
            "port": "B_H"
          }
        },
        {
          "source": {
            "block": "6e84f01c-b5ad-40c4-9f03-0afbe5151512",
            "port": "84cd3706-f46a-447a-8a52-ed0458fe9856"
          },
          "target": {
            "block": "f9eeeea8-1e95-480a-9549-49a9821547dd",
            "port": "adc_y"
          },
          "size": 12
        },
        {
          "source": {
            "block": "499686d8-d7b1-4f55-b2de-f682ec0656f5",
            "port": "constant-out"
          },
          "target": {
            "block": "57f4cabe-4a43-4a1c-bf8d-17d6588aa1f0",
            "port": "65c85742-9f02-4750-bef5-6383c327f552"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "57f4cabe-4a43-4a1c-bf8d-17d6588aa1f0",
            "port": "9b5dbdc2-e548-4504-9872-7334f7dda6c0"
          },
          "target": {
            "block": "a7958c79-0b48-42e6-9875-a13e39f080fb",
            "port": "bf2f0c53-2d04-4cba-aa70-2df85502d24f"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "647fb37e-3126-43ce-b09c-e9fbcbccd2c7",
            "port": "constant-out"
          },
          "target": {
            "block": "a7958c79-0b48-42e6-9875-a13e39f080fb",
            "port": "65194b18-5d2a-41b2-bd86-01be99978ad6"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "a7958c79-0b48-42e6-9875-a13e39f080fb",
            "port": "aa84d31e-cd92-44c7-bb38-c7a4cd903a78"
          },
          "target": {
            "block": "28029fa1-0457-4651-9d62-5275737587ff",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "5fcac866-9f4b-4819-9730-68e4c1c03a15",
            "port": "outlabel"
          },
          "target": {
            "block": "f9eeeea8-1e95-480a-9549-49a9821547dd",
            "port": "reset"
          }
        },
        {
          "source": {
            "block": "b879becb-3c0b-4e39-889f-674558aa35d8",
            "port": "outlabel"
          },
          "target": {
            "block": "57f4cabe-4a43-4a1c-bf8d-17d6588aa1f0",
            "port": "a84f120d-9b95-4a69-a021-773b0637c657"
          }
        },
        {
          "source": {
            "block": "b879becb-3c0b-4e39-889f-674558aa35d8",
            "port": "outlabel"
          },
          "target": {
            "block": "a7958c79-0b48-42e6-9875-a13e39f080fb",
            "port": "3943e194-090b-4553-9df3-88bc4b17abc2"
          }
        },
        {
          "source": {
            "block": "fe7ab3fc-aa38-411e-a68a-93723f4f88ce",
            "port": "outlabel"
          },
          "target": {
            "block": "cd7ae747-d0a0-4b74-a0f1-90cd4d20116e",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "19e61d92-3c67-48ef-b306-50df0e6089fb",
            "port": "outlabel"
          },
          "target": {
            "block": "cd7ae747-d0a0-4b74-a0f1-90cd4d20116e",
            "port": "rst"
          }
        },
        {
          "source": {
            "block": "f9eeeea8-1e95-480a-9549-49a9821547dd",
            "port": "x_out"
          },
          "target": {
            "block": "cd7ae747-d0a0-4b74-a0f1-90cd4d20116e",
            "port": "joy_x"
          },
          "size": 10
        },
        {
          "source": {
            "block": "f9eeeea8-1e95-480a-9549-49a9821547dd",
            "port": "y_out"
          },
          "target": {
            "block": "cd7ae747-d0a0-4b74-a0f1-90cd4d20116e",
            "port": "joy_y"
          },
          "size": 10
        },
        {
          "source": {
            "block": "cd7ae747-d0a0-4b74-a0f1-90cd4d20116e",
            "port": "win_x"
          },
          "target": {
            "block": "89a70508-6226-4f29-a275-8016e5001c4f",
            "port": "inlabel"
          },
          "size": 10
        },
        {
          "source": {
            "block": "cd7ae747-d0a0-4b74-a0f1-90cd4d20116e",
            "port": "win_y"
          },
          "target": {
            "block": "5725bb86-3b17-4057-92af-3b34f89ba1c3",
            "port": "inlabel"
          },
          "size": 10
        },
        {
          "source": {
            "block": "e40c14fa-ed26-4e35-a0e5-c77a400266fe",
            "port": "0e6a9a81-8521-4ade-8012-71915b39ae41"
          },
          "target": {
            "block": "b9f21861-6480-4aaa-bacd-8403a6ac68ba",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "3381af51-b9dc-405e-b91b-e91395b67b35",
            "port": "0e6a9a81-8521-4ade-8012-71915b39ae41"
          },
          "target": {
            "block": "00fc4634-7d9e-4013-9899-3a9ab533ac9a",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "2dd7664a-8763-4653-b793-cdcbd0a1f012",
            "port": "out"
          },
          "target": {
            "block": "3381af51-b9dc-405e-b91b-e91395b67b35",
            "port": "d4a339a0-7bdb-4695-8f6b-93ea4a70b36a"
          },
          "vertices": [
            {
              "x": -2712,
              "y": 936
            }
          ]
        },
        {
          "source": {
            "block": "2dd7664a-8763-4653-b793-cdcbd0a1f012",
            "port": "out"
          },
          "target": {
            "block": "e40c14fa-ed26-4e35-a0e5-c77a400266fe",
            "port": "d4a339a0-7bdb-4695-8f6b-93ea4a70b36a"
          },
          "vertices": [
            {
              "x": -2760,
              "y": 1168
            }
          ]
        },
        {
          "source": {
            "block": "2dd7664a-8763-4653-b793-cdcbd0a1f012",
            "port": "out"
          },
          "target": {
            "block": "3f448262-5710-41b1-81d5-1d2d76c12855",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "c7ba8372-e9b9-4908-b0c5-cb0222ba60d6",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "a69052bc-3760-43f6-ad73-f9696983e1c5",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "8e85e0b6-dd9f-4afb-b374-344d472987c7",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "8a4e6ce3-906e-43b6-bda3-49eaf331668f",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "20ea9390-1b2b-41f5-8de6-0fd449f36404",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "33dd84dd-e26e-468b-bdc9-ae6cbca1ab70",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "d3062644-17ab-452d-8ef2-25ce787a1a16",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "ee653720-f0ef-4e02-8ee4-6c55bf7f56ab",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "e40c14fa-ed26-4e35-a0e5-c77a400266fe",
            "port": "798f4215-8ebd-4cdc-9532-7b34129244f8"
          },
          "target": {
            "block": "20ea9390-1b2b-41f5-8de6-0fd449f36404",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          }
        },
        {
          "source": {
            "block": "5cf0394e-ec20-449e-97b4-9df79e4b3d82",
            "port": "out"
          },
          "target": {
            "block": "aac5a871-5386-4dc1-b3b3-43005f5a25bb",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "aac5a871-5386-4dc1-b3b3-43005f5a25bb",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "d3062644-17ab-452d-8ef2-25ce787a1a16",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "3381af51-b9dc-405e-b91b-e91395b67b35",
            "port": "798f4215-8ebd-4cdc-9532-7b34129244f8"
          },
          "target": {
            "block": "d3062644-17ab-452d-8ef2-25ce787a1a16",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "aac5a871-5386-4dc1-b3b3-43005f5a25bb",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "20ea9390-1b2b-41f5-8de6-0fd449f36404",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          },
          "vertices": [
            {
              "x": -1840,
              "y": 888
            }
          ]
        },
        {
          "source": {
            "block": "3f448262-5710-41b1-81d5-1d2d76c12855",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "1d08a921-3564-4a2a-88d0-908d68b53e86",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          },
          "vertices": [
            {
              "x": -2144,
              "y": 1304
            }
          ]
        },
        {
          "source": {
            "block": "aac5a871-5386-4dc1-b3b3-43005f5a25bb",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "1d08a921-3564-4a2a-88d0-908d68b53e86",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          },
          "vertices": [
            {
              "x": -2096,
              "y": 1304
            }
          ]
        },
        {
          "source": {
            "block": "1d08a921-3564-4a2a-88d0-908d68b53e86",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "c7ba8372-e9b9-4908-b0c5-cb0222ba60d6",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          },
          "vertices": [
            {
              "x": -1920,
              "y": 1344
            }
          ]
        },
        {
          "source": {
            "block": "1d08a921-3564-4a2a-88d0-908d68b53e86",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "8e85e0b6-dd9f-4afb-b374-344d472987c7",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "072b4fa1-6192-4917-976a-ad5d7cd423b8",
            "port": "outlabel"
          },
          "target": {
            "block": "e40c14fa-ed26-4e35-a0e5-c77a400266fe",
            "port": "adf3a6ae-71e2-43dd-b504-c2cdbc14dab7"
          }
        },
        {
          "source": {
            "block": "c3709e6b-cda8-4b7d-b999-73c45c6a9680",
            "port": "outlabel"
          },
          "target": {
            "block": "3381af51-b9dc-405e-b91b-e91395b67b35",
            "port": "adf3a6ae-71e2-43dd-b504-c2cdbc14dab7"
          }
        },
        {
          "source": {
            "block": "f9eeeea8-1e95-480a-9549-49a9821547dd",
            "port": "up"
          },
          "target": {
            "block": "29a52865-04dd-4c11-b14c-cd5364e12362",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "f9eeeea8-1e95-480a-9549-49a9821547dd",
            "port": "down"
          },
          "target": {
            "block": "aa8f299a-56b6-439c-97d1-34921b300ba6",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "f9eeeea8-1e95-480a-9549-49a9821547dd",
            "port": "left"
          },
          "target": {
            "block": "c1a89581-5e6b-4e74-838c-1437fecb0f97",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "83dfe13b-ccbd-4180-b252-475c34a659e8",
            "port": "outlabel"
          },
          "target": {
            "block": "c7ba8372-e9b9-4908-b0c5-cb0222ba60d6",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          }
        },
        {
          "source": {
            "block": "f9eeeea8-1e95-480a-9549-49a9821547dd",
            "port": "right"
          },
          "target": {
            "block": "78a3d585-0380-4721-8c4f-0ce4fcf01d5f",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "60477a56-6527-454b-bee2-cff8316a6d96",
            "port": "outlabel"
          },
          "target": {
            "block": "8e85e0b6-dd9f-4afb-b374-344d472987c7",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          }
        },
        {
          "source": {
            "block": "6e84f01c-b5ad-40c4-9f03-0afbe5151512",
            "port": "0f105e61-2a1c-48bf-b3d8-1522bf6f9b27"
          },
          "target": {
            "block": "f9eeeea8-1e95-480a-9549-49a9821547dd",
            "port": "adc_x"
          },
          "size": 12
        },
        {
          "source": {
            "block": "443f57c1-8e19-41bf-9a1b-22a315ef29f6",
            "port": "outlabel"
          },
          "target": {
            "block": "26adf42c-bc08-469a-b1c8-231f0573acc9",
            "port": "oe_n"
          }
        },
        {
          "source": {
            "block": "3a9cb767-e0ed-4a2e-a490-8d9a1bfaec62",
            "port": "outlabel"
          },
          "target": {
            "block": "9674abe2-c2cc-420d-b1cc-260f269fce50",
            "port": "oe_n"
          }
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "xoe"
          },
          "target": {
            "block": "e99ad0ae-132a-4752-addc-aeec631cf6a4",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "81c18286-a84a-411c-ba2a-638f67eb57da",
            "port": "outlabel"
          },
          "target": {
            "block": "26adf42c-bc08-469a-b1c8-231f0573acc9",
            "port": "we_n"
          }
        },
        {
          "source": {
            "block": "266acbb0-8af8-40f1-90d2-88eb904c00cb",
            "port": "outlabel"
          },
          "target": {
            "block": "9674abe2-c2cc-420d-b1cc-260f269fce50",
            "port": "we_n"
          }
        },
        {
          "source": {
            "block": "edeaa82e-58e2-4a7f-b28d-ee0928151c3a",
            "port": "xwe"
          },
          "target": {
            "block": "99561096-4ef0-4df5-8a49-4aed04c6501b",
            "port": "inlabel"
          }
        }
      ]
    }
  },
  "dependencies": {
    "e2b7ebc8987796fd3d9166d6b1e579783928ff08": {
      "package": {
        "name": "PLL40_PAD",
        "version": "0.9",
        "description": "SB_PLL40_PAD",
        "author": "J. C. Fabero",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "2fd92240-60a4-44c9-be80-6766ca83f848",
              "type": "basic.constant",
              "data": {
                "name": "DIVR",
                "value": "0",
                "local": false
              },
              "position": {
                "x": -264,
                "y": -88
              }
            },
            {
              "id": "3f49b9df-fcf4-4280-b5c6-debfc6bc2bc8",
              "type": "basic.constant",
              "data": {
                "name": "DIVF",
                "value": "66",
                "local": false
              },
              "position": {
                "x": -168,
                "y": -88
              }
            },
            {
              "id": "98ad1141-8aab-4a8a-aafa-05e9e26f5c88",
              "type": "basic.constant",
              "data": {
                "name": "DIVQ",
                "value": "5",
                "local": false
              },
              "position": {
                "x": -72,
                "y": -88
              }
            },
            {
              "id": "90399137-a8c3-4ed5-840d-ca4d8761e77b",
              "type": "basic.constant",
              "data": {
                "name": "FILTER_RANGE",
                "value": "1",
                "local": false
              },
              "position": {
                "x": 24,
                "y": -88
              }
            },
            {
              "id": "142bff3b-0e8d-4c90-be57-fd0cf90a83d0",
              "type": "basic.constant",
              "data": {
                "name": "FEEDBACK_PATH",
                "value": "\"SIMPLE\"",
                "local": false
              },
              "position": {
                "x": 120,
                "y": -88
              }
            },
            {
              "id": "c1d27914-585a-465d-bcb5-058c17f59330",
              "type": "basic.output",
              "data": {
                "name": "PLLOUTGLOBAL"
              },
              "position": {
                "x": 328,
                "y": 72
              }
            },
            {
              "id": "2574504e-cb31-48e0-927c-a5a9d25a32ee",
              "type": "basic.input",
              "data": {
                "name": "PACKAGEPIN",
                "clock": true
              },
              "position": {
                "x": -512,
                "y": 72
              }
            },
            {
              "id": "32350a04-5ae1-4e2f-bbdd-e9de1e56c5f0",
              "type": "basic.output",
              "data": {
                "name": "PLLOUTCORE"
              },
              "position": {
                "x": 328,
                "y": 160
              }
            },
            {
              "id": "7903eca8-9973-4d6d-84f4-bf36c937357f",
              "type": "basic.output",
              "data": {
                "name": "LOCK"
              },
              "position": {
                "x": 328,
                "y": 248
              }
            },
            {
              "id": "407b3bd7-435e-4bcc-b8c7-9d092172946a",
              "type": "c83dcd1d9ab420d911df81b3dfae04681559c623",
              "position": {
                "x": -456,
                "y": 160
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "83bc8e5a-1f84-4f17-8d2a-b8ad2b1776d5",
              "type": "c4dd08263a85a91ba53e2ae2b38de344c5efcb52",
              "position": {
                "x": -456,
                "y": 248
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
              "type": "basic.code",
              "data": {
                "code": "SB_PLL40_PAD #(\n\t\t.FEEDBACK_PATH(\"SIMPLE\"),\n\t\t.DIVR(DIVR),\t\t// DIVR =  0\n\t\t.DIVF(DIVF),\t// DIVF = 79\n\t\t.DIVQ(DIVQ),\t\t// DIVQ =  4\n\t\t.FILTER_RANGE(FILTER_RANGE)\t// FILTER_RANGE = 1\n\t) uut (\n\t\t.LOCK(LOCK),\n\t\t.RESETB(RESETB),\n\t\t.BYPASS(BYPASS),\n\t\t.PACKAGEPIN(PACKAGEPIN),\n\t\t.PLLOUTCORE(PLLOUTCORE),\n\t\t.PLLOUTGLOBAL(PLLOUTGLOBAL)\n\t\t);",
                "params": [
                  {
                    "name": "DIVR"
                  },
                  {
                    "name": "DIVF"
                  },
                  {
                    "name": "DIVQ"
                  },
                  {
                    "name": "FILTER_RANGE"
                  },
                  {
                    "name": "FEEDBACK_PATH"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "PACKAGEPIN"
                    },
                    {
                      "name": "RESETB"
                    },
                    {
                      "name": "BYPASS"
                    }
                  ],
                  "out": [
                    {
                      "name": "PLLOUTGLOBAL"
                    },
                    {
                      "name": "PLLOUTCORE"
                    },
                    {
                      "name": "LOCK"
                    }
                  ]
                }
              },
              "position": {
                "x": -264,
                "y": 64
              },
              "size": {
                "width": 480,
                "height": 256
              }
            },
            {
              "id": "05875db9-4909-4232-8d14-729d8e0a4dca",
              "type": "basic.info",
              "data": {
                "info": "SB_PLL40_PAD",
                "readonly": false
              },
              "position": {
                "x": -480,
                "y": -80
              },
              "size": {
                "width": 136,
                "height": 32
              }
            },
            {
              "id": "25e58886-93ea-4c98-8d2f-1b5b225d9cef",
              "type": "basic.info",
              "data": {
                "info": "To obtain parameter values:\nicepll -i 12 -o FREQ",
                "readonly": false
              },
              "position": {
                "x": -152,
                "y": -152
              },
              "size": {
                "width": 256,
                "height": 56
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "2fd92240-60a4-44c9-be80-6766ca83f848",
                "port": "constant-out"
              },
              "target": {
                "block": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
                "port": "DIVR"
              }
            },
            {
              "source": {
                "block": "3f49b9df-fcf4-4280-b5c6-debfc6bc2bc8",
                "port": "constant-out"
              },
              "target": {
                "block": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
                "port": "DIVF"
              }
            },
            {
              "source": {
                "block": "98ad1141-8aab-4a8a-aafa-05e9e26f5c88",
                "port": "constant-out"
              },
              "target": {
                "block": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
                "port": "DIVQ"
              }
            },
            {
              "source": {
                "block": "90399137-a8c3-4ed5-840d-ca4d8761e77b",
                "port": "constant-out"
              },
              "target": {
                "block": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
                "port": "FILTER_RANGE"
              }
            },
            {
              "source": {
                "block": "142bff3b-0e8d-4c90-be57-fd0cf90a83d0",
                "port": "constant-out"
              },
              "target": {
                "block": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
                "port": "FEEDBACK_PATH"
              }
            },
            {
              "source": {
                "block": "407b3bd7-435e-4bcc-b8c7-9d092172946a",
                "port": "19c8f68d-5022-487f-9ab0-f0a3cd58bead"
              },
              "target": {
                "block": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
                "port": "RESETB"
              }
            },
            {
              "source": {
                "block": "83bc8e5a-1f84-4f17-8d2a-b8ad2b1776d5",
                "port": "19c8f68d-5022-487f-9ab0-f0a3cd58bead"
              },
              "target": {
                "block": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
                "port": "BYPASS"
              }
            },
            {
              "source": {
                "block": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
                "port": "PLLOUTGLOBAL"
              },
              "target": {
                "block": "c1d27914-585a-465d-bcb5-058c17f59330",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
                "port": "PLLOUTCORE"
              },
              "target": {
                "block": "32350a04-5ae1-4e2f-bbdd-e9de1e56c5f0",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
                "port": "LOCK"
              },
              "target": {
                "block": "7903eca8-9973-4d6d-84f4-bf36c937357f",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "2574504e-cb31-48e0-927c-a5a9d25a32ee",
                "port": "out"
              },
              "target": {
                "block": "464bc963-93ef-4a0c-9c14-c2fad71a8a0c",
                "port": "PACKAGEPIN"
              }
            }
          ]
        }
      }
    },
    "c83dcd1d9ab420d911df81b3dfae04681559c623": {
      "package": {
        "name": "Bit 1",
        "version": "1.0.0",
        "description": "Assign 1 to the output wire",
        "author": "Jesús Arroyo",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%2247.303%22%20height=%2227.648%22%20viewBox=%220%200%2044.346456%2025.919999%22%3E%3Ctext%20style=%22line-height:125%25%22%20x=%22325.218%22%20y=%22315.455%22%20font-weight=%22400%22%20font-size=%2212.669%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22translate(-307.01%20-298.51)%22%3E%3Ctspan%20x=%22325.218%22%20y=%22315.455%22%20style=%22-inkscape-font-specification:'Courier%2010%20Pitch'%22%20font-family=%22Courier%2010%20Pitch%22%3E1%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "19c8f68d-5022-487f-9ab0-f0a3cd58bead",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 608,
                "y": 192
              }
            },
            {
              "id": "b959fb96-ac67-4aea-90b3-ed35a4c17bf5",
              "type": "basic.code",
              "data": {
                "code": "// Bit 1\n\nassign v = 1'b1;",
                "params": [],
                "ports": {
                  "in": [],
                  "out": [
                    {
                      "name": "v"
                    }
                  ]
                }
              },
              "position": {
                "x": 96,
                "y": 96
              },
              "size": {
                "width": 384,
                "height": 256
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "b959fb96-ac67-4aea-90b3-ed35a4c17bf5",
                "port": "v"
              },
              "target": {
                "block": "19c8f68d-5022-487f-9ab0-f0a3cd58bead",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "c4dd08263a85a91ba53e2ae2b38de344c5efcb52": {
      "package": {
        "name": "Bit 0",
        "version": "1.0.0",
        "description": "Assign 0 to the output wire",
        "author": "Jesús Arroyo",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%2247.303%22%20height=%2227.648%22%20viewBox=%220%200%2044.346456%2025.919999%22%3E%3Ctext%20style=%22line-height:125%25%22%20x=%22325.37%22%20y=%22315.373%22%20font-weight=%22400%22%20font-size=%2212.669%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22translate(-307.01%20-298.51)%22%3E%3Ctspan%20x=%22325.37%22%20y=%22315.373%22%20style=%22-inkscape-font-specification:'Courier%2010%20Pitch'%22%20font-family=%22Courier%2010%20Pitch%22%3E0%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "19c8f68d-5022-487f-9ab0-f0a3cd58bead",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 608,
                "y": 192
              }
            },
            {
              "id": "b959fb96-ac67-4aea-90b3-ed35a4c17bf5",
              "type": "basic.code",
              "data": {
                "code": "// Bit 0\n\nassign v = 1'b0;",
                "params": [],
                "ports": {
                  "in": [],
                  "out": [
                    {
                      "name": "v"
                    }
                  ]
                }
              },
              "position": {
                "x": 96,
                "y": 96
              },
              "size": {
                "width": 384,
                "height": 256
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "b959fb96-ac67-4aea-90b3-ed35a4c17bf5",
                "port": "v"
              },
              "target": {
                "block": "19c8f68d-5022-487f-9ab0-f0a3cd58bead",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "80ac841b78ab68b7668296f4d0b0b4daadc7bcf9": {
      "package": {
        "name": "Bus2-Join-all",
        "version": "0.1",
        "description": "Bus2-Join-all: Joint two wires into a 2-bits Bus",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22354.768%22%20height=%22241.058%22%20viewBox=%220%200%20332.59497%20225.99201%22%3E%3Cpath%20d=%22M164.218%2077.643L103.07%2016.705C92.386%206.25%2078.036.461%2063.11.5H.5v26.186l61.698.046c8.012-.043%2015.705%203.133%2021.47%208.81l61.448%2061.315a57.292%2057.292%200%200%200%2039.993%2016.139%2057.292%2057.292%200%200%200-39.993%2016.14L83.668%20190.45c-5.765%205.677-13.458%208.853-21.47%208.81L.5%20199.306v26.186h62.612c14.924.039%2029.463-5.9%2040.204-16.28l60.902-60.863a29.857%2029.857%200%200%201%2021.347-8.81l146.53-.113V86.457H185.571a29.884%2029.884%200%200%201-21.353-8.814z%22%20fill=%22green%22%20stroke=%22#000%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "969e11ca-69e8-403b-a566-7bf2fbe3a5a8",
              "type": "basic.input",
              "data": {
                "name": "1",
                "clock": false
              },
              "position": {
                "x": 112,
                "y": 144
              }
            },
            {
              "id": "99661aef-c9bf-473e-93c4-8f5edf511d36",
              "type": "basic.output",
              "data": {
                "name": "",
                "range": "[1:0]",
                "size": 2
              },
              "position": {
                "x": 584,
                "y": 200
              }
            },
            {
              "id": "e4111201-8441-4e7d-bcd2-bcf9d265d043",
              "type": "basic.input",
              "data": {
                "name": "0",
                "clock": false
              },
              "position": {
                "x": 112,
                "y": 256
              }
            },
            {
              "id": "16e78204-213e-4833-9096-89d735307ec2",
              "type": "basic.code",
              "data": {
                "code": "assign o = {i1, i0};\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "i1"
                    },
                    {
                      "name": "i0"
                    }
                  ],
                  "out": [
                    {
                      "name": "o",
                      "range": "[1:0]",
                      "size": 2
                    }
                  ]
                }
              },
              "position": {
                "x": 296,
                "y": 176
              },
              "size": {
                "width": 224,
                "height": 112
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "969e11ca-69e8-403b-a566-7bf2fbe3a5a8",
                "port": "out"
              },
              "target": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "i1"
              }
            },
            {
              "source": {
                "block": "e4111201-8441-4e7d-bcd2-bcf9d265d043",
                "port": "out"
              },
              "target": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "i0"
              }
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o"
              },
              "target": {
                "block": "99661aef-c9bf-473e-93c4-8f5edf511d36",
                "port": "in"
              },
              "size": 2
            }
          ]
        }
      }
    },
    "febcfed8636b8ee9a98750b96ed9e53a165dd4a8": {
      "package": {
        "name": "bit-1",
        "version": "0.2",
        "description": "Constant bit 1",
        "author": "Jesus Arroyo",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%2289.79%22%20height=%22185.093%22%20viewBox=%220%200%2084.179064%20173.52585%22%3E%3Cpath%20d=%22M7.702%2032.42L49.972%200l34.207%207.725-27.333%20116.736-26.607-6.01L51.26%2025.273%2020.023%2044.2z%22%20fill=%22green%22%20fill-rule=%22evenodd%22/%3E%3Cpath%20d=%22M46.13%20117.28l21.355%2028.258-17.91%2021.368%206.198%205.513m-14.033-54.45l-12.4%2028.26-28.242%205.512%202.067%208.959%22%20fill=%22none%22%20stroke=%22green%22%20stroke-width=%222.196%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "3d584b0a-29eb-47af-8c43-c0822282ef05",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 456,
                "y": 120
              }
            },
            {
              "id": "61331ec5-2c56-4cdd-b607-e63b1502fa65",
              "type": "basic.code",
              "data": {
                "code": "//-- Constant bit-1\nassign q = 1'b1;\n\n",
                "params": [],
                "ports": {
                  "in": [],
                  "out": [
                    {
                      "name": "q"
                    }
                  ]
                }
              },
              "position": {
                "x": 168,
                "y": 112
              },
              "size": {
                "width": 248,
                "height": 80
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "61331ec5-2c56-4cdd-b607-e63b1502fa65",
                "port": "q"
              },
              "target": {
                "block": "3d584b0a-29eb-47af-8c43-c0822282ef05",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "ea7a9febdda190d38f531ff33c9624741a805384": {
      "package": {
        "name": "ADC_ADS7924_Arias",
        "version": "0.1",
        "description": "This module is a block that reads the 4 ADC inputs of the ADS7924 and presents the results as plain four 12-bit values.",
        "author": "Jesús Arias",
        "image": "%3Csvg%20id=%22Ebene_1%22%20width=%22273.761%22%20height=%22600%22%20viewBox=%220%200%20276.49916%20606.0012%22%20xmlns=%22http://www.w3.org/2000/svg%22%3E%3Cdefs%20id=%22defs25%22%3E%3Cmarker%20id=%22TriangleOutM%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M2.308%200l-3.46%202v-4z%22%20id=%22path972%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20id=%22Arrow1Mend%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-4%200l-2%202%207-2-7-2z%22%20id=%22path836%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20id=%22Arrow2Mend%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20id=%22path854%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20id=%22Arrow2Mend-3%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20id=%22path854-6%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20id=%22Arrow1Mend-5%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-4%200l-2%202%207-2-7-2z%22%20id=%22path836-3%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22TriangleOutM-7%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path972-5%22%20d=%22M2.308%200l-3.46%202v-4z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22Arrow1Mend-3%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path836-5%22%20d=%22M-4%200l-2%202%207-2-7-2z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22Arrow2Mend-6%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path854-2%22%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22Arrow2Mend-3-9%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path854-6-1%22%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22Arrow1Mend-5-2%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path836-3-7%22%20d=%22M-4%200l-2%202%207-2-7-2z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cdefs%20id=%22defs3%22%3E%3Cpath%20id=%22a%22%20d=%22M-58.3-45h653.6v640H-58.3z%22/%3E%3C/defs%3E%3Cpath%20id=%22path880%22%20d=%22M-58.3-45h653.6v640H-58.3z%22/%3E%3Cmarker%20id=%22TriangleInM%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-2.308%200l3.46-2v4z%22%20id=%22path4321%22%20fill=%22#00f%22%20fill-rule=%22evenodd%22%20stroke=%22#00f%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20id=%22EmptyTriangleInM%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-.508%200l3.46-2v4z%22%20id=%22path4339%22%20fill=%22#fff%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20id=%22TriangleOutM-3%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M2.308%200l-3.46%202v-4z%22%20id=%22path4297%22%20fill=%22#00f%22%20fill-rule=%22evenodd%22%20stroke=%22#00f%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20id=%22marker4456%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20id=%22path4458%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20id=%22marker4428%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20id=%22path4430%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20id=%22Arrow2Mend-67%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20id=%22path4179%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cpath%20id=%22path919%22%20d=%22M-58.3-45h653.6v640H-58.3z%22/%3E%3Cpath%20id=%22path998%22%20d=%22M-58.3-45h653.6v640H-58.3z%22/%3E%3Cmarker%20orient=%22auto%22%20id=%22TriangleOutM-4%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path972-7%22%20d=%22M2.308%200l-3.46%202v-4z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22Arrow1Mend-2%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path836-4%22%20d=%22M-4%200l-2%202%207-2-7-2z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22Arrow2Mend-0%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path854-62%22%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22Arrow2Mend-3-99%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path854-6-0%22%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22Arrow1Mend-5-8%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path836-3-1%22%20d=%22M-4%200l-2%202%207-2-7-2z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20id=%22TriangleOutM-7-3%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M2.308%200l-3.46%202v-4z%22%20id=%22path972-5-1%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20id=%22Arrow1Mend-3-1%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-4%200l-2%202%207-2-7-2z%22%20id=%22path836-5-0%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20id=%22Arrow2Mend-6-3%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20id=%22path854-2-4%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20id=%22Arrow2Mend-3-9-0%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20id=%22path854-6-1-3%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20id=%22Arrow1Mend-5-2-9%22%20orient=%22auto%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M-4%200l-2%202%207-2-7-2z%22%20id=%22path836-3-7-1%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cdefs%20id=%22defs3-9%22%3E%3Cpath%20d=%22M-58.3-45h653.6v640H-58.3z%22%20id=%22a-6%22/%3E%3C/defs%3E%3Cpath%20d=%22M-58.3-45h653.6v640H-58.3z%22%20id=%22path880-9%22/%3E%3Cmarker%20orient=%22auto%22%20id=%22TriangleInM-3%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path4321-3%22%20d=%22M-2.308%200l3.46-2v4z%22%20fill=%22#00f%22%20fill-rule=%22evenodd%22%20stroke=%22#00f%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22EmptyTriangleInM-8%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path4339-0%22%20d=%22M-.508%200l3.46-2v4z%22%20fill=%22#fff%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22TriangleOutM-3-5%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path4297-6%22%20d=%22M2.308%200l-3.46%202v-4z%22%20fill=%22#00f%22%20fill-rule=%22evenodd%22%20stroke=%22#00f%22%20stroke-width=%22.533%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22marker4456-6%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path4458-4%22%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22marker4428-0%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path4430-0%22%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cmarker%20orient=%22auto%22%20id=%22Arrow2Mend-67-4%22%20overflow=%22visible%22%3E%3Cpath%20id=%22path4179-6%22%20d=%22M-5.231-2.42L1.324-.01-5.23%202.401c1.047-1.423%201.041-3.37%200-4.821z%22%20fill-rule=%22evenodd%22%20stroke=%22#000%22%20stroke-width=%22.375%22%20stroke-linejoin=%22round%22/%3E%3C/marker%3E%3Cpath%20d=%22M-58.3-45h653.6v640H-58.3z%22%20id=%22path1228%22/%3E%3C/defs%3E%3Ctitle%20id=%22title2%22%3EAnalogsignal%3C/title%3E%3Cg%20id=%22g992-3%22%20transform=%22translate(-209.973%20377.97)%20scale(2.49948)%22%20stroke-width=%221.526%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20id=%22path992-2-6%22%20fill=%22#ececec%22%20stroke-width=%22.929%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20id=%22path1773-2-3-1-8-9-7%22%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%222.322%22/%3E%3C/g%3E%3Cpath%20id=%22path10%22%20d=%22M11.882%20245.415c6.71-21.136%2013.607-42.182%2020.313-36.168%206.898%206.012%2011.93%2069.33%2020.505%2072.337%208.387%203.007%2021.996-52.262%2030.57-54.297%208.388-1.944%2011.928%2045.19%2020.314%2042.182%208.576-3.006%2022.182-62.256%2030.567-60.222%208.575%202.033%2011.93%2071.277%2020.505%2072.337%208.39.974%2020.317-65.262%2030.57-66.324%2010.066-.973%2020.314%2057.218%2030.567%2060.224%2010.252%203.094%2023.856-38.116%2030.566-42.094%206.712-4.068%206.712%2015.033%2010.254%2018.039%203.355%203.008%206.71%201.504%2010.066%200%22%20stroke-miterlimit=%2210%22%20fill=%22none%22%20stroke=%22#00f%22%20stroke-width=%226.281%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cstyle%20id=%22style2%22%3E.st0%7Bdisplay:none%7D.st1%7Bfill:none;stroke:#303030;stroke-width:.7;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10%7D.st2%7Bfill:#303030%7D%3C/style%3E%3Cg%20id=%22g992-3-2%22%20transform=%22translate(-12.35%20217.065)%20scale(2.49948)%22%20stroke-width=%221.526%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20id=%22path992-2-6-67%22%20fill=%22#ececec%22%20stroke-width=%22.929%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20id=%22path1773-2-3-1-8-9-7-5%22%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%222.322%22/%3E%3C/g%3E%3Ctext%20style=%22line-height:1.25;-inkscape-font-specification:'Arial%20Bold';text-align:center%22%20x=%22126.572%22%20y=%22169.142%22%20id=%22text849-6%22%20font-weight=%22700%22%20font-size=%22105.166%22%20font-family=%22Arial%22%20letter-spacing=%220%22%20word-spacing=%220%22%20text-anchor=%22middle%22%20stroke-width=%223.669%22%20stroke-linecap=%22round%22%20transform=%22scale(1.10901%20.9017)%22%20fill=%22red%22%3E%3Ctspan%20id=%22tspan847-9%22%20x=%22126.572%22%20y=%22169.142%22%20style=%22-inkscape-font-specification:'Arial%20Bold'%22%20stroke-width=%222.049%22%3EADC%3C/tspan%3E%3C/text%3E%3Ctext%20style=%22line-height:1.25;-inkscape-font-specification:'Arial%20Bold';text-align:center%22%20x=%22105.765%22%20y=%22394.825%22%20id=%22text849-6-1%22%20font-weight=%22700%22%20font-size=%2272.171%22%20font-family=%22Arial%22%20letter-spacing=%220%22%20word-spacing=%220%22%20text-anchor=%22middle%22%20stroke-width=%222.518%22%20stroke-linecap=%22round%22%20transform=%22scale(.9446%201.05865)%22%20fill=%22#ff00e4%22%3E%3Ctspan%20id=%22tspan847-9-2%22%20x=%22105.765%22%20y=%22394.825%22%20style=%22-inkscape-font-specification:'Arial%20Bold'%22%20stroke-width=%221.406%22%3E12bits%3C/tspan%3E%3C/text%3E%3Ctext%20style=%22line-height:1.25;-inkscape-font-specification:'Arial%20Bold';text-align:center%22%20x=%22165.885%22%20y=%22425.115%22%20id=%22text849-6-1-9%22%20font-weight=%22700%22%20font-size=%2264.151%22%20font-family=%22Arial%22%20letter-spacing=%220%22%20word-spacing=%220%22%20text-anchor=%22middle%22%20stroke-width=%222.238%22%20stroke-linecap=%22round%22%20transform=%22scale(.83963%201.191)%22%20fill=%22#b200ff%22%3E%3Ctspan%20id=%22tspan847-9-2-9%22%20x=%22165.885%22%20y=%22425.115%22%20style=%22-inkscape-font-specification:'Arial%20Bold'%22%20stroke-width=%221.25%22%3E4Channels%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "269c8e75-797e-4f7b-80f2-4befbe074163",
              "type": "basic.output",
              "data": {
                "name": "an3",
                "range": "[11:0]",
                "size": 12
              },
              "position": {
                "x": 1808,
                "y": 280
              }
            },
            {
              "id": "25dc1567-a6cf-4afc-be1f-6fe455dd8ac8",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": 536,
                "y": 328
              }
            },
            {
              "id": "c1354b12-07e0-4ce4-9ec5-a4e91dee3a15",
              "type": "basic.output",
              "data": {
                "name": "an2",
                "range": "[11:0]",
                "size": 12
              },
              "position": {
                "x": 1808,
                "y": 352
              }
            },
            {
              "id": "84cd3706-f46a-447a-8a52-ed0458fe9856",
              "type": "basic.output",
              "data": {
                "name": "an1",
                "range": "[11:0]",
                "size": 12
              },
              "position": {
                "x": 1808,
                "y": 424
              }
            },
            {
              "id": "0b783276-8c26-4986-b520-a65d9baab8eb",
              "type": "basic.input",
              "data": {
                "name": "rst",
                "clock": false
              },
              "position": {
                "x": 536,
                "y": 496
              }
            },
            {
              "id": "0f105e61-2a1c-48bf-b3d8-1522bf6f9b27",
              "type": "basic.output",
              "data": {
                "name": "an0",
                "range": "[11:0]",
                "size": 12
              },
              "position": {
                "x": 1808,
                "y": 496
              }
            },
            {
              "id": "c83c6672-7d45-46ec-8303-c92d804f62f9",
              "type": "basic.output",
              "data": {
                "name": "done"
              },
              "position": {
                "x": 1808,
                "y": 560
              }
            },
            {
              "id": "3e36071d-ca4a-4b1c-a867-6f5dc933f1de",
              "type": "basic.output",
              "data": {
                "name": "sda",
                "inout": true
              },
              "position": {
                "x": 1808,
                "y": 632
              }
            },
            {
              "id": "7cea6d3b-d266-41a5-90da-ccf4919a5af1",
              "type": "basic.input",
              "data": {
                "name": "int",
                "clock": false
              },
              "position": {
                "x": 536,
                "y": 656
              }
            },
            {
              "id": "086227c3-aa9d-4b22-b817-4171cef9ddf1",
              "type": "basic.output",
              "data": {
                "name": "scl",
                "inout": true
              },
              "position": {
                "x": 1808,
                "y": 704
              }
            },
            {
              "id": "d61afcc3-679d-4c6a-bf85-0f606fbe3557",
              "type": "basic.constant",
              "data": {
                "name": "FCLK",
                "value": "12000000",
                "local": false
              },
              "position": {
                "x": 896,
                "y": 144
              }
            },
            {
              "id": "6fc383b5-da59-42b6-9634-f4538a0b1717",
              "type": "basic.constant",
              "data": {
                "name": "FSCL",
                "value": "400000",
                "local": false
              },
              "position": {
                "x": 1304,
                "y": 144
              }
            },
            {
              "id": "2d8fdad3-2343-4793-9e84-7738e82c2e28",
              "type": "basic.info",
              "data": {
                "info": "**FPGA board frequency**",
                "readonly": true
              },
              "position": {
                "x": 872,
                "y": 112
              },
              "size": {
                "width": 144,
                "height": 32
              }
            },
            {
              "id": "53de9d94-ab27-45f9-abde-16ce9a6ceea2",
              "type": "basic.info",
              "data": {
                "info": "**I2C frequency**",
                "readonly": true
              },
              "position": {
                "x": 1304,
                "y": 112
              },
              "size": {
                "width": 88,
                "height": 32
              }
            },
            {
              "id": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "reset"
                    },
                    {
                      "name": "int"
                    }
                  ],
                  "out": [
                    {
                      "name": "ana3",
                      "range": "[11:0]",
                      "size": 12
                    },
                    {
                      "name": "ana2",
                      "range": "[11:0]",
                      "size": 12
                    },
                    {
                      "name": "ana1",
                      "range": "[11:0]",
                      "size": 12
                    },
                    {
                      "name": "ana0",
                      "range": "[11:0]",
                      "size": 12
                    },
                    {
                      "name": "sampletick"
                    }
                  ],
                  "inoutRight": [
                    {
                      "name": "sda"
                    },
                    {
                      "name": "scl"
                    }
                  ]
                },
                "params": [
                  {
                    "name": "FCLK"
                  },
                  {
                    "name": "FSCL"
                  }
                ],
                "code": "////////////////////////////////////////////////////////////////////\r\n//                ADS7924 reader (via I2C bus)\r\n// J. Arias (2024) Public domain sources\r\n//\r\n// This module is a block that reads the 4 ADC inputs of the ADS7924\r\n// and presents the results as plain four 12-bit values.\r\n// -First, it configure the ADC with \"Auto-Burst Scan with Sleep\" mode,\r\n//  with minimun sleep time (2.5ms / 4 = 625us), and 14us adquisition\r\n//  time (max source resistance: 100 kohm)\r\n// -Then it waits for BUSY pulses on the INT input, reads the 4 channel\r\n//  values, and keeps doing this again and again.\r\n// -A sample clock output is provided. This signal is low while the data\r\n//  is being updated. Output updates are atomic (the whole 12 bits of\r\n//  the outputs are written in parallel)\r\n//\r\n// I2C Details:\r\n// - ACK bits are ignored (there is nothing we can do if they fail, anyways)\r\n// - No clock stretching is allowed (this isn't a problem for the ADS7924)\r\n//\r\n// Performance:\r\n// - 1430 (+-20%) Samples/s. The sampling rate depends on an inaccurate \r\n//   internal clock.\r\n// - 124 Logic cells.\r\n//\r\n// More info = https://groups.google.com/g/fpga-wars-explorando-el-lado-libre/c/9gcu-SFjloA\r\n\r\n// Clock dividers clk2 = 2*clkbit, almost square\r\nlocalparam DIVIDER = (FCLK/2)/FSCL;\r\nlocalparam NDIV = $clog2(DIVIDER);\r\n\r\nreg [NDIV-1:0]pres=0;\r\nalways @(posedge clk) pres<= (pres==DIVIDER-1) ? 0 : pres+1;\r\nreg clk2=0;\r\nalways @(posedge clk) clk2<=(pres<=(DIVIDER/2));\r\n\r\nreg clkbit=0;\t// bit clock, active rising\r\nalways @(posedge clk2) clkbit<=~clkbit;\r\n\r\n// SCL & SDA\r\nreg sclo1; // temp SCL output, 1/4 Tbit delay\r\nalways @(negedge clk2) sclo1<=idle | (start&clkbit) | (stop&(~clkbit)) | clkbit;\r\nreg sclo;  // SCL output resampled (delayed 1 clk for equalization with respect SDA)\r\nalways @(posedge clk) sclo<=sclo1;\r\nreg sdao;  // registered SDA output to avoid glitches\r\nalways @(posedge clk) sdao <= idle | (start&clkbit) | (stop&(~clkbit)) | (datast&sh[8]) ;\r\n\r\n// Open-drain pins: SCL, SDA\r\nassign scl = sclo ? 1'bz : 1'b0;\r\nassign sda = sdao ? 1'bz : 1'b0;\r\n\r\n// bit counter (9 cycles: data + ACK)\r\nreg [3:0]bcnt=0;\r\nwire nxtinstr = (~datast)|bcnt[3];\t// next instruction: after 9 cycles if in data state\r\nalways @(posedge clkbit) bcnt<= nxtinstr ? 0 : bcnt+1;\r\n\r\n// Shift register (sda input and output)\r\nreg ssda;\t// sampled SDA (SCL falling)\r\nalways @(negedge scl) ssda<=sda;\r\n\r\nreg [8:0]sh; // 9-bit shift register\r\nalways @(posedge clkbit) sh<= nxtinstr ? {ucode[7:0],ack} : {sh[7:0],ssda};\r\n\r\n/////////////////// SEQUENCER //////////////////////\r\n/// START / STOP / IDLE / DATA\r\nlocalparam IDL = 2'b00;\r\nlocalparam STA = 2'b01;\r\nlocalparam STP = 2'b10;\r\nlocalparam DAT = 2'b11;\r\n\r\n// instructions\r\nwire idle  = (ucode[10:9]==IDL);\r\nwire start = (ucode[10:9]==STA);\r\nwire stop  = (ucode[10:9]==STP);\r\nwire datast= (ucode[10:9]==DAT);\r\n\r\nlocalparam ACK = 1'b0;\r\nlocalparam NAK = 1'b1;\r\nwire ack =ucode[8];\t\t// ACK bit to send\r\n\r\nwire goto=ucode[11];\t// Goto to address 0\r\nwire wr0 =ucode[12];\t// write channels #0 to #3\r\nwire wr1 =ucode[13];\r\nwire wr2 =ucode[14];\r\nwire wr3 =ucode[15];\r\n\r\n// address counter\r\nlocalparam ADDRST=16; \t// reset address\r\nreg [4:0]uaddr = ADDRST;// address counter\r\n\r\nalways @(posedge clkbit or posedge reset)\r\n\tif (reset) uaddr<=ADDRST;\r\n\t// GOTO and IDLE with no data_av jumps to address 0\r\n\telse uaddr<= (goto | (idle & (~data_av)))? 0 : uaddr + nxtinstr;\r\n\t// GOTO jumps to address 0. IDLE blocks until data_av\r\n\t//else uaddr<= goto ? 0 : uaddr + (nxtinstr & ((~idle)|data_av));\r\n\r\n// microcode ROM (asynchronous)\r\n//  includes control signals (write, goto) for current instruction, \r\n//  and data to be loaded into the shift register for next instruction\r\nreg [15:0]ucode;\t// not register, combinational\r\nalways @*\r\n\tcase(uaddr)\r\n\t// Operation loop\r\n\t//              wr3-0  goto inst ack  data\r\n\t5'd0 : ucode<={4'b0000,1'b0, IDL,1'bx,8'hxx};\t// wait for INT edge\r\n\t5'd1 : ucode<={4'b0000,1'b0, STA, NAK,8'h90};\t// START, Slave address, write\r\n\t5'd2 : ucode<={4'b0000,1'b0, DAT, NAK,8'h82};\t// reg #2, increment address\r\n\t5'd3 : ucode<={4'b0000,1'b0, DAT,1'bx,8'hXX};\t// send last byte\r\n\t5'd4 : ucode<={4'b0000,1'b0, STP,1'bx,8'hXX};\t// STOP\r\n\t\r\n\t5'd5 : ucode<={4'b0000,1'b0, STA, NAK,8'h91};\t// START, Slave address, read\r\n\t5'd6 : ucode<={4'b0000,1'b0, DAT, ACK,8'hFF};\t\r\n\t5'd7 : ucode<={4'b0000,1'b0, DAT, ACK,8'hFF};\t// DATA0_U\r\n\t5'd8 : ucode<={4'b0001,1'b0, DAT, ACK,8'hFF};\t// DATA0_L, write to AN0\r\n\t5'd9 : ucode<={4'b0000,1'b0, DAT, ACK,8'hFF};\t// DATA1_U\r\n\t5'd10: ucode<={4'b0010,1'b0, DAT, ACK,8'hFF};\t// DATA1_L, write to AN1\r\n\t5'd11: ucode<={4'b0000,1'b0, DAT, ACK,8'hFF};\t// DATA2_U\r\n\t5'd12: ucode<={4'b0100,1'b0, DAT, ACK,8'hFF};\t// DATA2_L, write to AN2\r\n\t5'd13: ucode<={4'b0000,1'b0, DAT, NAK,8'hFF};\t// DATA3_U\r\n\t5'd14: ucode<={4'b1000,1'b0, DAT,1'bx,8'hXX};\t// DATA3_L, write to AN3\r\n\t5'd15: ucode<={4'b0000,1'b1, STP,1'bx,8'hXX};\t// STOP, GOTO 0\r\n\t\r\n\t// Init: configuring ADC registers\r\n\t5'd16: ucode<={4'b0000,1'b0, STA, NAK,8'h90};\t// START, Slave address, write\r\n\t5'd17: ucode<={4'b0000,1'b0, DAT, NAK,8'h80};\t// reg #0, increment address\r\n\t5'd18: ucode<={4'b0000,1'b0, DAT, NAK,8'hFC};\t// Auto-Burst Scan with Sleep mode, ch #0\r\n\t5'd19: ucode<={4'b0000,1'b0, DAT,1'bx,8'hXX};\t// send last byte\r\n\t5'd20: ucode<={4'b0000,1'b0, STP,1'bx,8'hXX};\t// STOP\r\n\t\r\n\t5'd21: ucode<={4'b0000,1'b0, STA, NAK,8'h90};\t// START, Slave address, write\r\n\t5'd22: ucode<={4'b0000,1'b0, DAT, NAK,8'h92};\t// reg #0x12, increment address \r\n\t5'd23: ucode<={4'b0000,1'b0, DAT, NAK,8'h04};\t// INTCFG: INT=BUSY, active low\r\n\t5'd24: ucode<={4'b0000,1'b0, DAT, NAK,8'h20};\t// SLPCFG: Sleep: 2.5ms/4\r\n\t5'd25: ucode<={4'b0000,1'b0, DAT, NAK,8'h04};\t// ACQCFG: 4*2+6 = 14us\r\n\t5'd26: ucode<={4'b0000,1'b0, DAT,1'bx,8'hXX};\t// send last byte\r\n\t5'd27: ucode<={4'b0000,1'b1, STP,1'bx,8'hXX};\t// STOP, GOTO 0\r\n\r\n\tdefault: ucode<=16'hxxxx;\r\n\tendcase\r\n\t\r\n// Output registers\r\n// notice the ACK bit hasn't been yet shifted in when 'nxtinstr' is asserted\r\nreg [7:0]olddat;\t// previous byte\r\nalways @(posedge clkbit) if (nxtinstr) olddat<=sh[7:0];\r\nreg [11:0]an0;\r\nreg [11:0]an1;\r\nreg [11:0]an2;\r\nreg [11:0]an3;\r\nalways @(posedge clkbit) begin\r\n\tif (nxtinstr & wr0) an0<={olddat,sh[7:4]};\r\n\tif (nxtinstr & wr1) an1<={olddat,sh[7:4]};\r\n\tif (nxtinstr & wr2) an2<={olddat,sh[7:4]};\r\n\tif (nxtinstr & wr3) an3<={olddat,sh[7:4]};\r\nend\r\n\r\n// INT trigger\r\n// (Datasheet errata? There are 4 busy pulses, one per channel, when the datasheet\r\n// shows only one pulse on fig. 28 \"Auto-Burst Scan With Sleep Operation Example\".\r\n// Anyway, a workaround is implemented)\r\nreg [3:0]tim;\t// Monostable timer (4 busy pulses -> single pulse)\r\nalways @(posedge clkbit) tim <= int ? tim+(tim!=15) : 0;\r\n\r\nwire data_av =(tim==14); // Data Available for read\r\n\r\n// Sample Clock\r\nreg sampleck=0;\r\nalways @(posedge clkbit) sampleck<= data_av ? 1'b0 :(goto ? 1'b1 : sampleck);\r\n\r\nassign sampletick = sampleck;\r\nassign ana0 = an0;\r\nassign ana1 = an1;\r\nassign ana2 = an2;\r\nassign ana3 = an3;\r\n"
              },
              "position": {
                "x": 736,
                "y": 280
              },
              "size": {
                "width": 824,
                "height": 488
              }
            },
            {
              "id": "07ec4ee7-1fc7-41a7-b9ad-9aa1e69559c2",
              "type": "basic.info",
              "data": {
                "info": "Connects to the physical INT pin of the ADC",
                "readonly": true
              },
              "position": {
                "x": 536,
                "y": 608
              },
              "size": {
                "width": 160,
                "height": 32
              }
            },
            {
              "id": "186b9334-a44e-4113-8544-877317cedbe5",
              "type": "basic.info",
              "data": {
                "info": "Connects to the physical SDA pin of the ADC",
                "readonly": true
              },
              "position": {
                "x": 1928,
                "y": 640
              },
              "size": {
                "width": 152,
                "height": 32
              }
            },
            {
              "id": "c5e7e67d-537f-4707-8b80-17540feaefbb",
              "type": "basic.info",
              "data": {
                "info": "Connects to the physical SCL pin of the ADC",
                "readonly": true
              },
              "position": {
                "x": 1928,
                "y": 712
              },
              "size": {
                "width": 152,
                "height": 32
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "6fc383b5-da59-42b6-9634-f4538a0b1717",
                "port": "constant-out"
              },
              "target": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "FSCL"
              }
            },
            {
              "source": {
                "block": "d61afcc3-679d-4c6a-bf85-0f606fbe3557",
                "port": "constant-out"
              },
              "target": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "FCLK"
              }
            },
            {
              "source": {
                "block": "0b783276-8c26-4986-b520-a65d9baab8eb",
                "port": "out"
              },
              "target": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "reset"
              }
            },
            {
              "source": {
                "block": "7cea6d3b-d266-41a5-90da-ccf4919a5af1",
                "port": "out"
              },
              "target": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "int"
              }
            },
            {
              "source": {
                "block": "25dc1567-a6cf-4afc-be1f-6fe455dd8ac8",
                "port": "out"
              },
              "target": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "sda"
              },
              "target": {
                "block": "3e36071d-ca4a-4b1c-a867-6f5dc933f1de",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "scl"
              },
              "target": {
                "block": "086227c3-aa9d-4b22-b817-4171cef9ddf1",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "sampletick"
              },
              "target": {
                "block": "c83c6672-7d45-46ec-8303-c92d804f62f9",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "ana0"
              },
              "target": {
                "block": "0f105e61-2a1c-48bf-b3d8-1522bf6f9b27",
                "port": "in"
              },
              "size": 12
            },
            {
              "source": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "ana1"
              },
              "target": {
                "block": "84cd3706-f46a-447a-8a52-ed0458fe9856",
                "port": "in"
              },
              "size": 12
            },
            {
              "source": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "ana2"
              },
              "target": {
                "block": "c1354b12-07e0-4ce4-9ec5-a4e91dee3a15",
                "port": "in"
              },
              "size": 12
            },
            {
              "source": {
                "block": "b1407a44-eedd-40da-ac1f-f7d2346b0dc8",
                "port": "ana3"
              },
              "target": {
                "block": "269c8e75-797e-4f7b-80f2-4befbe074163",
                "port": "in"
              },
              "size": 12
            }
          ]
        }
      }
    },
    "0a6cbed722ec27aad536f9305b8770282dee40cf": {
      "package": {
        "name": "IniTic",
        "version": "0.1",
        "description": "Emite un solo tic al iniciarse la FPGA.",
        "author": "FPGAwars",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22197.514%22%20height=%22161.086%22%20viewBox=%220%200%2052.259014%2042.62059%22%3E%3Ctext%20y=%2210.088%22%20x=%2210.102%22%20style=%22line-height:0%25%22%20font-weight=%22400%22%20font-size=%2215.216%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22scale(.99853%201.00147)%22%20font-family=%22sans-serif%22%20fill=%22#00f%22%20stroke-width=%22.282%22%3E%3Ctspan%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20y=%2210.088%22%20x=%2210.102%22%20font-weight=%22700%22%20font-size=%228.695%22%3EOneTic%3C/tspan%3E%3C/text%3E%3Cg%20transform=%22matrix(1.04946%200%200%20.9502%20-78.834%20-43.462)%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20fill=%22#ececec%22%20stroke-width=%22.608%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%221.521%22/%3E%3C/g%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "a84f120d-9b95-4a69-a021-773b0637c657",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": 1264,
                "y": 384
              }
            },
            {
              "id": "9b5dbdc2-e548-4504-9872-7334f7dda6c0",
              "type": "basic.output",
              "data": {
                "name": "oneTic"
              },
              "position": {
                "x": 2040,
                "y": 424
              }
            },
            {
              "id": "65c85742-9f02-4750-bef5-6383c327f552",
              "type": "basic.constant",
              "data": {
                "name": "delay",
                "value": "500",
                "local": false
              },
              "position": {
                "x": 1856,
                "y": 264
              }
            },
            {
              "id": "d590dacb-0d0b-44f7-b3fa-b11a65c028cd",
              "type": "basic.info",
              "data": {
                "info": "Este circuito emite un solo \"tic\" después de transcurrir\n500ms de iniciarse la FPGA.",
                "readonly": true
              },
              "position": {
                "x": 1384,
                "y": 184
              },
              "size": {
                "width": 480,
                "height": 64
              }
            },
            {
              "id": "257ed65c-915d-4a9a-b75f-c5a56de94747",
              "type": "725b7e2cb9666b5ed3183537d9c898f096dab82a",
              "position": {
                "x": 1264,
                "y": 456
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "2a70acce-d174-496e-85b7-698329af793d",
              "type": "af48ebc63c0bdb7fd04dc2a9583c4ebb2248168f",
              "position": {
                "x": 1448,
                "y": 440
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "bc24451e-e458-4f1a-9f22-122a90f4dec5",
              "type": "8e2728307baccbf26c01cdb87bcfba8ca64a435c",
              "position": {
                "x": 1640,
                "y": 424
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "2148156f-5591-49ea-a528-410b3f73106d",
              "type": "d809c353eaeb491ba520e04fd05d420da237fdb5",
              "position": {
                "x": 1856,
                "y": 408
              },
              "size": {
                "width": 96,
                "height": 64
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "257ed65c-915d-4a9a-b75f-c5a56de94747",
                "port": "3d584b0a-29eb-47af-8c43-c0822282ef05"
              },
              "target": {
                "block": "2a70acce-d174-496e-85b7-698329af793d",
                "port": "3e08d30f-4cc5-4c7b-a1ea-009d5795aaed"
              }
            },
            {
              "source": {
                "block": "a84f120d-9b95-4a69-a021-773b0637c657",
                "port": "out"
              },
              "target": {
                "block": "2a70acce-d174-496e-85b7-698329af793d",
                "port": "3eab6a54-662e-4398-81a1-e4c1d7285191"
              }
            },
            {
              "source": {
                "block": "65c85742-9f02-4750-bef5-6383c327f552",
                "port": "constant-out"
              },
              "target": {
                "block": "2148156f-5591-49ea-a528-410b3f73106d",
                "port": "7ca578e5-8e36-4c04-bbea-144418c8e9af"
              }
            },
            {
              "source": {
                "block": "2a70acce-d174-496e-85b7-698329af793d",
                "port": "73f2857d-3f7f-45c2-92f5-c550285b4e71"
              },
              "target": {
                "block": "bc24451e-e458-4f1a-9f22-122a90f4dec5",
                "port": "b6426b43-dcda-418d-b6d3-4764b5bc0b25"
              }
            },
            {
              "source": {
                "block": "bc24451e-e458-4f1a-9f22-122a90f4dec5",
                "port": "1d2e403f-0fa6-41fd-83a9-4f309eadd855"
              },
              "target": {
                "block": "2148156f-5591-49ea-a528-410b3f73106d",
                "port": "61d11f03-6fbc-4467-a947-d546fa6f6429"
              }
            },
            {
              "source": {
                "block": "2148156f-5591-49ea-a528-410b3f73106d",
                "port": "8c6fda76-1ba0-4ef8-a53d-7bc8a9db4454"
              },
              "target": {
                "block": "9b5dbdc2-e548-4504-9872-7334f7dda6c0",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "a84f120d-9b95-4a69-a021-773b0637c657",
                "port": "out"
              },
              "target": {
                "block": "bc24451e-e458-4f1a-9f22-122a90f4dec5",
                "port": "4196184b-4a60-493b-bcc6-c95958483683"
              }
            },
            {
              "source": {
                "block": "a84f120d-9b95-4a69-a021-773b0637c657",
                "port": "out"
              },
              "target": {
                "block": "2148156f-5591-49ea-a528-410b3f73106d",
                "port": "7697c4d1-f5f8-4a1d-88af-e367fe54e4b6"
              }
            }
          ]
        }
      }
    },
    "725b7e2cb9666b5ed3183537d9c898f096dab82a": {
      "package": {
        "name": "1",
        "version": "0.1",
        "description": "Un bit constante a 1",
        "author": "Jesus Arroyo",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%2233.632%22%20height=%2269.34%22%20viewBox=%220%200%2031.530464%2065.006656%22%3E%3Cpath%20d=%22M3.517%2012.015L19%200l12.53%202.863-10.012%2043.262-9.746-2.227%207.7-34.532L8.03%2016.38z%22%20fill=%22green%22%20fill-rule=%22evenodd%22/%3E%3Cpath%20d=%22M17.593%2043.464l7.822%2010.472-6.56%207.919%202.27%202.043m-5.14-20.179l-4.542%2010.473-10.345%202.043.757%203.32%22%20fill=%22none%22%20stroke=%22green%22%20stroke-width=%222.196%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "3d584b0a-29eb-47af-8c43-c0822282ef05",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 512,
                "y": 160
              }
            },
            {
              "id": "61331ec5-2c56-4cdd-b607-e63b1502fa65",
              "type": "basic.code",
              "data": {
                "code": "//-- Bit constante a 1\nassign q = 1'b1;\n\n",
                "params": [],
                "ports": {
                  "in": [],
                  "out": [
                    {
                      "name": "q"
                    }
                  ]
                }
              },
              "position": {
                "x": 168,
                "y": 112
              },
              "size": {
                "width": 256,
                "height": 160
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "61331ec5-2c56-4cdd-b607-e63b1502fa65",
                "port": "q"
              },
              "target": {
                "block": "3d584b0a-29eb-47af-8c43-c0822282ef05",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "af48ebc63c0bdb7fd04dc2a9583c4ebb2248168f": {
      "package": {
        "name": "DFF ini = 0",
        "version": "1.0",
        "description": "DFF ini = 0",
        "author": "FPGA WARS",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%2263.799%22%20height=%2257.366%22%20viewBox=%220%200%2059.811602%2053.780232%22%3E%3Cg%20transform=%22translate(-310.54%20-373.968)%22%3E%3Cpath%20d=%22M353.401%20407.803l3.157%2019.445%203.914-19.445%22%20fill=%22#ccc%22%20stroke=%22#000%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Ctext%20style=%22line-height:125%25%22%20x=%22310.844%22%20y=%22395.812%22%20font-weight=%22400%22%20font-size=%2227.335%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%3E%3Ctspan%20x=%22310.844%22%20y=%22395.812%22%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20font-weight=%22700%22%3ED%3C/tspan%3E%3C/text%3E%3Ctext%20style=%22line-height:125%25%22%20x=%22316.916%22%20y=%22420.476%22%20font-weight=%22400%22%20font-size=%2220%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#00f%22%3E%3Ctspan%20x=%22316.916%22%20y=%22420.476%22%3E0%3C/tspan%3E%3C/text%3E%3Crect%20width=%2223.595%22%20height=%2221.484%22%20x=%22311.539%22%20y=%22402.712%22%20ry=%223.545%22%20fill=%22none%22%20stroke=%22#00f%22%20stroke-width=%222%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M351.238%20398.03l1.658-19.774h-6.818v-3.788h22.097v3.788h-6.44l1.196%2019.953s5.208.866%206.428%204.494c1.221%203.628-.254%205.053.105%205.104l-25.022-.03s-.566-4.234%201.398-6.377c1.965-2.142%205.398-3.37%205.398-3.37z%22%20fill=%22red%22%20stroke=%22#000%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/g%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "3eab6a54-662e-4398-81a1-e4c1d7285191",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true,
                "virtual": true
              },
              "position": {
                "x": 192,
                "y": 56
              }
            },
            {
              "id": "73f2857d-3f7f-45c2-92f5-c550285b4e71",
              "type": "basic.output",
              "data": {
                "name": "Q"
              },
              "position": {
                "x": 776,
                "y": 88
              }
            },
            {
              "id": "3e08d30f-4cc5-4c7b-a1ea-009d5795aaed",
              "type": "basic.input",
              "data": {
                "name": "D",
                "clock": false
              },
              "position": {
                "x": 192,
                "y": 120
              }
            },
            {
              "id": "1b06d9f0-d794-4cc0-9643-a1a5f32ebaec",
              "type": "basic.code",
              "data": {
                "code": "reg _Q = 0;\nassign Q=_Q;\nalways @(posedge Clock)\nbegin\n  _Q <= D;\nend",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "Clock"
                    },
                    {
                      "name": "D"
                    }
                  ],
                  "out": [
                    {
                      "name": "Q"
                    }
                  ]
                }
              },
              "position": {
                "x": 408,
                "y": 56
              },
              "size": {
                "width": 272,
                "height": 128
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "3eab6a54-662e-4398-81a1-e4c1d7285191",
                "port": "out"
              },
              "target": {
                "block": "1b06d9f0-d794-4cc0-9643-a1a5f32ebaec",
                "port": "Clock"
              }
            },
            {
              "source": {
                "block": "3e08d30f-4cc5-4c7b-a1ea-009d5795aaed",
                "port": "out"
              },
              "target": {
                "block": "1b06d9f0-d794-4cc0-9643-a1a5f32ebaec",
                "port": "D"
              }
            },
            {
              "source": {
                "block": "1b06d9f0-d794-4cc0-9643-a1a5f32ebaec",
                "port": "Q"
              },
              "target": {
                "block": "73f2857d-3f7f-45c2-92f5-c550285b4e71",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "8e2728307baccbf26c01cdb87bcfba8ca64a435c": {
      "package": {
        "name": "Subida",
        "version": "0.1",
        "description": "Detector de flanco de subida. Emite un tic cuando detecta un flanco ascendente",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22363.337%22%20height=%22251.136%22%20viewBox=%220%200%2096.132868%2066.446441%22%3E%3Cdefs%3E%3Cmarker%20orient=%22auto%22%20id=%22a%22%20overflow=%22visible%22%3E%3Cpath%20d=%22M2.308%200l-3.46%202v-4z%22%20fill=%22red%22%20fill-rule=%22evenodd%22%20stroke=%22red%22%20stroke-width=%22.5332%22/%3E%3C/marker%3E%3C/defs%3E%3Cg%20transform=%22translate(-63.113%20-50.902)%22%3E%3Cg%20fill=%22none%22%20stroke=%22#00f%22%20stroke-linecap=%22round%22%3E%3Cpath%20d=%22M76.611%2083.336l6.027%207.974-5.055%206.03%201.75%201.557M75.371%2083.53l-3.5%207.975-7.97%201.556.583%202.528%22%20stroke-width=%221.058%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M75.907%2083.53V53.588%22%20stroke-width=%223.969%22/%3E%3Cpath%20d=%22M65.118%2063.338l10.688-10.452%2010.351%2010.452%22%20stroke-width=%223.969%22%20stroke-linejoin=%22round%22/%3E%3C/g%3E%3Cpath%20d=%22M123.88%2069.103c2.17%203.317%204.013%202.718%205.68%200%22%20fill=%22none%22%20stroke=%22#00f%22%20stroke-width=%22.529%22%20stroke-linecap=%22round%22/%3E%3Cpath%20d=%22M132.326%2095.38V51.614h-11.225v43.497%22%20fill=%22none%22%20stroke=%22#00f%22%20stroke-width=%221.323%22%20stroke-linecap=%22round%22/%3E%3Cellipse%20cx=%22112.489%22%20cy=%2297.866%22%20rx=%227.009%22%20ry=%222.635%22%20transform=%22rotate(-1.418)%22%20fill=%22#00f%22%20stroke=%22#00f%22%20stroke-width=%22.265%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cellipse%20cx=%22-140.807%22%20cy=%2291.678%22%20rx=%227.009%22%20ry=%222.635%22%20transform=%22scale(-1%201)%20rotate(-1.418)%22%20fill=%22#00f%22%20stroke=%22#00f%22%20stroke-width=%22.265%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M124.8%2059.416v3.875M128.39%2059.416v3.875%22%20fill=%22none%22%20stroke=%22#00f%22%20stroke-width=%22.529%22/%3E%3Cpath%20d=%22M85.794%2074.097h21.381%22%20fill=%22red%22%20stroke=%22red%22%20stroke-width=%222.646%22%20marker-end=%22url(#a)%22/%3E%3Cg%20transform=%22matrix(.842%200%200%20.842%2062.024%2042.68)%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20fill=%22#ececec%22%20stroke-width=%22.608%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%221.521%22/%3E%3C/g%3E%3C/g%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "4196184b-4a60-493b-bcc6-c95958483683",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": 152,
                "y": 176
              }
            },
            {
              "id": "1d2e403f-0fa6-41fd-83a9-4f309eadd855",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 624,
                "y": 200
              }
            },
            {
              "id": "b6426b43-dcda-418d-b6d3-4764b5bc0b25",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": false
              },
              "position": {
                "x": 152,
                "y": 232
              }
            },
            {
              "id": "3b0eca37-3439-41c9-99e7-7ff1e56bb528",
              "type": "basic.code",
              "data": {
                "code": "reg q = 0;\n\nalways @(posedge clk)\n  q <= i;\n  \nassign o = (~q & i);  ",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "i"
                    }
                  ],
                  "out": [
                    {
                      "name": "o"
                    }
                  ]
                }
              },
              "position": {
                "x": 336,
                "y": 176
              },
              "size": {
                "width": 232,
                "height": 112
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "b6426b43-dcda-418d-b6d3-4764b5bc0b25",
                "port": "out"
              },
              "target": {
                "block": "3b0eca37-3439-41c9-99e7-7ff1e56bb528",
                "port": "i"
              }
            },
            {
              "source": {
                "block": "3b0eca37-3439-41c9-99e7-7ff1e56bb528",
                "port": "o"
              },
              "target": {
                "block": "1d2e403f-0fa6-41fd-83a9-4f309eadd855",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "4196184b-4a60-493b-bcc6-c95958483683",
                "port": "out"
              },
              "target": {
                "block": "3b0eca37-3439-41c9-99e7-7ff1e56bb528",
                "port": "clk"
              }
            }
          ]
        }
      }
    },
    "d809c353eaeb491ba520e04fd05d420da237fdb5": {
      "package": {
        "name": "timer-msec CLONE",
        "version": "0.1-c1764786587175",
        "description": "Temporizador en milisegundos. La señal p está activa durante el tiempo indicado. Por tic se emite un tic al finalizar",
        "author": "Juan Gonzalez-Gomez (obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20viewBox=%220%200%20293.13756%20181.35395%22%20width=%22293.137%22%20height=%22181.354%22%3E%3Ccircle%20cx=%22149.086%22%20cy=%2290.681%22%20r=%2270.101%22%20fill=%22#fff%22/%3E%3Cpath%20d=%22M149.086%2013.679c-42.531%200-77.003%2034.472-77.003%2077.002%200%2042.531%2034.472%2077.003%2077.003%2077.003%2042.53%200%2077.003-34.472%2077.003-77.003%200-42.53-34.472-77.002-77.003-77.002zm0%20145.175c-37.673%200-68.173-30.539-68.173-68.173%200-37.633%2030.539-68.172%2068.173-68.172%2037.633%200%2068.172%2030.539%2068.172%2068.172%200%2037.634-30.538%2068.173-68.172%2068.173z%22%20fill=%22#333%22/%3E%3Cpath%20d=%22M146.772%2030.683h4.627v18.2h-4.627zM89.125%2092.965v-4.627h18.2v4.627zm62.261%2057.665h-4.627v-18.2h4.627zm57.647-62.28v4.628h-18.2V88.35zM105.044%2049.905l3.272-3.272%2012.87%2012.87-3.273%203.271zm3.28%2084.79l-3.27-3.272%2012.868-12.87%203.272%203.272zm84.774-3.265l-3.272%203.273-12.87-12.87%203.273-3.272zM189.85%2046.64l3.272%203.272-12.87%2012.87-3.271-3.272z%22%20fill=%22#333%22/%3E%3Ccircle%20cx=%22149.086%22%20cy=%2290.681%22%20r=%224.781%22%20fill=%22#333%22/%3E%3Cpath%20d=%22M149.795%2070.653l2.722.288-2.109%2019.9-2.722-.288z%22%20fill=%22#333%22/%3E%3Cpath%20d=%22M181.26%2072.13l1.276%202.422-32.859%2017.296-1.275-2.422z%22%20fill=%22#333%22/%3E%3Cpath%20d=%22M152.016%2080.386c-1.08%200-1.928.887-1.928%201.928%200%20.656.309%201.234.81%201.581l-14.691%2041.451%201.002.347%2014.691-41.45h.116c1.08%200%201.928-.888%201.928-1.929a1.934%201.934%200%200%200-1.928-1.928z%22%20fill=%22#cf000f%22/%3E%3Ctext%20y=%2244.949%22%20x=%221.863%22%20style=%22line-height:0%25%22%20font-weight=%22400%22%20font-size=%2269.516%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22scale(.99853%201.00147)%22%20font-family=%22sans-serif%22%20fill=%22#00f%22%20stroke-width=%221.289%22%3E%3Ctspan%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20y=%2244.949%22%20x=%221.863%22%20font-weight=%22700%22%20font-size=%2239.724%22%3Ems%3C/tspan%3E%3C/text%3E%3Cg%20transform=%22matrix(2.99796%200%200%202.99796%20-53.023%20-84.502)%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20fill=%22#ececec%22%20stroke-width=%22.608%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%221.521%22/%3E%3C/g%3E%3Cg%20transform=%22matrix(2.99796%200%200%202.99796%20-257.041%20-84.502)%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20fill=%22#ececec%22%20stroke-width=%22.608%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%221.521%22/%3E%3C/g%3E%3Ccircle%20cx=%22248.578%22%20cy=%2244.56%22%20r=%2243.648%22%20fill=%22#ececec%22%20stroke=%22green%22%20stroke-width=%221.824%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M279.216%2057.21h-5.01V30.018h-51.31v26.98h-5.456%22%20fill=%22none%22%20stroke=%22green%22%20stroke-width=%224.56%22%20stroke-linecap=%22round%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "c45dab76-9d0f-4742-9e4d-3048637d245d",
              "type": "basic.output",
              "data": {
                "name": "p"
              },
              "position": {
                "x": 1224,
                "y": 96
              }
            },
            {
              "id": "7697c4d1-f5f8-4a1d-88af-e367fe54e4b6",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": 472,
                "y": 96
              }
            },
            {
              "id": "61d11f03-6fbc-4467-a947-d546fa6f6429",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": false
              },
              "position": {
                "x": 456,
                "y": 304
              }
            },
            {
              "id": "8c6fda76-1ba0-4ef8-a53d-7bc8a9db4454",
              "type": "basic.output",
              "data": {
                "name": "tic"
              },
              "position": {
                "x": 1216,
                "y": 304
              }
            },
            {
              "id": "7ca578e5-8e36-4c04-bbea-144418c8e9af",
              "type": "basic.constant",
              "data": {
                "name": "",
                "value": "100",
                "local": false
              },
              "position": {
                "x": 848,
                "y": -96
              }
            },
            {
              "id": "e6b9690b-1da7-4600-9015-0bbed31633e2",
              "type": "basic.info",
              "data": {
                "info": "**Arranque del**  \n**temporizador**",
                "readonly": true
              },
              "position": {
                "x": 448,
                "y": 264
              },
              "size": {
                "width": 144,
                "height": 56
              }
            },
            {
              "id": "f3af4211-e3df-4710-a0a8-96a035a833a9",
              "type": "basic.info",
              "data": {
                "info": "**Salida de pulso**",
                "readonly": true
              },
              "position": {
                "x": 1224,
                "y": 72
              },
              "size": {
                "width": 176,
                "height": 40
              }
            },
            {
              "id": "a15228f1-41aa-494c-82fb-5491bf5fcc13",
              "type": "basic.info",
              "data": {
                "info": "**Salida de tic**",
                "readonly": true
              },
              "position": {
                "x": 1216,
                "y": 280
              },
              "size": {
                "width": 152,
                "height": 40
              }
            },
            {
              "id": "204eb46d-dd4f-47cf-b0f3-c9095263d325",
              "type": "basic.info",
              "data": {
                "info": "**Parametro del timer**  \nmilisegundos a esperar",
                "readonly": true
              },
              "position": {
                "x": 832,
                "y": -128
              },
              "size": {
                "width": 208,
                "height": 56
              }
            },
            {
              "id": "a66b0b7f-4692-489e-9140-fb81fef2a1c5",
              "type": "basic.code",
              "data": {
                "code": "//localparam MS;\n\n//-- Constante para dividir y obtener una señal de  \n//-- periodo 1ms\nlocalparam M = 25000;\n\n//-- Calcular el numero de bits para almacenar M\nlocalparam N = $clog2(M);\n\n//-- Cable de reset para el corazon\nwire rst_heart;\n\n//-- Overflow del temporizador del corazon\nwire ov_heart;\n\n//-- Habilitacion del corazon\nwire ena;\n\n//-- Tics del corazon\nwire tic_heart;\n\n//-- Contador del corazon\nreg [N-1:0] heart=0;\n\nalways @(posedge clk)\n  if (rst_heart)\n    heart <= 0;\n  else\n    heart <= heart + 1;\n\n//-- Overflow del contador\nassign ov_heart = (heart == M-1);\n\n//-- La salida del corazon es la señal de overflow\nassign tic_heart = ov_heart;\n\n//-- Reset del corazon\nassign rst_heart =~ena | ov_heart;\n\n\n\n//--------------------------------------------\n//-- Contador de tics\n//--------------------------------------------\n\n//-- Calcular el numero de bits para almacenar MS tics\nlocalparam CB = $clog2(MS);\n\nreg [CB-1:0] counter = 0;\n\n//-- Overflow del contador\nwire ov;\n\n//-- Señal de reset del contador\nwire rst;\n\nalways @(posedge clk)\nif (rst)\n  counter <= 0;\nelse\n  if (tic_heart)\n    counter <= counter + 1;\n\n//-- Evento: cuenta máxima de tics alcanzada\nassign ov = (counter == MS);\n\n//---------------------------------------\n//-- Biestable de estado del timer\n//-- 0: Apagado  \n//-- 1: Funcionando\nreg q = 0;\n\nalways @(posedge clk)\n  if (start)\n    q <= 1'b1;\n  else if (rst)\n    q<=1'b0;\n    \n//-- Lógica de reset\n//En función de la entrada, el estado y  \n// el overflow se inicializa el contador y \n// se habilita el corazón de tics\nassign rst = ~q | ov | start;\nassign ena = ~rst;\n\n//-- Salida de pulso\nassign p = q;\n\n//-- Salida de tic\n//-- Saca un tic cuando ha finalizado la cuenta\nassign tic = ov;\n",
                "params": [
                  {
                    "name": "MS"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "start"
                    }
                  ],
                  "out": [
                    {
                      "name": "p"
                    },
                    {
                      "name": "tic"
                    }
                  ]
                }
              },
              "position": {
                "x": 632,
                "y": 24
              },
              "size": {
                "width": 520,
                "height": 416
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "61d11f03-6fbc-4467-a947-d546fa6f6429",
                "port": "out"
              },
              "target": {
                "block": "a66b0b7f-4692-489e-9140-fb81fef2a1c5",
                "port": "start"
              }
            },
            {
              "source": {
                "block": "a66b0b7f-4692-489e-9140-fb81fef2a1c5",
                "port": "p"
              },
              "target": {
                "block": "c45dab76-9d0f-4742-9e4d-3048637d245d",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "a66b0b7f-4692-489e-9140-fb81fef2a1c5",
                "port": "tic"
              },
              "target": {
                "block": "8c6fda76-1ba0-4ef8-a53d-7bc8a9db4454",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "7697c4d1-f5f8-4a1d-88af-e367fe54e4b6",
                "port": "out"
              },
              "target": {
                "block": "a66b0b7f-4692-489e-9140-fb81fef2a1c5",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "7ca578e5-8e36-4c04-bbea-144418c8e9af",
                "port": "constant-out"
              },
              "target": {
                "block": "a66b0b7f-4692-489e-9140-fb81fef2a1c5",
                "port": "MS"
              }
            }
          ]
        }
      }
    },
    "a20433be5bd652b5ca9dc0339207d2f694145338": {
      "package": {
        "name": "Biestable-T",
        "version": "0.1",
        "description": "Biestable de cambio (Tipo T). Cuando se recibe un tic cambia de estado",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22352.621%22%20height=%22328.166%22%20viewBox=%220%200%2093.297626%2086.827316%22%3E%3Ctext%20style=%22line-height:1.25;-inkscape-font-specification:ubuntu%22%20x=%2242.514%22%20y=%2290.458%22%20font-weight=%22400%22%20font-size=%2232.213%22%20font-family=%22ubuntu%22%20letter-spacing=%220%22%20word-spacing=%220%22%20stroke-width=%222.013%22%20transform=%22translate(-21.167%20-56.576)%22%3E%3Ctspan%20x=%2242.514%22%20y=%2290.458%22%20style=%22-inkscape-font-specification:'ubuntu%20Medium'%22%20font-weight=%22500%22%3E1%3C/tspan%3E%3C/text%3E%3Cpath%20d=%22M82.577%208.301l6.424-6.173-.751%2020.271-19.854-.75%206.09-6.007s-4.672-4.922-12.93-5.005c-8.26-.084-13.265%204.588-13.265%204.588l.084-6.84-5.172-2.253s8.091-6.34%2018.853-5.84c10.761.501%2020.521%208.01%2020.521%208.01zM38.94%2054.949l-6.424%206.173.75-20.271%2019.855.75-6.09%206.007s4.672%204.922%2012.93%205.005c8.26.084%2013.264-4.588%2013.264-4.588l-.083%206.84%205.172%202.253s-8.092%206.34-18.853%205.84C48.7%2062.456%2038.94%2054.948%2038.94%2054.948z%22%20fill=%22green%22%20stroke=%22#000%22%20stroke-width=%22.529%22/%3E%3Cg%20transform=%22translate(-93.518%20-9.898)%20scale(1.09073)%22%20stroke=%22green%22%20stroke-linecap=%22round%22%3E%3Ccircle%20r=%2214.559%22%20cy=%2273.815%22%20cx=%22100.602%22%20fill=%22#ececec%22%20stroke-width=%22.608%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M106.978%2082.142h-3.353V63.316H97.54v18.678h-3.652%22%20fill=%22none%22%20stroke-width=%221.521%22/%3E%3C/g%3E%3Ctext%20style=%22line-height:1.25;-inkscape-font-specification:ubuntu%22%20x=%2297.553%22%20y=%22107.059%22%20font-weight=%22400%22%20font-size=%2232.213%22%20font-family=%22ubuntu%22%20letter-spacing=%220%22%20word-spacing=%220%22%20stroke-width=%222.013%22%20transform=%22translate(-21.167%20-56.576)%22%3E%3Ctspan%20x=%2297.553%22%20y=%22107.059%22%20style=%22-inkscape-font-specification:'ubuntu%20Medium'%22%20font-weight=%22500%22%3E0%3C/tspan%3E%3C/text%3E%3Cpath%20d=%22M62.954%2034.353l2.22%208.819-5.217-7.525%22%20fill=%22#ccc%22%20stroke=%22#000%22%20stroke-width=%22.529%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M62.083%2029.816l-4.32-8.077%202.89-1.247-.693-1.606-9.365%204.042.693%201.606%202.73-1.178%203.142%208.675s-2.049%201.32-1.902%203.08c.146%201.76%201.032%202.095.89%202.182l10.598-4.59s-.534-1.897-1.759-2.446c-1.224-.549-2.904-.441-2.904-.441z%22%20fill=%22red%22%20stroke=%22#000%22%20stroke-width=%22.529%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "3943e194-090b-4553-9df3-88bc4b17abc2",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": 200,
                "y": 96
              }
            },
            {
              "id": "aa84d31e-cd92-44c7-bb38-c7a4cd903a78",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 680,
                "y": 184
              }
            },
            {
              "id": "bf2f0c53-2d04-4cba-aa70-2df85502d24f",
              "type": "basic.input",
              "data": {
                "name": "T",
                "clock": false
              },
              "position": {
                "x": 224,
                "y": 200
              }
            },
            {
              "id": "65194b18-5d2a-41b2-bd86-01be99978ad6",
              "type": "basic.constant",
              "data": {
                "name": "",
                "value": "0",
                "local": false
              },
              "position": {
                "x": 456,
                "y": 64
              }
            },
            {
              "id": "bdc170f0-4468-4137-bd79-4624c9cadf2b",
              "type": "basic.code",
              "data": {
                "code": "reg _q = INI;\nassign q=_q;\nalways @(posedge clk)\n  if (T)\n    _q <= ~_q;\n    \n",
                "params": [
                  {
                    "name": "INI"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "T"
                    }
                  ],
                  "out": [
                    {
                      "name": "q"
                    }
                  ]
                }
              },
              "position": {
                "x": 384,
                "y": 168
              },
              "size": {
                "width": 232,
                "height": 88
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "3943e194-090b-4553-9df3-88bc4b17abc2",
                "port": "out"
              },
              "target": {
                "block": "bdc170f0-4468-4137-bd79-4624c9cadf2b",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "bf2f0c53-2d04-4cba-aa70-2df85502d24f",
                "port": "out"
              },
              "target": {
                "block": "bdc170f0-4468-4137-bd79-4624c9cadf2b",
                "port": "T"
              }
            },
            {
              "source": {
                "block": "bdc170f0-4468-4137-bd79-4624c9cadf2b",
                "port": "q"
              },
              "target": {
                "block": "aa84d31e-cd92-44c7-bb38-c7a4cd903a78",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "65194b18-5d2a-41b2-bd86-01be99978ad6",
                "port": "constant-out"
              },
              "target": {
                "block": "bdc170f0-4468-4137-bd79-4624c9cadf2b",
                "port": "INI"
              }
            }
          ]
        }
      }
    },
    "370abb401e524efd3125464b094b41328bfde9b4": {
      "package": {
        "name": "DeMux-1-2",
        "version": "0.1",
        "description": "1-to-2 DeMultplexer (1-bit channels)",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%2280.833%22%20height=%22158.56%22%20viewBox=%220%200%2075.781585%20148.65066%22%3E%3Cpath%20d=%22M74.375%2036.836c0-12.691-6.99-24.413-18.326-30.729-11.335-6.316-25.284-6.262-36.568.141C8.198%2012.652%201.304%2024.427%201.407%2037.118v74.415c-.103%2012.69%206.79%2024.466%2018.074%2030.87%2011.284%206.403%2025.233%206.457%2036.568.14%2011.336-6.316%2018.326-18.037%2018.326-30.728z%22%20fill=%22none%22%20stroke=%22#00f%22%20stroke-width=%222.813%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Ctext%20style=%22line-height:125%25%22%20x=%227.448%22%20y=%2291.518%22%20transform=%22matrix(1.00472%200%200%20.9953%2020.25%2033.697)%22%20font-weight=%22400%22%20font-size=%2233.509%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%3E%3Ctspan%20x=%227.448%22%20y=%2291.518%22%3E0%3C/tspan%3E%3C/text%3E%3Ctext%20style=%22line-height:125%25%22%20x=%227.359%22%20y=%2214.582%22%20transform=%22matrix(1.00472%200%200%20.9953%2020.25%2033.697)%22%20font-weight=%22400%22%20font-size=%2233.509%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%3E%3Ctspan%20x=%227.359%22%20y=%2214.582%22%3E1%3C/tspan%3E%3C/text%3E%3C/svg%3E",
        "otid": 1618922858665
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "a0fa1754-f66a-4772-adc6-07f9549ae9fe",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "input",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 744,
                "y": 368
              }
            },
            {
              "id": "adf3a6ae-71e2-43dd-b504-c2cdbc14dab7",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": false
              },
              "position": {
                "x": 136,
                "y": 416
              }
            },
            {
              "id": "d80dfce7-c76f-40a0-91ff-5e55863fe5da",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "input",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 272,
                "y": 416
              }
            },
            {
              "id": "0e6a9a81-8521-4ade-8012-71915b39ae41",
              "type": "basic.output",
              "data": {
                "name": "1"
              },
              "position": {
                "x": 1032,
                "y": 424
              }
            },
            {
              "id": "a14a9465-c4d0-4c20-aa1a-458b40aa8b70",
              "type": "basic.inputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "sel",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 272,
                "y": 528
              }
            },
            {
              "id": "d4a339a0-7bdb-4695-8f6b-93ea4a70b36a",
              "type": "basic.input",
              "data": {
                "name": "sel",
                "clock": false
              },
              "position": {
                "x": 136,
                "y": 528
              }
            },
            {
              "id": "6daf7ae7-6704-44ee-b291-2e8188102286",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "input",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 752,
                "y": 544
              }
            },
            {
              "id": "798f4215-8ebd-4cdc-9532-7b34129244f8",
              "type": "basic.output",
              "data": {
                "name": "0"
              },
              "position": {
                "x": 1040,
                "y": 600
              }
            },
            {
              "id": "8d94a294-a698-43c5-9777-874fd39b8586",
              "type": "basic.outputLabel",
              "data": {
                "blockColor": "fuchsia",
                "name": "sel",
                "oldBlockColor": "fuchsia"
              },
              "position": {
                "x": 464,
                "y": 648
              }
            },
            {
              "id": "b800aada-bfb1-4bbf-bc5e-140fff7323aa",
              "type": "ba518ee261a2be13a9739cd3a01cdcebe0ef63c0",
              "position": {
                "x": 888,
                "y": 424
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "76ece969-b03a-4732-b32b-2a6cab98acd8",
              "type": "3676a00f3a70e406487ed14b901daf3e4984e63d",
              "position": {
                "x": 624,
                "y": 648
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "c24fb0bc-5a03-4597-b2a8-8249e2725341",
              "type": "ba518ee261a2be13a9739cd3a01cdcebe0ef63c0",
              "position": {
                "x": 888,
                "y": 600
              },
              "size": {
                "width": 96,
                "height": 64
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "adf3a6ae-71e2-43dd-b504-c2cdbc14dab7",
                "port": "out"
              },
              "target": {
                "block": "d80dfce7-c76f-40a0-91ff-5e55863fe5da",
                "port": "inlabel"
              }
            },
            {
              "source": {
                "block": "d4a339a0-7bdb-4695-8f6b-93ea4a70b36a",
                "port": "out"
              },
              "target": {
                "block": "a14a9465-c4d0-4c20-aa1a-458b40aa8b70",
                "port": "inlabel"
              }
            },
            {
              "source": {
                "block": "a0fa1754-f66a-4772-adc6-07f9549ae9fe",
                "port": "outlabel"
              },
              "target": {
                "block": "b800aada-bfb1-4bbf-bc5e-140fff7323aa",
                "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
              }
            },
            {
              "source": {
                "block": "6daf7ae7-6704-44ee-b291-2e8188102286",
                "port": "outlabel"
              },
              "target": {
                "block": "c24fb0bc-5a03-4597-b2a8-8249e2725341",
                "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
              }
            },
            {
              "source": {
                "block": "8d94a294-a698-43c5-9777-874fd39b8586",
                "port": "outlabel"
              },
              "target": {
                "block": "76ece969-b03a-4732-b32b-2a6cab98acd8",
                "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
              }
            },
            {
              "source": {
                "block": "8d94a294-a698-43c5-9777-874fd39b8586",
                "port": "outlabel"
              },
              "target": {
                "block": "b800aada-bfb1-4bbf-bc5e-140fff7323aa",
                "port": "97b51945-d716-4b6c-9db9-970d08541249"
              },
              "vertices": [
                {
                  "x": 584,
                  "y": 544
                }
              ]
            },
            {
              "source": {
                "block": "b800aada-bfb1-4bbf-bc5e-140fff7323aa",
                "port": "664caf9e-5f40-4df4-800a-b626af702e62"
              },
              "target": {
                "block": "0e6a9a81-8521-4ade-8012-71915b39ae41",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "c24fb0bc-5a03-4597-b2a8-8249e2725341",
                "port": "664caf9e-5f40-4df4-800a-b626af702e62"
              },
              "target": {
                "block": "798f4215-8ebd-4cdc-9532-7b34129244f8",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "76ece969-b03a-4732-b32b-2a6cab98acd8",
                "port": "664caf9e-5f40-4df4-800a-b626af702e62"
              },
              "target": {
                "block": "c24fb0bc-5a03-4597-b2a8-8249e2725341",
                "port": "97b51945-d716-4b6c-9db9-970d08541249"
              }
            }
          ]
        }
      }
    },
    "ba518ee261a2be13a9739cd3a01cdcebe0ef63c0": {
      "package": {
        "name": "AND2",
        "version": "1.0.2",
        "description": "Two bits input And gate",
        "author": "Jesús Arroyo, Juan González",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22336.09%22%20height=%22194.045%22%20version=%221%22%3E%3Cpath%20d=%22M174.656%20190.045H78.304V4h96.352s87.463%208.625%2087.463%2091.94c0%2083.311-87.463%2094.105-87.463%2094.105z%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M4.057%2045.668h74.018M4.057%20144.812h74.018m184.632-50.034h69.326%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linecap=%22round%22/%3E%3Ctext%20style=%22line-height:125%25%22%20x=%2292.894%22%20y=%22114.587%22%20font-weight=%22400%22%20font-size=%2258.054%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#00f%22%3E%3Ctspan%20x=%2292.894%22%20y=%22114.587%22%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20font-weight=%22700%22%3EAND%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "18c2ebc7-5152-439c-9b3f-851c59bac834",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 96,
                "y": 56
              }
            },
            {
              "id": "664caf9e-5f40-4df4-800a-b626af702e62",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 600,
                "y": 96
              }
            },
            {
              "id": "97b51945-d716-4b6c-9db9-970d08541249",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 96,
                "y": 128
              }
            },
            {
              "id": "00925b04-5004-4307-a737-fa4e97c8b6ab",
              "type": "basic.code",
              "data": {
                "code": "//-- AND gate\n//-- Verilog implementation\n\nassign c = a & b;\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "a"
                    },
                    {
                      "name": "b"
                    }
                  ],
                  "out": [
                    {
                      "name": "c"
                    }
                  ]
                }
              },
              "position": {
                "x": 256,
                "y": 48
              },
              "size": {
                "width": 304,
                "height": 152
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "18c2ebc7-5152-439c-9b3f-851c59bac834",
                "port": "out"
              },
              "target": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "a"
              }
            },
            {
              "source": {
                "block": "97b51945-d716-4b6c-9db9-970d08541249",
                "port": "out"
              },
              "target": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "b"
              }
            },
            {
              "source": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "c"
              },
              "target": {
                "block": "664caf9e-5f40-4df4-800a-b626af702e62",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "3676a00f3a70e406487ed14b901daf3e4984e63d": {
      "package": {
        "name": "NOT",
        "version": "2.0",
        "description": "NOT gate (Verilog implementation)",
        "author": "Jesús Arroyo, Juan González",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22317.651%22%20height=%22194.058%22%20version=%221%22%3E%3Cpath%20d=%22M69.246%204l161.86%2093.027-161.86%2093.031V4z%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linejoin=%22round%22/%3E%3Cellipse%20cx=%22253.352%22%20cy=%2296.736%22%20rx=%2221.393%22%20ry=%2221.893%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M4.057%2097.49h65.262m205.796%200h38.48%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linecap=%22round%22/%3E%3Ctext%20style=%22line-height:125%25%22%20x=%2281.112%22%20y=%22111.734%22%20transform=%22scale(.99532%201.0047)%22%20font-weight=%22400%22%20font-size=%2249.675%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#00f%22%3E%3Ctspan%20x=%2281.112%22%20y=%22111.734%22%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20font-weight=%22700%22%3ENot%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "18c2ebc7-5152-439c-9b3f-851c59bac834",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 112,
                "y": 72
              }
            },
            {
              "id": "664caf9e-5f40-4df4-800a-b626af702e62",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 560,
                "y": 72
              }
            },
            {
              "id": "5365ed8c-e5db-4445-938f-8d689830ea5c",
              "type": "basic.code",
              "data": {
                "code": "//-- NOT Gate\nassign q = ~a;\n\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "a"
                    }
                  ],
                  "out": [
                    {
                      "name": "q"
                    }
                  ]
                }
              },
              "position": {
                "x": 256,
                "y": 48
              },
              "size": {
                "width": 256,
                "height": 104
              }
            },
            {
              "id": "e3bb41e3-1944-4946-9675-c2dbe2e49fcf",
              "type": "basic.info",
              "data": {
                "info": "Input",
                "readonly": true
              },
              "position": {
                "x": 128,
                "y": 32
              },
              "size": {
                "width": 80,
                "height": 40
              }
            },
            {
              "id": "8408dd5f-945f-4a89-9790-7752813d4e91",
              "type": "basic.info",
              "data": {
                "info": "Output",
                "readonly": true
              },
              "position": {
                "x": 576,
                "y": 40
              },
              "size": {
                "width": 80,
                "height": 40
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "18c2ebc7-5152-439c-9b3f-851c59bac834",
                "port": "out"
              },
              "target": {
                "block": "5365ed8c-e5db-4445-938f-8d689830ea5c",
                "port": "a"
              }
            },
            {
              "source": {
                "block": "5365ed8c-e5db-4445-938f-8d689830ea5c",
                "port": "q"
              },
              "target": {
                "block": "664caf9e-5f40-4df4-800a-b626af702e62",
                "port": "in"
              }
            }
          ]
        }
      }
    }
  }
}