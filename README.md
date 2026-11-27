# AutoRez

Rainmeter skin that automatically switches the loaded layout based on screen resolution

## Install

Download and install the `.rmskin` from [Releases](https://github.com/alexhool/AutoRez/releases/latest)

## Setup

1. Save every layout with AutoRez loaded
2. Read each screen setup's resolution from Rainmeter's Log (`AutoRez: <width>x<height>`)
3. Open `@Resources\Variables.inc` (Manage Rainmeter → right-click AutoRez → Open folder)
4. Map each resolution to a layout
5. Refresh AutoRez

## Settings

In [`@Resources\Variables.inc`](Skins/AutoRez/@Resources/Variables.inc):

- `Screen`
  - `Main`: main display resolution, for skins on one screen
  - `Combined`: all displays together, for skins across monitors, changes when monitors are rearranged
- `<width>x<height>=<layout name>`: layout for that resolution, others keep the current layout
- `UpdateRate`: check interval in milliseconds, see Rainmeter's [Update](https://docs.rainmeter.net/manual/skins/rainmeter-section/#Update)

## Notes

- Rainmeter's [Log](https://docs.rainmeter.net/manual/user-interface/about/#LogTab) shows the resolution AutoRez reads
- AutoRez only runs in layouts saved with AutoRez loaded
- Resolutions are as Rainmeter reports them, so Windows scaling changes them (2560x1600 at 150% is 1707x1067)

## License

GPL-3.0-or-later
