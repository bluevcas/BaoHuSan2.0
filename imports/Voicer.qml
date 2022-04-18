import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: voicer

    Column {//按钮语音识别

        Label {
            id: txInfo
            text: qsTr("Press OK to say command")
            font.italic: true
            anchors.horizontalCenter: parent.horizontalCenter

            //opacity: translator.running ? 0 : 1
            Behavior on opacity { NumberAnimation {} }
        }

        Button {
            id: btTranslate
            text: qsTr("OK")
            icon.name: "audio-input-microphone"
            anchors.horizontalCenter: parent.horizontalCenter
//                    Keys.onEnterPressed: clicked()
//                    Keys.onReturnPressed: clicked()
            //onClicked: voiceFuc.on_VoiceBtn_pressed

            //enabled: !translator.running
            focus: true

            //opacity: translator.running ? 0 : 1
            Behavior on opacity { NumberAnimation {} }

            MouseArea {
                anchors.fill: parent

                onPressed: {
                    voiceFuc.voiceBtnpressed()
                }

                onReleased: voiceFuc.voiceBtnreleased()
            }
        }

//                BusyIndicator {
//                    id: busyIndicator
//                    running: translator.running
//                    anchors.horizontalCenter: parent.horizontalCenter

//                    opacity: translator.running ? 1 : 0
//                    Behavior on opacity { NumberAnimation {} }
//                }

        Label {
            id: lCommand
            text: "返回结果"
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter

            //opacity: translator.command.length > 0 && translator.running ? 0 : 1
            Behavior on opacity { NumberAnimation {} }
        }

        Label {
            id: lError
            //text: translator.error
            color: "red"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
