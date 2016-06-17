// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0

import "../common"
import "../tabs"

Page {
    id: navPage

    property bool tabBarIsFixed: true
    property var tabButtonModel: [{"name": "Primary"},
        {"name": "Accent"},
        {"name": "Theme"}]

    header: isLandscape? null : tabBar

    Loader {
        id: tabBar
        visible: !isLandscape
        active: !isLandscape
        source: "../tabs/TextTabBar.qml"
        onLoaded: {
            if(item) {
                item.currentIndex = navPane.currentIndex
            }
        }
    }
    Loader {
        id: tabBarFloating
        visible: isLandscape
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        active: isLandscape
        source: "../tabs/TextTabBar.qml"
        onLoaded: {
            if(item) {
                item.currentIndex = navPane.currentIndex
            }
        }
    }

    SwipeView {
        id: navPane
        focus: true
        anchors.top: isLandscape? tabBarFloating.bottom : parent.top
        anchors.topMargin: isLandscape? 6 : 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        currentIndex: 0
        // currentIndex is the NEXT index swiped to
        onCurrentIndexChanged: {
            if(isLandscape) {
                tabBarFloating.item.currentIndex = currentIndex
            } else {
                tabBar.item.currentIndex = currentIndex
            }
        }

        Shortcut {
            sequence: "w"
            onActivated: navPane.goToPage(0)
        }
        Shortcut {
            sequence: "Alt+w"
            onActivated: navPane.goToPage(0)
        }
        Shortcut {
            sequence: "e"
            onActivated: navPane.goToPage(1)
        }
        Shortcut {
            sequence: "Alt+e"
            onActivated: navPane.goToPage(1)
        }
        Shortcut {
            sequence: "r"
            onActivated: navPane.goToPage(2)
        }
        Shortcut {
            sequence: "Alt+r"
            onActivated: navPane.goToPage(2)
        }

        function goToPage(pageIndex) {
            if(pageIndex == navPane.currentIndex) {
                // it's the current page
                return
            }
            if(pageIndex > 4 || pageIndex < 0) {
                return
            }
            navPane.currentIndex = pageIndex
        } // goToPage

        // only 3 Pages - all preloaded to be able to swipe
        Loader {
            // index 0
            id: pageOneLoader
            active: true
            source: "PageOne.qml"
            onLoaded: item.init()
        }
        Loader {
            // index 1
            id: pageTwoLoader
            active: true
            source: "PageTwo.qml"
            onLoaded: item.init()
        }
        Loader {
            // index 2
            id: pageThreeLoader
            active: true
            source: "PageThree.qml"
            onLoaded: item.init()
        }

        function switchPrimaryPalette(paletteIndex) {
            primaryPalette = myApp.primaryPalette(paletteIndex)
        }
        function switchAccentPalette(paletteIndex) {
            accentPalette = myApp.accentPalette(paletteIndex)
        }

    } // navPane

    function init() {
        console.log("INIT NAV PAGE color schema")
    }
    function cleanup() {
        console.log("CLEANUP NAV PAGE color schema")
    }

} // navPage
