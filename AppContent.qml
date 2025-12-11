import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Templates as T

import EnumDefines 1.0
/// AppContent.qml
Control {
    id: root

    property var curItem: EnumDefines.PageType.Pageone

    topPadding: 52
    horizontalPadding: 24
    background: Rectangle {
        color: "#1E1E1E"
    }

    contentItem: T.SwipeView {
        id: control

        implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, contentWidth + leftPadding + rightPadding)
        implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, contentHeight + topPadding + bottomPadding)

        clip: true
        orientation: Qt.Vertical
        interactive: false
        currentIndex: _p.itemMap[root.curItem] ?? 0

        contentItem: ListView {
            id: listView
            model: control.contentModel
            interactive: control.interactive
            currentIndex: control.currentIndex
            focus: control.focus

            spacing: control.spacing
            orientation: control.orientation
            snapMode: ListView.SnapOneItem
            boundsBehavior: Flickable.StopAtBounds

            highlightRangeMode: ListView.StrictlyEnforceRange
            preferredHighlightBegin: 0
            preferredHighlightEnd: 0
            highlightMoveDuration: 0
            // maximumFlickVelocity: 4 * (control.orientation === Qt.Horizontal ? width : height)
        }

        // [Pageone]
        Control {
            Text {
                anchors.fill: parent
                text: qsTr("Pageone")
                color: "#FFFFFF"
            }
            Component.onCompleted: {
                _p.appendItem(EnumDefines.PageType.Pageone, SwipeView.index)
            }
        }
        // [Pagetwo]
        Control {
            Text {
                anchors.fill: parent
                text: qsTr("Pagetwo")
                color: "#FFFFFF"
            }
            Component.onCompleted: {
                _p.appendItem(EnumDefines.PageType.Pagetwo, SwipeView.index)
            }
        }
        // [Pagethree]
        Control {
            Text {
                anchors.fill: parent
                text: qsTr("Pagethree")
                color: "#FFFFFF"
            }
            Component.onCompleted: {
                _p.appendItem(EnumDefines.PageType.Pagethree, SwipeView.index)
            }
        }
    }

    QtObject {
        id: _p
        property var itemMap: ({})
        function appendItem(id, indexInView) {
            itemMap[id] = indexInView
            control.setCurrentIndex(itemMap[root.curItem])
        }
    }
}
