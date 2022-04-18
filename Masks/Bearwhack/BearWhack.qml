import QtQuick 2.0
import QtQuick.Particles 2.0
import "content"

Item {
    id: root
    anchors.fill: parent

    Item {
        id: startScreen
        anchors.fill: parent
        z: 1000
//        Image {
//            source: "content/title.png"
//            anchors.centerIn: parent
//        }
        Text {
            id: title
            text: "保卫家园 "
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: 45
            color: "white"
        }

        Text {
            text: "点击开始 "
            anchors.top: title.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.pixelSize: 45
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {//Game Start
                parent.visible = false;
            }
        }
    }

    Rectangle {
        id: bg
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "DarkBlue" }
            GradientStop { position: 0.8; color: "SkyBlue" }
            GradientStop { position: 0.81; color: "ForestGreen" }
            GradientStop { position: 1.0; color: "DarkGreen" }
        }
    }

    BearWhackParticleSystem {
        id: particleSystem
        anchors.fill: parent
        running: !startScreen.visible
    }

    property int score: particleSystem.score

    Text {
        anchors.right: parent.right
        anchors.margins: 4
        anchors.top: parent.top
        color: "white"
        function padded(num) {
            var ret = num.toString();

            if (ret >= 0)
                return ret.padStart(6, "0");
            else
                return "-" + ret.substr(1).padStart(6, "0");
        }
        text: "Score: " + padded(root.score)
    }
    MultiPointTouchArea {
        anchors.fill: parent
        touchPoints: [//Support up to 4 touches at once?
            AugmentedTouchPoint{ system: particleSystem },
            AugmentedTouchPoint{ system: particleSystem },
            AugmentedTouchPoint{ system: particleSystem },
            AugmentedTouchPoint{ system: particleSystem }
        ]
    }
    MouseArea{
        anchors.fill: parent
        id: ma
        onPressedChanged: {
            if (pressed) {
                timer.restart();
                sgoal.enabled = true;
                particleSystem.explode(mouseX,mouseY);
            }
        }
        Timer {
            id: timer
            interval: 100
            running: false
            repeat: false
            onTriggered: sgoal.enabled = false
        }
        SpriteGoal {
            id: sgoal
            x: ma.mouseX - 16
            y: ma.mouseY - 16
            width: 32
            height: 32
            system: particleSystem
            parent: particleSystem
            goalState: "falling"
            enabled: false
        }
    }
}
