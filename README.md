# Power & Battery with USB-C

Copyright © 2026 David (davidwkr) for the USB-C additions and original
supporting code. Upstream KDE code remains copyright its respective authors.
File-level SPDX notices specify the applicable licenses; license texts are
included in `LICENSES/`.

Developed with AI assistance.

A local copy of KDE PowerDevil 6.7.4's Power & Battery applet with USB-C
Power Delivery and Thunderbolt information added to the stock interface.
Original KDE authorship and SPDX license notices are retained in the sources.

The applet retains power profiles, battery details, and sleep-inhibition
controls. Charger voltage, current and calculated contract wattage are read
from Linux power_supply sysfs; these values are not real-time wall-power
measurements. Dock authorization and link information come from Thunderbolt
sysfs. Dock-only fields are hidden for standalone USB-C chargers.

## Installation and limitations

This is currently a personal Plasma 6.7 installation, not a portable package.
Copy `plasmoid/` to the user plasmoid directory as
`local.powerandbattery.usbpd`, and install `scripts/read-usb-pd-status` as an
executable helper. The helper path in `contents/ui/main.qml` currently points
to `/home/blackbox/.local/bin/read-usb-pd-status`; adjust it for another user.
Reload Plasma and add **Power & Battery with USB-C**.

The applet uses installed KDE private battery APIs and plasma5support.
Compatibility with other Plasma versions is not established. The reader
currently selects the first Thunderbolt device and first online UCSI supply;
multiple-dock/charger association is not supported. Unavailable UCSI telemetry
is not proof that a charger is disconnected.

Source base: https://invent.kde.org/plasma/powerdevil/-/tree/v6.7.4/applets/batterymonitor
