{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 5,
			"revision" : 3,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 1923.0, 90.0, 1275.0, 953.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 2,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "Untitled_template",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 452.0, 16.800000011920929, 57.0, 22.0 ],
					"text" : "hello you"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-66",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "n4m.monitor.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 333.809512495994568, 217.0, 400.0, 220.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"linecount" : 119,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1084.000016152858734, 587.200008749961853, 153.0, 1615.0 ],
					"text" : "const { Deepgram } = require(\"@deepgram/sdk\");\nconst recorder = require(\"node-record-lpcm16\");\nconst maxApi = require(\"max-api\");\nrequire(\"dotenv\").config();\n\nconst { delimiter } = require(\"path\");\n\nconst paths = process.env.PATH.split(delimiter);\npaths.push(\"/opt/homebrew/bin/\"); // !!!Your location of sox, verify in terminal with this command: $ which sox\nprocess.env.PATH = paths.join(delimiter);\n\n// Your Deepgram API Key\nconst deepgramApiKey = process.env.DEEPGRAM_API_KEY; // < get an API-Key from OpenAl, store in same folder in env-file\n\n// Initialize the Deepgram SDK\nconst deepgram = new Deepgram(deepgramApiKey);\n\n// Create a connection to Deepgram\n// In this example, punctuation is turned on, interim results are turned off, and language is set to UK English.\nconst deepgramLive = deepgram.transcription.live({\n  punctuate: true,\n  interim_results: false,\n  language: \"en-US\",\n  encoding: \"linear16\",\n  sample_rate: 48000,\n  // check out Deepgram features and set properties\n});\n\nconst recording = recorder.record({\n  sampleRate: 48000,\n  // set more recording properties; accesses standard recording device\n});\n\n// Listen for any data available from the recording stream\nrecording.stream().on(\"data\", (chunk) => {\n  // Check if the WebSocket is ready to receive data\n  if (deepgramLive.getReadyState() === 1) {\n    // Send the chunk of audio data to Deepgram\n    deepgramLive.send(chunk);\n  }\n});\n\n// Listen for the connection to close\ndeepgramLive.addListener(\"close\", () => {\n  console.log(\"Connection closed\");\n});\n\n// Listen for any transcripts received from Deeparam and write them to the console\ndeepgramLive.addListener(\"transcriptReceived\", async (message) => {\n  try {\n    const data = JSON.parse(message);\n    const transcription = data.channel.alternatives[0].transcript;\n    maxApi.outlet(transcription, { depth: null });\n    // some error code creation\n  } catch (error) {\n    console.error(error);\n    console.error(\"Transcription failed!\");\n    maxApi.post(error.response.data);\n  }\n});\n"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 744.600010633468628, 343.399998664855957, 124.400001108646393, 22.0 ],
					"text" : "Credible"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 864.700013160705566, 442.399998664855957, 61.0, 22.0 ],
					"text" : "pipe 1000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 831.100011765956879, 516.600013911724091, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 831.099998414516449, 549.800008177757263, 52.0, 22.0 ],
					"text" : "gate 1 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 831.100011765956879, 587.936127557754389, 33.0, 22.0 ],
					"saved_object_attributes" : 					{
						"shell" : "(default)"
					}
