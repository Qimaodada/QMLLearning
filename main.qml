import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Hello World")
    background: Rectangle {
        color: "#800000FF"
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0
        AppNavi {
            Layout.fillHeight: true
            Layout.preferredWidth: 256
            onCurItemChanged: {
                appContent.curItem = curItem
            }
        }
        AppContent {
            id: appContent
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
