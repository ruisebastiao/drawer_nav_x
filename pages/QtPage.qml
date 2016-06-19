// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0

import "../common"

Flickable {
    id: flickable
    contentHeight: root.implicitHeight
    // StackView manages this, so please no anchors here
    // anchors.fill: parent
    property string name: "Home"
    property string title: qsTr("Home")

    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                bottomPadding: 16
                text: qsTr("The Qt Page")
            }
            RowLayout {
                IconInactive {
                    imageName: modelData.icon
                    imageSize: 48
                }
                LabelSubheading {
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Going Back to Home Page ?\nTap on the green Arrow to pop() the Page.\nIn a real-live APP the TitleBar should show the BACK Button and also Android BACK Button should be implemented.")
                }
                Item {
                    implicitWidth: 96
                    implicitHeight: 96
                    Image {
                        // scale: Image.PreserveAspectFit
                        anchors.fill: parent
                        // anchors.verticalCenterOffset: -50
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/images/extra/qt-arrow.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            navPane.pop()
                        }
                    } // mouse
                }
            }

            HorizontalDivider {}
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Navigate between Destinations:\n* Tap on a Button from ToolBar at Bottom (Portrait) or left side (Landscape)\n\nTap on 'Settings' Button to configure Navigation\n\nFrom 'Option Menu' (three dots) placed top right in Title you can switch Theme and change primary / accent colors\n\nIn Landscape mode Title is scrollable.\n\nBluetooth keyboard attached or BlackBerry PRIV?\n* Type '1', '2', '3', '4', '5' to go to Button 1...5")
                }
            }
            HorizontalDivider {}
        } // col layout
    } // root
    ScrollIndicator.vertical: ScrollIndicator { }

    // emitting a Signal could be another option
    Component.onDestruction: {
        cleanup()
    }

    // called immediately after Loader.loaded
    function init() {
        console.log(qsTr("Init done from QtPage"))
    }
    // called from Component.destruction
    function cleanup() {
        console.log(qsTr("Cleanup done from Qt Page"))
    }
} // flickable
