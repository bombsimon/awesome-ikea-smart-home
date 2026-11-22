# Awesome IKEA Home Smart [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

A curated list of libraries, integrations, tools and hacks for IKEA Home
smart, the IKEA smart home ecosystem: the classic **TRÅDFRI gateway**, the
**DIRIGERA hub** and the Zigbee and Matter devices that work with them.

> [!TIP]
> **Building something for DIRIGERA?** There are many independent
> re-implementations of the DIRIGERA client below, each covering a different
> part of the API. **dirigera-openapi** describes the REST API with an
> [OpenAPI spec](https://github.com/bombsimon/dirigera-openapi/blob/main/openapi.yaml)
> and the WebSocket events with an
> [AsyncAPI spec](https://github.com/bombsimon/dirigera-openapi/blob/main/asyncapi.yaml).
> Consider generating your client from the spec instead of writing yet another
> one by hand, and if you find endpoints, fields or events that are missing,
> contribute them back to the spec so every generated client benefits.

IKEA has two generations of hubs. The **TRÅDFRI gateway** (E1526) talks CoAP
over DTLS on port 5684. The **DIRIGERA hub** (2022) has a local REST and
WebSocket API on port 8443, plus Matter and Thread support. Most devices are
plain Zigbee and also work without any IKEA hub.

Projects marked 📦 are archived or no longer maintained but kept for reference.

## Contents

- [DIRIGERA](#dirigera)
  - [DIRIGERA client libraries](#dirigera-client-libraries)
  - [DIRIGERA CLI and TUI](#dirigera-cli-and-tui)
  - [DIRIGERA home automation integrations](#dirigera-home-automation-integrations)
  - [DIRIGERA apps and dashboards](#dirigera-apps-and-dashboards)
  - [DIRIGERA MQTT bridges](#dirigera-mqtt-bridges)
  - [DIRIGERA monitoring and metrics](#dirigera-monitoring-and-metrics)
  - [DIRIGERA creative and lighting effects](#dirigera-creative-and-lighting-effects)
  - [DIRIGERA documentation and reverse engineering](#dirigera-documentation-and-reverse-engineering)
- [TRÅDFRI gateway](#trådfri-gateway)
  - [TRÅDFRI client libraries](#trådfri-client-libraries)
  - [TRÅDFRI CLI tools](#trådfri-cli-tools)
  - [TRÅDFRI home automation integrations](#trådfri-home-automation-integrations)
  - [TRÅDFRI MQTT and REST bridges](#trådfri-mqtt-and-rest-bridges)
  - [TRÅDFRI apps and dashboards](#trådfri-apps-and-dashboards)
  - [TRÅDFRI monitoring and metrics](#trådfri-monitoring-and-metrics)
  - [TRÅDFRI voice assistants and automation](#trådfri-voice-assistants-and-automation)
  - [TRÅDFRI creative and fun](#trådfri-creative-and-fun)
  - [TRÅDFRI documentation](#trådfri-documentation)
- [Zigbee without an IKEA hub](#zigbee-without-an-ikea-hub)
- [Matter devices](#matter-devices)
- [Device specific](#device-specific)
  - [STARKVIND air purifier](#starkvind-air-purifier)
  - [Remotes and buttons](#remotes-and-buttons)
- [Hardware hacking and custom firmware](#hardware-hacking-and-custom-firmware)
  - [FYRTUR / KADRILJ blinds](#fyrtur--kadrilj-blinds)
  - [VINDSTYRKA air quality sensor](#vindstyrka-air-quality-sensor)
  - [Air purifiers](#air-purifiers)
- [Related lists](#related-lists)

## DIRIGERA

### DIRIGERA client libraries

#### Python

- [Leggin/dirigera](https://github.com/Leggin/dirigera) - Unofficial Python client for the DIRIGERA hub, the most widely used one. Available on PyPI as `dirigera`.
- [mattias73andersson/dirigera-client-poc](https://github.com/mattias73andersson/dirigera-client-poc) - Simple proof of concept client, useful for understanding the auth flow.

#### JavaScript / TypeScript

- [lpgera/dirigera](https://github.com/lpgera/dirigera) - TypeScript client library. Available on npm as `dirigera`.
- [zinen/node-dirigera-promise](https://github.com/zinen/node-dirigera-promise) - Promise based Node.js module for the hub.
- [kaliberjs/ikea-dirigera](https://github.com/kaliberjs/ikea-dirigera) - Tools to work with the hub's device endpoints. 📦

#### Rust

- [bombsimon/dirigera-rs](https://github.com/bombsimon/dirigera-rs) - Manage your DIRIGERA from Rust. Available on crates.io as `dirigera`.
- [thembo-sec/dirigera_client](https://github.com/thembo-sec/dirigera_client) - Rust client that includes an early partial OpenAPI 3.0 spec.

#### Go

- [salex-org/ikea-dirigera-client](https://github.com/salex-org/ikea-dirigera-client) - Client library and CLI.
- [bentelel/gorigera](https://github.com/bentelel/gorigera) - Port of the Python library to Go.

#### Java / .NET

- [dvdgeisler/DirigeraClient](https://github.com/dvdgeisler/DirigeraClient) - Java client API.
- [hagronnestad/dirigera](https://github.com/hagronnestad/dirigera) - C# .NET library.

#### C++

- [Piotr-Brzeski/home-controller](https://github.com/Piotr-Brzeski/home-controller) - Smart home controller for both TRÅDFRI and DIRIGERA gateways.

#### Ruby

- [phillipp/dirigera](https://github.com/phillipp/dirigera) - Ruby client covering pairing and device endpoints.

### DIRIGERA CLI and TUI

- [vibec0re/vibectl](https://github.com/vibec0re/vibectl) - Async Rust control with WebSocket events and CLI, TUI, web and GTK clients.
- [lednifrolg/dirigent](https://github.com/lednifrolg/dirigent) - Terminal client in Rust over the local API.
- [bombsimon/dirigera-tui](https://github.com/bombsimon/dirigera-tui) - TUI for rooms, groups, scenes and devices, built on a client generated from the `dirigera-openapi` spec.
- [EryXInc/dirigera-tui](https://github.com/EryXInc/dirigera-tui) - TUI in Rust.
- [nyanshell/dirigera-ctl](https://github.com/nyanshell/dirigera-ctl) - CLI in Rust.
- [julianStreibel/crib](https://github.com/julianStreibel/crib) - CLI aimed at LLM agents controlling TRÅDFRI, Sonos and Spotify.

### DIRIGERA home automation integrations

#### Home Assistant

> Home Assistant can also add DIRIGERA as a Matter bridge with the built in
> [Matter integration](https://www.home-assistant.io/integrations/matter/).

- [sanjoyg/dirigera_platform](https://github.com/sanjoyg/dirigera_platform) - Custom integration (HACS) built on `Leggin/dirigera`.
- [dickkouwenhoven/Dirigera-Bridge](https://github.com/dickkouwenhoven/Dirigera-Bridge) - Bridge between DIRIGERA and Home Assistant.
- [matthewdavidlloyd/ha-ikea-dirigera](https://github.com/matthewdavidlloyd/ha-ikea-dirigera) - Custom component.
- [josh2893/MatterPinger-HA-Addon](https://github.com/josh2893/MatterPinger-HA-Addon) - Add-on that keeps battery powered IKEA Matter devices online when DIRIGERA is the Thread border router.
- [Ctuna89/ha-connection-map-card](https://github.com/Ctuna89/ha-connection-map-card) - Card that maps how each device reaches HA, including through DIRIGERA.
- [TheMrBooyah/hassio-dirigera-client](https://github.com/TheMrBooyah/hassio-dirigera-client) - Add-on wrapping a DIRIGERA client. 📦

#### Homebridge / HomeKit

- [uboness/homebridge-dirigera](https://github.com/uboness/homebridge-dirigera) - Homebridge plugin.
- [matteovivona/homebridge-dirigera-ng](https://github.com/matteovivona/homebridge-dirigera-ng) - Maintained fork of the plugin above.
- [lifeonmonday/homebridge-dirigera-custom-platform](https://github.com/lifeonmonday/homebridge-dirigera-custom-platform) - Platform for Zigbee devices the official HomeKit bridge doesn't expose.
- [larrrssss/homebridge-dirigera-power-switch](https://github.com/larrrssss/homebridge-dirigera-power-switch) - Virtual switch driven by outlet power consumption.

#### Homey

- [theeuwes-it/homey-dirigera-gateway](https://github.com/theeuwes-it/homey-dirigera-gateway) - Homey app for DIRIGERA.
- [favoretti/net.favoretti.ikea.dirigera](https://github.com/favoretti/net.favoretti.ikea.dirigera) - Homey app for DIRIGERA.

#### Node-RED

- [zinen/node-red-contrib-dirigera](https://github.com/zinen/node-red-contrib-dirigera) - Node-RED node for the hub.
- [xbln/node-red-contrib-dirigera-plus](https://github.com/xbln/node-red-contrib-dirigera-plus) - Nodes for devices, rooms and scenes plus live WebSocket events.

#### Other platforms

- [openHAB DIRIGERA binding](https://www.openhab.org/addons/bindings/dirigera/) - Official openHAB binding, part of [openhab-addons](https://github.com/openhab/openhab-addons/tree/main/bundles/org.openhab.binding.dirigera).
- [weymann/DIRIGERA-OH-Drops](https://github.com/weymann/DIRIGERA-OH-Drops) - Standalone repository for the openHAB DIRIGERA binding.
- [LM1LC3N7/gladys-ikea](https://github.com/LM1LC3N7/gladys-ikea) - Gladys Assistant integration for DIRIGERA and TRÅDFRI.
- [grodansparadis/vscpl2drv-ikea-dirigera](https://github.com/grodansparadis/vscpl2drv-ikea-dirigera) - VSCP level II driver.
- [Mesterkaa/OctoPrint-PSU_Control_IKEA_Dirigera](https://github.com/Mesterkaa/OctoPrint-PSU_Control_IKEA_Dirigera) - OctoPrint PSU Control plugin using a DIRIGERA outlet.
- [KoenradusXLVIII/hermes-skills](https://github.com/KoenradusXLVIII/hermes-skills) - Hermes Agent skills including DIRIGERA lights.

### DIRIGERA apps and dashboards

- [lpgera/dirigera-web](https://github.com/lpgera/dirigera-web) - Progressive Web App for controlling devices.
- [vchlum/smart-home](https://github.com/vchlum/smart-home) - GNOME Shell extension for DIRIGERA, Hue, Home Assistant, Nanoleaf and Shelly.
- [bxt/dirigenta-ui](https://github.com/bxt/dirigenta-ui) - macOS menu bar app.
- [FyeroSystems/STROM-Windows](https://github.com/FyeroSystems/STROM-Windows) - WinUI 3 app for Windows.
- [0xtosh/denkigera](https://github.com/0xtosh/denkigera) - Web UI and proxy server.
- [0xtosh/helios](https://github.com/0xtosh/helios) - Realtime web control for lights, blinds, remotes and scenes.
- [0x6d64/dirigera-qt-dashboard](https://github.com/0x6d64/dirigera-qt-dashboard) - PyQt dashboard.
- [polidisio/HomeDashboard](https://github.com/polidisio/HomeDashboard) - Web dashboard.
- [DanielShifman/IKEA-IoT-Interface](https://github.com/DanielShifman/IKEA-IoT-Interface) - Cross platform GUI and CLI.
- [elmarbeckmann/hubdeck](https://github.com/elmarbeckmann/hubdeck) - Control DIRIGERA, Hue and tado from an Elgato Stream Deck.
- [theeuwes-it/dirigera-simple](https://github.com/theeuwes-it/dirigera-simple) - Simple local controller setup tool.
- [michalmielczynski/melon-plugins](https://github.com/michalmielczynski/melon-plugins) - Omarchy plugins including DIRIGERA lights.

### DIRIGERA MQTT bridges

- [jamesbiederbeck/dirigera2mqtt](https://github.com/jamesbiederbeck/dirigera2mqtt) - MQTT bridge with Home Assistant discovery, packaged for Docker.
- [rddl-network/dirigera2mqtt](https://github.com/rddl-network/dirigera2mqtt) - MQTT bridge in Go.
- [sheepherder/dirigera-mqtt-bridge](https://github.com/sheepherder/dirigera-mqtt-bridge) - Read only MQTT bridge for sensors, lights and outlets.
- [lzieniew/dirigera2mqtt](https://github.com/lzieniew/dirigera2mqtt) - Turns scene changes into MQTT messages.

### DIRIGERA monitoring and metrics

- [rtoma/dirigera-prometheus-exporter](https://github.com/rtoma/dirigera-prometheus-exporter) - Prometheus exporter for the hub and attached devices.
- [salex-org/ikea-dirigera-exporter](https://github.com/salex-org/ikea-dirigera-exporter) - Prometheus exporter in Go.
- [Yornik/dirigera-exporter](https://github.com/Yornik/dirigera-exporter) - Prometheus exporter for air quality sensors, STARKVIND, lights and more.
- [Yornik/dirigera-grafana-dashboard](https://github.com/Yornik/dirigera-grafana-dashboard) - Grafana dashboard for the exporter above.
- [makssly/ikea-exporter](https://github.com/makssly/ikea-exporter) - Prometheus exporter.
- [ajabep/dirigera-prometheus](https://github.com/ajabep/dirigera-prometheus) - Prometheus endpoint.
- [free-kittens/dirigera-exporter](https://github.com/free-kittens/dirigera-exporter) - Dockerized metrics collector.
- [milbub/dirigera-sensor-collector](https://github.com/milbub/dirigera-sensor-collector) - Stores sensor data in InfluxDB.
- [harveysandiego/dirigera-air-sensor-dashboard](https://github.com/harveysandiego/dirigera-air-sensor-dashboard) - Web page for VINDSTYRKA air quality readings.
- [wayju/dirigera-monitor](https://github.com/wayju/dirigera-monitor) - Realtime power consumption dashboard for smart plugs.
- [straz/observe_ikea](https://github.com/straz/observe_ikea) - Records and observes sensor data.
- [sjcjonker/check-smart-hub](https://github.com/sjcjonker/check-smart-hub) - Nagios plugin for DIRIGERA, Hue and Somfy TaHoma.

### DIRIGERA creative and lighting effects

- [maceq687/dirigera-max](https://github.com/maceq687/dirigera-max) - Max/MSP package for controlling lights.
- [mwhesse/dirigera-moodz](https://github.com/mwhesse/dirigera-moodz) - Dynamic lighting experiences app.
- [Chafficui/AmbiSync](https://github.com/Chafficui/AmbiSync) - Ambient screen color sync for Hue and DIRIGERA.
- [Flaimeur/Lueur](https://github.com/Flaimeur/Lueur) - Windows app combining DIRIGERA lights with OpenRGB.
- [domjancik/dirigera-readaptive](https://github.com/domjancik/dirigera-readaptive) - Adaptive lighting recovery and seasonal schedule updater.
- [shinzlet/lighting](https://github.com/shinzlet/lighting) - Animates lights from a list of keypoints.
- [JustJoostNL/F1MV-Lights-Integration](https://github.com/JustJoostNL/F1MV-Lights-Integration) - Syncs smart lights, DIRIGERA and TRÅDFRI included, with F1 MultiViewer.
- [shuuryou/sunrise](https://github.com/shuuryou/sunrise) - Sunrise simulation for DIRIGERA and TRÅDFRI bulbs. 📦
- [TobiasDeBruijn/dirigera-disco](https://github.com/TobiasDeBruijn/dirigera-disco) - Disco effects through the hub. 📦

### DIRIGERA documentation and reverse engineering

- [bombsimon/dirigera-openapi](https://github.com/bombsimon/dirigera-openapi) - OpenAPI spec for the local REST API and AsyncAPI spec for the WebSocket events, with [browsable docs](https://bombsimon.github.io/dirigera-openapi/).
- [ikea-oss-distributions/DIRIGERA-hub](https://github.com/ikea-oss-distributions/DIRIGERA-hub) - IKEA's official open source distribution for the hub firmware.
- [wjtje/DIRIGERA](https://github.com/wjtje/DIRIGERA) - General information about the hub and its API.
- [Sikerdebaard/dirigera-fw](https://github.com/Sikerdebaard/dirigera-fw) - Firmware reverse engineering.

## TRÅDFRI gateway

### TRÅDFRI client libraries

#### Python

- [home-assistant-libs/pytradfri](https://github.com/home-assistant-libs/pytradfri) - The reference Python library, sans-io and used by Home Assistant.
- [moroen/tradfricoap](https://github.com/moroen/tradfricoap) - Module and CLI utility.
- [hvanderlaan/ikea-smartlight](https://github.com/hvanderlaan/ikea-smartlight) - Python framework for controlling the lights.

#### JavaScript / TypeScript

- [AlCalzone/node-tradfri-client](https://github.com/AlCalzone/node-tradfri-client) - Talks to the gateway without external binaries, the most complete JS library.
- [morzzz007/node-tradfri](https://github.com/morzzz007/node-tradfri) - Node API for the lights.
- [treban/tradfri-coapdtls](https://github.com/treban/tradfri-coapdtls) - CoAP+DTLS interface.
- [CliffS/ikea-tradfri](https://github.com/CliffS/ikea-tradfri) - Library without a separate binary. 📦

#### Go

- [eriklupander/tradfri-go](https://github.com/eriklupander/tradfri-go) - Go client for the gateway.
- [zegl/go-tradfri](https://github.com/zegl/go-tradfri) - Go SDK.
- [barnybug/go-tradfri](https://github.com/barnybug/go-tradfri) - Library and CLI.
- [hemtjanst/sladdlos](https://github.com/hemtjanst/sladdlos) - Go library. 📦

#### Rust

- [tirithen/tradfri_gateway](https://github.com/tirithen/tradfri_gateway) - Crate for connecting to the gateway.
- [Mik-pe/glimta](https://github.com/Mik-pe/glimta) - Local first Rust client.

#### Java / Kotlin

- [StijnGroenen/ikea-tradfri-api](https://github.com/StijnGroenen/ikea-tradfri-api) - Java library. 📦
- [peterkappelt/JTradfri](https://github.com/peterkappelt/JTradfri) - General purpose Java client. 📦

#### .NET

- [dominicusmento/CSharpTradFriLibrary](https://github.com/dominicusmento/CSharpTradFriLibrary) - .NET Standard 2.0 library.
- [chkr1011/CoAPnet](https://github.com/chkr1011/CoAPnet) - CoAP client and server with DTLS, works with the gateway.

#### Other languages

- [tomstuart/tradfri](https://github.com/tomstuart/tradfri) - Ruby interface.
- [PMunch/ikeahomesmart](https://github.com/PMunch/ikeahomesmart) - Nim library.
- [WebProject-xyz/ikea-tradfri-php](https://github.com/WebProject-xyz/ikea-tradfri-php) - PHP library wrapping `coap-client`.
- [Piotr-Brzeski/cpp-tradfri](https://github.com/Piotr-Brzeski/cpp-tradfri) - C++ library.
- [Friedmonkey/fried-coaps-client-esp-idf-esp32-CYD-](https://github.com/Friedmonkey/fried-coaps-client-esp-idf-esp32-CYD-) - CoAPS/DTLS client for ESP32 (ESP-IDF).

### TRÅDFRI CLI tools

- [moroen/ikea-tradfri](https://github.com/moroen/ikea-tradfri) - Python command line tool.
- [peterbourgon/lightctl](https://github.com/peterbourgon/lightctl) - Control program in Go.
- [wschenk/tradfri-cli](https://github.com/wschenk/tradfri-cli) - TypeScript CLI scripts.
- [scruss/ihsctrl](https://github.com/scruss/ihsctrl) - Bash scripts for the gateway.
- [jeppevinkel/TradfriCLI](https://github.com/jeppevinkel/TradfriCLI) - C# CLI.

### TRÅDFRI home automation integrations

#### Home Assistant

- [Home Assistant IKEA TRÅDFRI](https://www.home-assistant.io/integrations/tradfri/) - Built in integration, powered by `pytradfri`.
- [chkuendig/hass-tradfri-beta](https://github.com/chkuendig/hass-tradfri-beta) - Custom integration adding gateway admin (pairing, naming, groups) without the IKEA app.

#### Homebridge / HomeKit

- [meg768/homebridge-ikea-tradfri-gateway](https://github.com/meg768/homebridge-ikea-tradfri-gateway) - Homebridge plugin.
- [szokeptr/homebridge-tradfri-plugin](https://github.com/szokeptr/homebridge-tradfri-plugin) - Homebridge plugin.

#### ioBroker, openHAB, Domoticz and friends

- [AlCalzone/ioBroker.tradfri](https://github.com/AlCalzone/ioBroker.tradfri) - ioBroker adapter.
- [openHAB TRÅDFRI binding](https://www.openhab.org/addons/bindings/tradfri/) - Official openHAB binding.
- [moroen/IKEA-Tradfri-plugin](https://github.com/moroen/IKEA-Tradfri-plugin) - Domoticz plugin.
- [rogierhofboer/com.ikea.tradfri.gateway](https://github.com/rogierhofboer/com.ikea.tradfri.gateway) - Homey app.
- [peterkappelt/Tradfri-FHEM](https://github.com/peterkappelt/Tradfri-FHEM) - FHEM module. 📦
- [treban/pimatic-tradfri](https://github.com/treban/pimatic-tradfri) - Plugin for pimatic. 📦
- [vwout/vera-tradfri](https://github.com/vwout/vera-tradfri) - Vera plugin.
- [Joey-1970/IPS2Tradfri](https://github.com/Joey-1970/IPS2Tradfri) - IP-Symcon module.
- [ffleurey/ThingML-Tradfri](https://github.com/ffleurey/ThingML-Tradfri) - ThingML interface.
- [iot-edge-foundation/iot-edge-tradfri](https://github.com/iot-edge-foundation/iot-edge-tradfri) - Azure IoT Edge module.
- [ralmn/OctoPrint-Ikea-tradfri](https://github.com/ralmn/OctoPrint-Ikea-tradfri) - Control a TRÅDFRI outlet from OctoPrint. 📦

#### Node-RED

- [freahs/node-red-contrib-node-tradfri](https://github.com/freahs/node-red-contrib-node-tradfri) - Node-RED node in pure Node.js.
- [mjwwit/node-red-contrib-ikea-tradfri](https://github.com/mjwwit/node-red-contrib-ikea-tradfri) - Node-RED nodes for gateway devices. 📦
- [nidayand/node-red-contrib-tradfri](https://github.com/nidayand/node-red-contrib-tradfri) - Node-RED node. 📦

#### SmartThings and Hubitat

- [edvaldeysteinsson/IKEA-Tradfri](https://github.com/edvaldeysteinsson/IKEA-Tradfri) - SmartThings device type handler.
- [puzzle-star/SmartThings-IKEA-Tradfri-RGB](https://github.com/puzzle-star/SmartThings-IKEA-Tradfri-RGB) - SmartThings handler for RGB bulbs. 📦
- [kaandrews/SmartThings_Tradfri_Dimmer](https://github.com/kaandrews/SmartThings_Tradfri_Dimmer) - SmartThings handler for the dimmer.
- [joelwetzel/Hubitat-IKEA-Tradfri](https://github.com/joelwetzel/Hubitat-IKEA-Tradfri) - Hubitat driver for the dimmer puck.
- [eliotstocker/hubitat-ikea-rgbw](https://github.com/eliotstocker/hubitat-ikea-rgbw) - Hubitat RGBW driver.
- [a4refillpad/hubitat-IKEA-window-blinds](https://github.com/a4refillpad/hubitat-IKEA-window-blinds) - Hubitat driver for blinds.

### TRÅDFRI MQTT and REST bridges

- [hardillb/TRADFRI2MQTT](https://github.com/hardillb/TRADFRI2MQTT) - MQTT bridge in Java.
- [hemtjanst/tradfri-mqtt](https://github.com/hemtjanst/tradfri-mqtt) - Mirrors gateway endpoints into MQTT. 📦
- [davea/tradfri-mqtt](https://github.com/davea/tradfri-mqtt) - Python MQTT bridge.
- [softypit/tradfrimqtt_c](https://github.com/softypit/tradfrimqtt_c) - CoAP to MQTT daemon in C.
- [fjaderboll/pytradfri-rest](https://github.com/fjaderboll/pytradfri-rest) - REST API on top of `pytradfri`.
- [mftw/ikea-tradfri-node-rest-api](https://github.com/mftw/ikea-tradfri-node-rest-api) - REST API in Node.js.
- [MiniMeOSc/phpTradfri](https://github.com/MiniMeOSc/phpTradfri) - HTTP JSON API in PHP.
- [tonyredondo/TradfriApi](https://github.com/tonyredondo/TradfriApi) - ASP.NET Core API.

### TRÅDFRI apps and dashboards

- [fvanwijk/tradfri-app](https://github.com/fvanwijk/tradfri-app) - PWA for browser and phone.
- [sipe90/tradfri-control-panel](https://github.com/sipe90/tradfri-control-panel) - Web app for managing devices.
- [hagronnestad/streamdeck-tradfri](https://github.com/hagronnestad/streamdeck-tradfri) - Elgato Stream Deck plugin.
- [yannregev/CoAP-Tradfri](https://github.com/yannregev/CoAP-Tradfri) - Windows app.
- [dunkelstern/tradfri_gui](https://github.com/dunkelstern/tradfri_gui) - PySide2 GUI.
- [jonasbb/tradfri-indicator](https://github.com/jonasbb/tradfri-indicator) - Linux AppIndicator for scenes and rooms. 📦
- [thburghout/mmm-ikea-home-smart](https://github.com/thburghout/mmm-ikea-home-smart) - MagicMirror module. 📦
- [HasseJohansen/roon-extension-ikea-tradfri](https://github.com/HasseJohansen/roon-extension-ikea-tradfri) - Roon extension.

### TRÅDFRI monitoring and metrics

- [zegl/ikea_tradfri_exporter](https://github.com/zegl/ikea_tradfri_exporter) - Prometheus exporter in Go.
- [oleksiikutuzov/tradfri-exporter](https://github.com/oleksiikutuzov/tradfri-exporter) - Prometheus exporter in Python.
- [Henkru/tradfri-telegraf](https://github.com/Henkru/tradfri-telegraf) - Telegraf input.

### TRÅDFRI voice assistants and automation

- [valenting/node_tradfri_ifttt](https://github.com/valenting/node_tradfri_ifttt) - IFTTT backend.
- [jfedor2/ikea-tradfri-google-assistant](https://github.com/jfedor2/ikea-tradfri-google-assistant) - Google Assistant support.
- [Blubbaa/ikea-tradfri-skill](https://github.com/Blubbaa/ikea-tradfri-skill) - Mycroft voice skill.
- [KerberosClaw/kc_tradfri_mcp](https://github.com/KerberosClaw/kc_tradfri_mcp) - MCP server for LLM control over CoAP.
- [bgromov/tradfri_ros](https://github.com/bgromov/tradfri_ros) - ROS interface.
- [AndreiFAD/Tradfri-Ikea-Gateway-auto-reboot](https://github.com/AndreiFAD/Tradfri-Ikea-Gateway-auto-reboot) - Daily gateway reboot with `aiocoap`.

### TRÅDFRI creative and fun

- [gobo-ws/ola-trigger-ikea-tradfri-dmx](https://github.com/gobo-ws/ola-trigger-ikea-tradfri-dmx) - Control lights and outlets over DMX (Art-Net, sACN) with OLA.
- [wokhouse/tradfri-flux](https://github.com/wokhouse/tradfri-flux) - Color temperature adjustments in the style of f.lux adjustments. 📦
- [mrpjevans/tradfri-fun](https://github.com/mrpjevans/tradfri-fun) - Code from The MagPi issue 76.
- [wimvdc/Tradfri_AR](https://github.com/wimvdc/Tradfri_AR) - Control lights with web based augmented reality. 📦
- [frklan/LightMaker](https://github.com/frklan/LightMaker) - Control lights from Minecraft.

### TRÅDFRI documentation

- [glenndehaan/ikea-tradfri-coap-docs](https://github.com/glenndehaan/ikea-tradfri-coap-docs) - How to talk to the gateway with `coap-client`. The go-to protocol reference.
- [Jan21493/Debugging-COAPS-with-IKEA-Tradfri-gateway](https://github.com/Jan21493/Debugging-COAPS-with-IKEA-Tradfri-gateway) - Debugging CoAPS traffic.
- [matemaciek/tradslator](https://github.com/matemaciek/tradslator) - Helper for debugging the API.

## Zigbee without an IKEA hub

TRÅDFRI devices are standard Zigbee and can be paired directly with a USB
coordinator.

- [Koenkk/zigbee2mqtt](https://github.com/Koenkk/zigbee2mqtt) - Zigbee to MQTT bridge with extensive IKEA support.
- [Koenkk/zigbee-herdsman-converters](https://github.com/Koenkk/zigbee-herdsman-converters) - Device definitions used by Zigbee2MQTT, including all IKEA devices.
- [zigpy/zha-device-handlers](https://github.com/zigpy/zha-device-handlers) - ZHA quirks for Home Assistant, with many IKEA specific ones.
- [dresden-elektronik/deconz-rest-plugin](https://github.com/dresden-elektronik/deconz-rest-plugin) - deCONZ REST API for Phoscon/ConBee.
- [Koenkk/zigbee-OTA](https://github.com/Koenkk/zigbee-OTA) - Collection of Zigbee OTA firmware files, IKEA included.
- [mariusmotea/diyHue](https://github.com/mariusmotea/diyHue) - Philips Hue emulator that can drive TRÅDFRI bulbs.
- [melihkarakelle/ikea-zigbee-esp32c6](https://github.com/melihkarakelle/ikea-zigbee-esp32c6) - Control TRÅDFRI lights from a XIAO ESP32-C6 without gateway or cloud.
- [hansipete/esp32-c6-ikea-tradfri-controller](https://github.com/hansipete/esp32-c6-ikea-tradfri-controller) - Control TRÅDFRI bulbs from an ESP32-C6.
- [depau/ikea-light-fixer](https://github.com/depau/ikea-light-fixer) - Fixes brightness levels of TRÅDFRI lights.
- [oyvindre/tradfri-hue-workaround](https://github.com/oyvindre/tradfri-hue-workaround) - Fixes brightness issues for TRÅDFRI lights on a Hue Bridge.
- [smartHomeHub/deMotez](https://github.com/smartHomeHub/deMotez) - Simplifies using TRÅDFRI and Hue remotes from deCONZ in Home Assistant.
- [duffbeer2000/deconz_fw_downloader](https://github.com/duffbeer2000/deconz_fw_downloader) - Downloads TRÅDFRI firmware updates for deCONZ.
- [Dirnei/ikea_bulb_reset](https://github.com/Dirnei/ikea_bulb_reset) - Sonoff S20 firmware that power cycles a bulb into reset.
- [itsmepetrov/homebridge-zigbee](https://github.com/itsmepetrov/homebridge-zigbee) - Zigbee platform for Homebridge.
- [hobbyquaker/node-red-contrib-zigbee](https://github.com/hobbyquaker/node-red-contrib-zigbee) - Node-RED Zigbee nodes. 📦

## Matter devices

The newer generation of IKEA remotes and sensors (BILRESA, MYGGSPRAY, KAJPLATS
and friends) use Matter over Thread.

- [Vituhlos/ha-ikea-bilresa](https://github.com/Vituhlos/ha-ikea-bilresa) - Smooth BILRESA scroll wheel dimming in Home Assistant over Matter.
- [CaelanBorowiec/ha-bilresa-updater](https://github.com/CaelanBorowiec/ha-bilresa-updater) - Keeps BILRESA remotes awake during firmware updates.
- [fangathome/ikea_bilresa_scrollwheel](https://github.com/fangathome/ikea_bilresa_scrollwheel) - Blueprint for the BILRESA center button.
- [odggg/osazee-bilresa](https://github.com/odggg/osazee-bilresa) - BILRESA blueprint with gestures, multi clicks and dimming.
- [bradbowles/home-assistant-bilresa-blueprint](https://github.com/bradbowles/home-assistant-bilresa-blueprint) - BILRESA blueprint with robust entity detection.
- [SoccerCore11/Bilresa-Tap-Sequences](https://github.com/SoccerCore11/Bilresa-Tap-Sequences) - Blueprint for BILRESA tap sequences.
- [sf6472/HomeAssistant-ikea-E1766-Switch-Dirigera-Matter-Trigger](https://github.com/sf6472/HomeAssistant-ikea-E1766-Switch-Dirigera-Matter-Trigger) - Use a TRÅDFRI E1766 switch through DIRIGERA Matter as an HA trigger.

## Device specific

### STARKVIND air purifier

- [hakaneriksson/air-purifier-card](https://github.com/hakaneriksson/air-purifier-card) - Lovelace card for STARKVIND.
- [jayjojayson/blueprint-auto-luftreiniger](https://github.com/jayjojayson/blueprint-auto-luftreiniger) - Blueprint turning STARKVIND off based on air quality.

### Remotes and buttons

- [nomis/ikea-tradfri-e1812](https://github.com/nomis/ikea-tradfri-e1812) - Unofficial documentation for the TRÅDFRI shortcut button (E1812).
- [haberda/tradfri_remotes](https://github.com/haberda/tradfri_remotes) - AppDaemon app for TRÅDFRI remotes. 📦
- [lorenzspenger/IKEA-SOMRIG-template](https://github.com/lorenzspenger/IKEA-SOMRIG-template) - Template for the SOMRIG shortcut button.
- [kristianwiklund/zigbee2soco](https://github.com/kristianwiklund/zigbee2soco) - Connect a SYMFONISK controller to Sonos via Zigbee2MQTT.
- [racksync/node-red-contrib-hass-tradfri-remote](https://github.com/racksync/node-red-contrib-hass-tradfri-remote) - Node-RED node for TRÅDFRI remotes in Home Assistant.

## Hardware hacking and custom firmware

- [basilfx/TRADFRI-Hacking](https://github.com/basilfx/TRADFRI-Hacking) - Hacking TRÅDFRI bulbs, blinds and accessories. The starting point for hardware work.
- [MattWestb/IKEA-TRADFRI-ICC-A-1-Module](https://github.com/MattWestb/IKEA-TRADFRI-ICC-A-1-Module) - Loading EZSP onto the ICC-A-1 module to turn it into a coordinator.
- [agendek78/mg1_repeater](https://github.com/agendek78/mg1_repeater) - Custom firmware for the TRÅDFRI signal repeater.
- [marciopocebon/MG21DOOM](https://github.com/marciopocebon/MG21DOOM) - DOOM on a TRÅDFRI RGB bulb (EFR32MG21).
- [efuturetoday/ikea-tradfri](https://github.com/efuturetoday/ikea-tradfri) - Development board and docs for TRÅDFRI Zigbee modules.
- [mikeshackspace/IkeaTradfriTeardown](https://github.com/mikeshackspace/IkeaTradfriTeardown) - Teardown of TRÅDFRI hardware.
- [rralf/tradcrash](https://github.com/rralf/tradcrash) - mDNS DoS proof of concept for the gateway.

### FYRTUR / KADRILJ blinds

- [mjuhanne/fyrtur-motor-board](https://github.com/mjuhanne/fyrtur-motor-board) - Custom firmware for the STM32 based FYRTUR motor board.
- [mjuhanne/fyrtur-esp](https://github.com/mjuhanne/fyrtur-esp) - ESP32 and ESP8266 based FYRTUR controller.
- [mjuhanne/ikea-fyrtur](https://github.com/mjuhanne/ikea-fyrtur) - ESP8266 WiFi module PCB for FYRTUR.
- [daanvdl/fyrtur-motor-board-pcb](https://github.com/daanvdl/fyrtur-motor-board-pcb) - Drop in replica of the FYRTUR motor board.

### VINDSTYRKA air quality sensor

- [oleksiikutuzov/IKEA-VINDSTYRKA](https://github.com/oleksiikutuzov/IKEA-VINDSTYRKA) - Findings about the sensor.
- [just-oblivious/vindstyrka-docs](https://github.com/just-oblivious/vindstyrka-docs) - Notes on the sensor implementation.
- [andibaciu/ESPeasy-plugin-for-IKEA-VINDSTYRKA](https://github.com/andibaciu/ESPeasy-plugin-for-IKEA-VINDSTYRKA) - ESPEasy plugin.
- [edholmes2232/Vindstryka-LCD](https://github.com/edholmes2232/Vindstryka-LCD) - Driver for the custom segment display.

### Air purifiers

- [horvathgergo/uPurifier](https://github.com/horvathgergo/uPurifier) - ESP8266 PCBs connecting IKEA air purifiers to Home Assistant over MQTT.
- [dgalue/Ikea-Air-Purifier-ESP32-Homespan](https://github.com/dgalue/Ikea-Air-Purifier-ESP32-Homespan) - HomeKit enabled purifier with ESP32 and HomeSpan.

## Related lists

- [hobbyquaker/awesome-zigbee](https://github.com/hobbyquaker/awesome-zigbee) - Curated list of Zigbee related stuff.

## Contributing

Contributions are welcome. Read the [contribution guidelines](contributing.md)
and open a pull request adding the project to the section that fits best.
