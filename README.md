# LISN-mate
This design a fork of CompuPhase's "LISN mate", suitable for a dual channel LISN. 

The original design was published in Elektor [2021], and is
available from the ["elektorstore"](https://www.elektor.com/elektor-dual-dc-lisn-150-khz-200-mhz)
as a kit.

A LISN lets you test the conducted emissions in power cables. If the emissions
exceed the limit, and you need to adjust the design to reduce the RF noise, the
first thing you will want to know is whether the noise is primarily "common mode"
or "differential mode". The LISN-mate is a tool that tells you that.

There's nothing wrong with the original design, I just had some specific requirements in mind.

![LISN-mate PCB](/pictures/LISN_Mate%20\(Top%20Render.png)
![LISN-mate PCB](/pictures/LISN_Mate%20(Bottom%20Render).png)

When you want a quantitative value for the common mode noise and/or the differential
mode noise (in dB&micro;V), a LISN-mate is actually somewhat complex circuit. 
However, there is just a single limit for conducted emissions in the EMC/EMI standards,
so you do not really need the absolute values. What you need to know, whether the emissions 
are *primarily* either common mode or differential mode. For a LISN-mate that gives you an
answer on that issue, all it takes is a transformer.

The design is in Altium. Gerber files for the PCB are provided as well. The components are:

| Number | Part number          | Manufacturer          | Description                             |
| ------ | -------------------- | --------------------- | --------------------------------------- |
|  1     | ADT1-6T              | Mini-Circuits         | RF Transformer 50 Ohm, 30 kHz - 125 MHz |
|  4     | 60312242114510       | Würth Elektronik      | SMA receptable, edge-mount              |
|  1     | 1457C802EBK          | Hammond Enclosures    | Enclosure, extrusion cut down to fit    |

The enclosure is not the correct length, so you must cut down the extrusion to fit!

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