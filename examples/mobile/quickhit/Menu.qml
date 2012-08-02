/****************************************************************************
**
** Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/
**
** This file is part of the demonstration applications of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.0
import "Game.js" as GameScript


Rectangle {
    id: menu

    Text {
        id: title
        smooth: true
        anchors.bottom: menu.top
        anchors.horizontalCenter: menu.horizontalCenter
        color: "red"
        font.pixelSize:  gameArea.width / 12
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
    }

    border.color: "black"
    border.width: 2
    radius: 8
    smooth: true
    opacity: 0 // transparent by default

    color: "black"
//    gradient: Gradient {
//        GradientStop { position: 0.0; color: "white" }
//        GradientStop { position: 1.0; color: "black" }
//    }

    // Signals
    signal levelSelected(int levelIndex)
    signal resumeSelected()

    // Show level menu
    function showLevelMenu() {
        menuData.clear()
        title.text = "Select Your Level"
        var plugins = GameEngine.pluginList()
        for (var i = 0; i < plugins.length; i++) {
            menuData.append({"name": plugins[i],"type":"0"})
        }
        menuData.append({"name": "About","type":"4"})
        menuData.append({"name": "Exit","type":"1"})
        menu.opacity = 0.8
        listView.focus = true
    }

    function showPauseMenu() {
        menuData.clear()
        title.text = "Resume level?"
        menuData.append({"name": "Resume","type":"2"})
        menuData.append({"name": "End Game","type":"3"})
        menu.opacity = 0.8
        listView.focus = true
    }

    // Hide menu
    function hideMenu() {
        menu.opacity = 0
        listView.focus = false
    }

    function menuItemSelected(index, type) {
        switch (type) {
        case "0": {
                // Level selection
                menu.levelSelected(index)
                break;
            }
        case "1": {
                // Exit
                Qt.quit()
                break;
            }
        case "2": {
                // Resume
                menu.resumeSelected()
                break;
            }
        case "3": {
                // End Game
                gameArea.endGame()
                break;
            }
        case "4": {
                // Show about
                gameArea.messageBox.showInfoMessage()
                break;
            }
        default: {
                break;
            }
        }
    }

    ListModel {
        id: menuData
    }

    ListView {
        id: listView
        clip: true
        anchors.fill: parent
        keyNavigationWraps: true

        function doSelect() {
            menu.menuItemSelected(listView.currentIndex,menuData.get(listView.currentIndex).type)
        }

        model: menuData

        delegate: MenuItem {
            id: menuItem
            selectedItem: menuItem.ListView.isCurrentItem ? true : false
            onItemSelected: {
                listView.currentIndex = model.index
                listView.doSelect()
            }

        }
    }
}