,
					"text" : "shell"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 864.700013160705566, 489.599999129772186, 125.0, 22.0 ],
					"text" : "prepend say -v Daniel"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1219.200018167495728, 40.19999897480011, 150.0, 20.0 ],
					"text" : "Only once"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-50",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "n4m.monitor.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1009.999999165534973, 244.399998664855957, 400.0, 220.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 48.0, 548.800008177757263, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 47.99998664855957, 582.000002443790436, 52.0, 22.0 ],
					"text" : "gate 1 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 393.199999988079071, 16.800000011920929, 53.0, 22.0 ],
					"text" : "r prompt"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 900.800013422966003, 320.800004780292511, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 900.800000071525574, 353.999999046325684, 52.0, 22.0 ],
					"text" : "gate 1 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 739.800010561943054, 285.999998033046722, 124.400001108646393, 35.0 ],
					"text" : "\"Two three four five six.\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 900.800000071525574, 387.5999995470047, 55.0, 22.0 ],
					"text" : "s prompt"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 13.600000202655792, 162.199999809265137, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 5,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 2388.0, 379.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 2,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "Untitled_template",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-13",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 119.0, 372.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "" ],
									"patching_rect" : [ 191.0, 211.0, 31.0, 22.0 ],
									"text" : "t 1 s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 158.0, 265.0, 52.0, 22.0 ],
									"text" : "gate 1 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 119.0, 329.0, 103.0, 22.0 ],
									"text" : "gate 1 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"patching_rect" : [ 119.0, 211.0, 58.0, 22.0 ],
									"text" : "t 0 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 119.0, 168.0, 91.0, 22.0 ],
									"text" : "route dictionary"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 119.0, 126.0, 47.0, 22.0 ],
									"text" : "zl iter 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 119.0, 83.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 1 ],
									"source" : [ "obj-12", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 1 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"source" : [ "obj-6", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 860.999999165534973, 237.999998569488525, 113.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p formatResponses"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 900.800013422966003, 87.599998593330383, 55.0, 22.0 ],
					"text" : "del 5000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 900.800013422966003, 117.099998593330383, 63.0, 22.0 ],
					"text" : "script stop"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 860.999999165534973, 50.599999010562897, 64.0, 22.0 ],
					"text" : "script start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1099.199998140335083, 40.19999897480011, 97.0, 22.0 ],
					"text" : "@deepgram/sdk"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1113.199998140335083, 66.199998915195465, 116.0, 22.0 ],
					"text" : "node-record-lpcm16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1099.199998140335083, 109.199998915195465, 115.0, 22.0 ],
					"text" : "script npm install $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 860.999999165534973, 190.99999874830246, 225.0, 22.0 ],
					"saved_object_attributes" : 					{
						"autostart" : 0,
						"defer" : 0,
						"watch" : 1
					}
,
					"text" : "node.script max2Deepgram.js @watch 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 42.0, 162.199999809265137, 31.0, 22.0 ],
					"text" : "t b s"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-511",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 42.0, 513.599999487400055, 111.0, 22.0 ],
					"text" : "prepend say -v Ava"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-409",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 48.0, 620.136121823787562, 33.0, 22.0 ],
					"saved_object_attributes" : 					{
						"shell" : "(default)"
					}
