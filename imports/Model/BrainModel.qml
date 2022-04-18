import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick3D 1.15
import QtQuick3D.Helpers 1.15
import QtQuick.Controls.Material 2.0
import "brain"

Item {
    id: sandbox
    anchors.fill: parent

    property alias rotationAni: rotationAni.running
    property alias ey: brain.eulerRotation.y
    property alias brainstate: brain.brainstate

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.VeryHigh
            backgroundMode: SceneEnvironment.Transparent
        }

        PerspectiveCamera {
            id: mainCamera
            z: 300
            y: 0
        }

        Brain {
            id: brain
            eulerRotation.y: 90
            scale: Qt.vector3d(3, 3, 3)

            PropertyAnimation on eulerRotation.y {
                id: rotationAni
                from: 0
                to: 360
                duration: 5000
                loops: Animation.Infinite
            }
        }

        DirectionalLight {
            z: 300
        }
    }
}
