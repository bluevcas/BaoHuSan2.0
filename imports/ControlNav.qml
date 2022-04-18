import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Rectangle {
    //显示区域的颜色背景
    color: "#6843d1"
    //anchors.fill: parent
    width: 400
    height: parent.height

    Rectangle {
        id: barRect
        width: unfold ? 240 : 64
        height: 384
        radius: 10
        anchors.centerIn: parent
        color: "#f5f5f5"
        clip: true

        Behavior on width {
            NumberAnimation {
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }

        ListModel {
            id: appModel

            ListElement {
                name: "主页"
                icon: "qrc:/images/icon/arrow-right.png"
            }
            ListElement {
                name: "用户"
                icon: "qrc:/images/icon/user.png"
            }
            ListElement {
                name: "信息"
                icon: "qrc:/images/icon/message.png"
            }
            ListElement {
                name: "帮助"
                icon: "qrc:/images/icon/help.png"
            }
            ListElement {
                name: "设置"
                icon: "qrc:/images/icon/setting.png"
            }
            ListElement {
                name: "退出"
                icon: "qrc:/images/icon/exit.png"
            }
        }

        Component {
            id: appDelegate

            Rectangle {
                id: delegateBackground
                width: barRect.width
                height: 48
                radius: 5
                //color: areaFull.containsMouse ? "red" : "#00000000"
                color: "#00000000"

                //显示图标
                Image {
                    id: imageIcon
                    width: 24
                    height: 24
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 18
                    mipmap: true
                    source: icon
                }
                //显示APP文字
                Text {
                    anchors.left: imageIcon.right
                    anchors.leftMargin: 40;
                    anchors.verticalCenter: imageIcon.verticalCenter
                    color: "#6843d1"
                    text: name
                    font { family: "微软雅黑"; pixelSize: 20; }
                }
                //鼠标处理
                MouseArea {
                    id: areaList
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: {
                        delegateBackground.color = "#10000000"
                        unfold = true
                    }
                    onExited: {
                        delegateBackground.color = "#00000000"
                        //unfold = true
                    }
                }
            }
        }

        MouseArea {
            id: areaFull
            anchors.fill: barRect
            hoverEnabled: true

            onEntered: {
                unfold = true
            }
            onExited: {
                unfold = false
            }

            //将 Child Item 直接放入 Parent Item 的 MouseArea 中, 解决OnEntered穿透问题
            GridView {
                id: appGrid
                width: 160
                height: parent.height
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 12
                model: appModel
                delegate: appDelegate
                cellWidth: width
                cellHeight: 60
            }
        }
    }

    // 展开/收回按钮
    Rectangle {
        width: 34
        height: width
        radius: width/2
        color: "#f5f5f5"
        border.color: "#6843d1"
        border.width: 5
        anchors.left: barRect.right
        anchors.leftMargin: -width/2
        anchors.verticalCenter: barRect.verticalCenter

        Image {
            width: 28
            height: 28
            anchors.centerIn: parent
            mipmap: true
            //此处使用旋转180度实现展开按钮图标和收回按钮图标
            rotation: unfold ? 180 : 0
            source: "qrc:/images/icon/arrow-right.png"
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                unfold = !unfold
            }
        }
    }
}