,
					"text" : "shell"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 5,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 1982.0, 116.0, 1296.0, 817.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 2,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "Untitled_template",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1283.0, 1125.0, 150.0, 20.0 ],
									"text" : "3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"linecount" : 67,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1283.0, 1147.0, 578.0, 918.0 ],
									"text" : "const { Deepgram } = require(\"@deepgram/sdk\");\nconst recorder = require(\"node-record-lpcm16\");\nconst maxApi = require(\"max-api\");\nrequire(\"dotenv\").config();\nconst { delimiter } = require(\"path\");\n\nconst paths = process.env.PATH.split(delimiter);\npaths.push(\"/opt/homebrew/bin/\"); // !!!Your location of sox, verify in terminal with this command: $ which sox\nprocess.env.PATH = paths.join(delimiter);\n\n// Your Deepgram API Key\nconst deepgramApiKey = process.env.DEEPGRAM_API_KEY; // < get an API-Key from OpenAl, store in same folder in env-file\n\n// Initialize the Deepgram SDK\nconst deepgram = new Deepgram(deepgramApiKey);\n\n// Create a connection to Deepgram\n// In this example, punctuation is turned on, interim results are turned off, and language is set to UK English.\nconst deepgramLive = deepgram.transcription.live({\n  punctuate: true,\n  interim_results: false,\n  language: \"en-US\",\n  encoding: \"linear16\",\n  sample_rate: 48000,\n  // check out Deepgram features and set properties\n});\n\n// Define a bottleneck method to avoid overwhelming Deepgram with too much data at once\nlet transcriptQueue = [];\nlet isTranscribing = false;\nconst bottleneck = async () => {\n  if (!isTranscribing && transcriptQueue.length > 0) {\n    isTranscribing = true;\n    const message = transcriptQueue.shift();\n    const data = JSON.parse(message);\n    maxApi.outlet(data.channel.alternatives[0].transcript, { depth: null });\n    isTranscribing = false;\n    await bottleneck();\n  }\n};\n\nconst recording = recorder.record({\n  sampleRate: 48000,\n  // set more recording properties; accesses standard recording device\n});\n\n// Listen for any data available from the recording stream\nrecording.stream().on(\"data\", (chunk) => {\n  // Check if the WebSocket is ready to receive data\n  if (deepgramLive.getReadyState() === 1) {\n    // Send the chunk of audio data to Deepgram\n    deepgramLive.send(chunk);\n    // Add the received message to the transcript queue\n    deepgramLive.addListener(\"transcriptReceived\", (message) => {\n      transcriptQueue.push(message);\n      bottleneck();\n    });\n  }\n});\n\n// Listen for the connection to close\ndeepgramLive.addListener(\"close\", () => {\n  console.log(\"Connection closed\");\n});\n"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 699.0, 1142.0, 150.0, 20.0 ],
									"text" : "2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"linecount" : 55,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 689.0, 1167.0, 578.0, 744.0 ],
									"text" : "const { Deepgram } = require(\"@deepgram/sdk\");\nconst recorder = require (\"node-record-lpcm16\");\nconst maxApi = require(\"max-api\");\nrequire (\"dotenv\").config();\n\nconst { delimiter } = require(\"path\");\n\nconst paths = process.env.PATH.split(delimiter);\npaths.push(\"/opt/homebrew/bin/\"); // !!!Your location of sox, verify in terminal with this command: $ which sox\nprocess.env.PATH = paths.join(delimiter);\n\n// Your Deepgram API Key\nconst deepgramApiKey = process.env.DEEPGRAM_API_KEY; // < get an API-Key from OpenAl, store in same folder in env-file\n\n// Initialize the Deepgram SDK\nconst deepgram = new Deepgram(deepgramApiKey);\n\n// Create a connection to Deepgram\n// In this example, punctuation is turned on, interim results are turned off, and language is set to UK English.\nconst deepgramLive = deepgram.transcription.live({\npunctuate: true,\ninterim_results: false, \nlanguage: \"en-US\",\nencoding: \"linear16\",\nsample_rate: 48000,\n// check out Deepgram features and set properties\n});\n\nconst recording = recorder.record({\nsampleRate: 48000,\n// set more recording properties; accesses standard recording device\n});\n\n// Listen for any data available from the recording stream\nrecording.stream().on(\"data\", (chunk) => {\n    // Check if the WebSocket is ready to receive data\n    if (deepgramLive.getReadyState() === 1) {\n        // Send the chunk of audio data to Deepgram\n        deepgramLive.send(chunk);\n    }\n});\n\n// Listen for the connection to close\ndeepgramLive.addListener(\"close\", () => {\nconsole.log (\"Connection closed\");\n});\n\n// Listen for any transcripts received from Deeparam and write them to the console\ndeepgramLive.addListener(\"transcriptReceived\", (message) => {\n    const data = JSON.parse(message);\n    maxApi.outlet(data.channel.alternatives[0].transcript, { depth: null});\n});"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 878.0, 360.0, 150.0, 20.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 695.0, 352.0, 150.0, 20.0 ],
									"text" : "Deepgram options"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"linecount" : 55,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 699.0, 379.0, 578.0, 744.0 ],
									"text" : "const { Deepgram } = require(\"@deepgram/sdk\");\nconst recorder = require (\"node-record-lpcm16\");\nconst maxApi = require(\"max-api\");\nrequire (\"dotenv\").config();\n\nconst { delimiter } = require(\"path\");\n\nconst paths = process.env.PATH.split(delimiter);\npaths.push(\"/opt/homebrew/bin/\"); // !!!Your location of sox, verify in terminal with this command: $ which sox\nprocess.env.PATH = paths.join(delimiter);\n\n// Your Deepgram API Key\nconst deepgramApiKey = process.env.DEEPGRAM_API_KEY; // < get an API-Key from OpenAl, store in same folder in env-file\n\n// Initialize the Deepgram SDK\nconst deepgram = new Deepgram(deepgramApiKey);\n\n// Create a connection to Deepgram\n// In this example, punctuation is turned on, interim results are turned off, and language is set to UK English.\nconst deepgramLive = deepgram.transcription.live({\npunctuate: true,\ninterim_results: false, \nlanguage: \"en-US\",\nencoding: \"linear16\",\nsample_rate: 48000,\n// check out Deepgram features and set properties\n});\n\nconst recording = recorder.record({\nsampleRate: 48000,\n// set more recording properties; accesses standard recording device\n});\n\n// Listen for any data available from the recording stream\nrecording.stream().on(\"data\", (chunk) => {\n    // Check if the WebSocket is ready to receive data\n    if (deepgramLive.getReadyState() === 1) {\n        // Send the chunk of audio data to Deepgram\n        deepgramLive.send(chunk);\n    }\n});\n\n// Listen for the connection to close\ndeepgramLive.addListener(\"close\", () => {\nconsole.log (\"Connection closed\");\n});\n\n// Listen for any transcripts received from Deeparam and write them to the console\ndeepgramLive.addListener(\"transcriptReceived\", (message) => {\n    const data = JSON.parse(message);\n    maxApi.outlet(data.channel.alternatives[0].transcript, { depth: null});\n});"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 0.0, 409.0, 150.0, 20.0 ],
									"text" : "3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 4.0, 361.0, 150.0, 20.0 ],
									"text" : "2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 4.0, 0.0, 150.0, 20.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"linecount" : 28,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 11.0, 772.0, 578.0, 395.0 ],
									"text" : "const { Configuration, OpenAIApi } = require(\"openai\");\nconst maxApi = require(\"max-api\");\nrequire(\"dotenv\").config();\n\nconst configuration = new Configuration({\n  apiKey: process.env.OPENAI_API_KEY\n});\n\nconst openai = new OpenAIApi(configuration);\n\nasync function runCompletion(prompt) {\n  try {\n    const completion = await openai.createCompletion({\n      model: \"text-davinci-003\",\n      prompt: prompt,\n      max_tokens: 100,\n    });\n\n    maxApi.outlet(completion.data.choices[0].text);\n  } catch (error) {\n    console.error(error);\n    maxApi.post(error.response.data);\n  }\n}\n\nmaxApi.addHandler(\"message\", (output) => {\n  runCompletion(output);\n});\n"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"linecount" : 23,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 11.0, 431.0, 578.0, 328.0 ],
									"text" : "const { Configuration, OpenAIApi } = require(\"openai\");\nconst maxApi = require(\"max-api\");\nrequire(\"dotenv\").config();\n\nconst configuration = new Configuration({\n  apiKey: process.env.OPENAI_API_KEY\n});\n\nconst openai = new OpenAIApi(configuration);\n\nasync function runCompletion(prompt) {\n  const completion = await openai.createCompletion({\n    model: \"text-davinci-003\",\n    prompt: prompt,\n    max_tokens: 100,\n  });\n\n  maxApi.outlet(completion.data.choices[0].text);\n}\n\nmaxApi.addHandler(\"message\", (output) => {\n  runCompletion(output);\n});\n"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"linecount" : 29,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 24.0, 5.0, 578.0, 395.0 ],
									"text" : "const { Configuration, OpenAIApi } = require (\"openai\");\nconst maxApi = require('max-api');\nrequire('dotenv').config();\n\n  //const headers = {\n  // 'Authorization': `Bearer ${process.env.OPENAI_SECRET_KEY}`,\n  //};\n\nconst configuration = new Configuration({\n   apiKey: process.env.OPENAI_API_KEY // get an API-Key fron OpenAl, store. In sane folder in env-file\n});\n\nconst openai = new OpenAIApi(configuration);\n\nasync function runCompletion (prompt) {\n    const completion = await openai.createCompletion({\n        model: \"text-davinci-003\",\n        prompt: prompt,\n        max_tokens: 100,\n        // add more properties, like temperature, format etc\n    });\n\n\tmaxApi.outlet(completion.data.choices[0].text);\n}\nrunCompletion();\n\nmaxApi.addHandler('message', (output) => {\n    runCompletion(output);\n});"
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 1687.800010621547699, 45.00000011920929, 67.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p old_code"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 255.0, 16.0, 63.0, 22.0 ],
					"text" : "bottleneck"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1484.800010621547699, 20.00000011920929, 150.0, 20.0 ],
					"text" : "source"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"linecount" : 6,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1484.800010621547699, 45.00000011920929, 189.0, 89.0 ],
					"text" : ";\rmax launchbrowser https://www.youtube.com/watch?v=qbTJgspGcfk&list=PL4mNrdlB97NeanKmZBl-1VQ_sOPnP56Wg&index=9&t=1s"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 393.199999988079071, 51.99999988079071, 57.0, 22.0 ],
					"text" : "tosymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 393.199999988079071, 83.99999988079071, 105.0, 22.0 ],
					"text" : "prepend message"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 42.0, 217.0, 289.0, 49.0 ],
					"text" : "\"\n\nHi there!\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 325.0, 16.0, 45.0, 22.0 ],
					"text" : "openai"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 200.0, 16.0, 45.0, 22.0 ],
					"text" : "dotenv"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 200.0, 60.0, 115.0, 22.0 ],
					"text" : "script npm install $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 108.0, 32.0, 63.0, 22.0 ],
					"text" : "script stop"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 42.0, 32.0, 64.0, 22.0 ],
					"text" : "script start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 42.0, 125.40000057220459, 138.0, 22.0 ],
					"saved_object_attributes" : 					{
						"autostart" : 0,
						"defer" : 0,
						"watch" : 0
					}
