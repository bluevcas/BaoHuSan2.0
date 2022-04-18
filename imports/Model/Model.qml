import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick3D 1.15
import QtQuick3D.Helpers 1.15
import QtQuick.Controls.Material 2.0
import "myModel"

Item {
    id: sandbox
    anchors.fill: parent

    property alias eulerRotationy: person.eulerRotation.y

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.VeryHigh
        }

        PerspectiveCamera {
            id: mainCamera
            z: 300
            y: 140
        }

        SequentialAnimation {
            id: transanim
            running: true
            ParallelAnimation {
                NumberAnimation {
                    target: mainCamera
                    property: "y"
                    from: 360
                    to: 140
                    duration: 600
                }
                NumberAnimation {
                    target: mainCamera
                    property: "z"
                    from: 500
                    to: 300
                    duration: 600
                }
            }
        }

//        PerspectiveCamera {
//            id: camera
//            z: 300
//            y: 300
//        }

//        Node {
//            AirCraft {
//                id: craft
//                scale: Qt.vector3d(1, 1, 1)
//                y: 200

//                PropertyAnimation on eulerRotation.y {
//                    from: 0
//                    to: 360
//                    duration: 3000
//                    running: true
//                    loops: Animation.Infinite
//                }
//            }
//        }

        Doctor {
            id: person
            eulerRotation.y: 0
            scale: Qt.vector3d(0.004, 0.004, 0.004)

            PropertyAnimation on eulerRotation.y {
                from: 0
                to: 360
                duration: 4000
                running: true
                loops: Animation.Infinite
            }
        }

//        Robot {
//            id: person
//        }

        DirectionalLight {
            z: 100
        }
    }
}
