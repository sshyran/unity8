/*
 * Copyright (C) 2016 Canonical, Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4
import Ubuntu.Components 1.3

Rectangle {
    width: units.gu(4)
    height: width
    radius: height / 2
    color: theme.palette.normal.background

    // to be set from outside
    property Item resizeTarget
    property alias cursorShape: mouseArea.cursorShape

    Image {
        source: "graphics/arrows.png"
        anchors.centerIn: parent
        width: parent.width / 2
        height: width
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        Mouse.enabled: resizeTarget
        Mouse.forwardTo: resizeTarget
    }
}