,
					"text" : "node.script maxtoGTP.js"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"source" : [ "obj-12", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"order" : 1,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"order" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 1 ],
					"order" : 2,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 1 ],
					"order" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"order" : 1,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"source" : [ "obj-28", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-511", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-409", 0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 1 ],
					"source" : [ "obj-511", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 1 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "fit_jweb_to_bounds.js",
				"bootpath" : "~/Library/Mobile Documents/com~apple~CloudDocs/PROJECTS/ROBOTICS PROJECTS/SONGLINES/Max/Chatbot/code",
				"patcherrelativepath" : "../code",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "max2Deepgram.js",
				"bootpath" : "~/Library/Mobile Documents/com~apple~CloudDocs/PROJECTS/ROBOTICS PROJECTS/SONGLINES/Max/Chatbot/code",
				"patcherrelativepath" : "../code",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "maxtoGTP.js",
				"bootpath" : "~/Library/Mobile Documents/com~apple~CloudDocs/PROJECTS/ROBOTICS PROJECTS/SONGLINES/Max/Chatbot/code",
				"patcherrelativepath" : "../code",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "n4m.monitor.maxpat",
				"bootpath" : "~/Library/Mobile Documents/com~apple~CloudDocs/PROJECTS/ROBOTICS PROJECTS/SONGLINES/Max/Chatbot/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "resize_n4m_monitor_patcher.js",
				"bootpath" : "~/Library/Mobile Documents/com~apple~CloudDocs/PROJECTS/ROBOTICS PROJECTS/SONGLINES/Max/Chatbot/code",
				"patcherrelativepath" : "../code",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "shell.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
