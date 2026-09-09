/*
    SPDX-FileCopyrightText: 2026 David (davidwkr)
    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick
import QtQuick.Layouts

import org.kde.plasma.components as PlasmaComponents3
import org.kde.kirigami as Kirigami

PlasmaComponents3.ItemDelegate {
    id: root

    required property string watts
    required property string volts
    required property string amps
    required property string protocol
    required property string dockName
    required property string dockAuthorized
    required property string thunderboltLink
    required property string pdRevision
    required property string powerRole

    background.visible: highlighted
    highlighted: activeFocus
    hoverEnabled: false
    text: root.dockName || i18n("USB-C Power Delivery")

    contentItem: RowLayout {
        spacing: Kirigami.Units.gridUnit

        Kirigami.Icon {
            Layout.alignment: Qt.AlignTop
            Layout.preferredWidth: Kirigami.Units.iconSizes.medium
            Layout.preferredHeight: Kirigami.Units.iconSizes.medium
            source: "battery-charging-symbolic"
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 0

            RowLayout {
                spacing: Kirigami.Units.smallSpacing

                PlasmaComponents3.Label {
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    text: root.text
                    textFormat: Text.PlainText
                }

                PlasmaComponents3.Label {
                    visible: root.dockName.length > 0
                    text: root.dockAuthorized === "1" ? i18n("Authorized")
                        : root.dockAuthorized === "0" ? i18n("Not authorized")
                        : i18n("Authorization unknown")
                    textFormat: Text.PlainText
                }
            }

            GridLayout {
                Layout.fillWidth: true
                Layout.topMargin: Kirigami.Units.smallSpacing
                columns: 2
                columnSpacing: Kirigami.Units.smallSpacing
                rowSpacing: 0

                PlasmaComponents3.Label {
                    Layout.fillWidth: true
                    font: Kirigami.Theme.smallFont
                    opacity: 0.75
                    text: i18n("Thunderbolt link:")
                    visible: root.dockName.length > 0
                    textFormat: Text.PlainText
                }
                PlasmaComponents3.Label {
                    Layout.alignment: Qt.AlignRight
                    font: Kirigami.Theme.smallFont
                    opacity: 0.75
                    text: root.thunderboltLink || i18n("Unavailable")
                    visible: root.dockName.length > 0
                    textFormat: Text.PlainText
                }

                PlasmaComponents3.Label {
                    Layout.fillWidth: true
                    font: Kirigami.Theme.smallFont
                    opacity: 0.75
                    text: i18n("Charging port:")
                    textFormat: Text.PlainText
                }
                PlasmaComponents3.Label {
                    Layout.alignment: Qt.AlignRight
                    font: Kirigami.Theme.smallFont
                    opacity: 0.75
                    text: root.pdRevision
                        ? i18nc("USB Power Delivery revision and role", "PD %1 · %2", root.pdRevision, root.powerRole)
                        : i18n("Unavailable")
                    textFormat: Text.PlainText
                }

                PlasmaComponents3.Label {
                    Layout.fillWidth: true
                    font: Kirigami.Theme.smallFont
                    opacity: 0.75
                    text: i18n("USB-C power:")
                    textFormat: Text.PlainText
                }
                PlasmaComponents3.Label {
                    Layout.alignment: Qt.AlignRight
                    font: Kirigami.Theme.smallFont
                    opacity: 0.75
                    text: root.watts
                        ? i18nc("USB voltage, current, and wattage", "%1 V · %2 A · %3 W", root.volts, root.amps, root.watts)
                        : i18n("Telemetry unavailable")
                    textFormat: Text.PlainText
                }
            }
        }
    }
}
