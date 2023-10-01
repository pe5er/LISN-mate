# LISN-mate
This design is for a "LISN mate", suitable for a dual channel LISN. In particular,
it was designed for the dual DC LISN published in Elektor [2021], and which is
available from the ["elektorstore"](https://www.elektor.com/elektor-dual-dc-lisn-150-khz-200-mhz)
as a kit.

A LISN lets you test the conducted emissions in power cables. If the emissions
exceed the limit, and you need to adjust the design to reduce the RF noise, the
first thing you will want to know is whether the noise is primarily "common mode"
or "differential mode". The LISN-mate is a tool that tells you that.

![LISN-mate PCB](https://github.com/compuphase/LISN-mate/blob/main/pictures/LISN_mate_1.jpg)

When you want a quantitative value for the common mode noise and/or the differential
mode noise, a LISN-mate is actually somewhat involved. However, for the qualitative
answer of whether emissions are *primarily* common more or differential mode, all
it takes is a transformer.

The design is in KiCAD. Gerber files for the PCB are provided as well. The components are:

| Number | Part number | Manufacturer  | Description                             |
| ------ | ----------- | ------------- | --------------------------------------- |
|  1     | ADT1-6T     | Mini-Circuits | RF Transformer 50 Ohm, 30 kHz - 125 MHz |
|  4     | 132289      | Amphenol      | SMA receptable, edge-mount              |
|  1     | 4607        | Adafruit      | Copper foil, 0.1 mm thick               |

Since the case is in plastic, and therefore not shielded, I added a shield from
copper foil. It is soldered onto the SMA connectors.

![LISN-mate PCB](https://github.com/compuphase/LISN-mate/blob/main/pictures/LISN_mate_2.jpg)

The case is 3D printed; an STL file is provided. The design is in OpenSCAD (and
provided as well).

![LISN-mate case](https://github.com/compuphase/LISN-mate/blob/main/pictures/LISN_mate_4.jpg)

## License

The LISN-mate is distributed under the CC BY-NC-SA 4.0 license (Attribution-NonCommercial-ShareAlike 4.0 International).

You are free to:

> **Share** —  copy and redistribute the material in any medium or format <br>
> **Adapt** — remix, transform, and build upon the material <br>
> The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

> **Attribution** - You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.  <br>
> **NonCommercial** - You may not use the material for commercial purposes.  <br>
> **ShareAlike** - If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original. <br>
> **No additional restrictions** - You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

### Acknowledgement

For the 3D printed case, this project uses the [Chamfered primitives for OpenSCAD v1.2](https://github.com/SebiTimeWaster/Chamfers-for-OpenSCAD) by TimeWaster,
which is published under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 licence.

