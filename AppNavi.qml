import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import EnumDefines 1.0
/// AppNavi.qml
Control {
    id: root
    padding: 16

    property var curItem: EnumDefines.PageType.Pageone

    contentItem: ColumnLayout {
        spacing: 0

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0
            interactive: contentHeight > height
            clip: true
            model: {
                let naviItemList = [{
                                        "id": EnumDefines.PageType.Pageone,
                                        "title": qsTr("Pageone")
                                    },
                                    {
                                        "id": EnumDefines.PageType.Pagetwo,
                                        "title": qsTr("Pagetwo")
                                    },
                                    {
                                        "id": EnumDefines.PageType.Pagethree,
                                        "title": qsTr("Pagethree")
                                    }]
                return naviItemList
            }
            delegate: NaviItem {
                isCurItem: root.curItem === modelData.id
                implicitWidth: ListView.view.width
                text: modelData.title
                onClicked: {
                    if (root.curItem === modelData.id) {
                        return
                    }

                    root.curItem = modelData.id
                }
            }
        }
    }


    component NaviItem: AbstractButton {
        id: naviItem
        property bool isCurItem: false
        verticalPadding: 18
        horizontalPadding: 12
        contentItem: Text {
            text: naviItem.text
            color: naviItem.isCurItem ? "#F5F6F7" : "#1C1F22"
            font.pixelSize: 18
            clip: true
            elide: Text.ElideRight
        }

        background: Rectangle {
            visible: naviItem.isCurItem
            radius: 8
            color: "#80F9FCFF"
        }
    }
}
