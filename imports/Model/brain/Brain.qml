import QtQuick 2.15
import QtQuick3D 1.15

Node {
    id: root

    eulerRotation.x: -90
    //分散结构
    property alias brainstate: root.state

    Model {
        id: l_Basal_Ganglia_LowPoly
        x: 1.4081
        y: 3.121
        z: -1.7398
        eulerRotation.x: -88.0929
        scale.x: 0.8496
        scale.y: 0.8496
        scale.z: 0.8496
        source: "meshes/l_Basal_Ganglia_LowPoly.mesh"

        DefaultMaterial {
            id: frontal_Lobe_material
            diffuseColor: "#ff1e419b"
        }
        materials: [
            frontal_Lobe_material
        ]

        Model {
            id: l_Basal_Ganglia_Part3
            x: 3.7122
            y: 3.2917
            z: -6.9287
            eulerRotation.x: 89.0946
            eulerRotation.y: -2.0016
            eulerRotation.z: -95.4246
            scale.x: 2.83663
            scale.y: 3.4016
            scale.z: 49.1996
            source: "meshes/l_Basal_Ganglia_Part3.mesh"
            materials: [
                frontal_Lobe_material
            ]
        }

        Model {
            id: l_Basal_Ganglia_Part2
            x: 5.3459
            y: 3.2011
            z: -6.8671
            eulerRotation.x: 90.4089
            eulerRotation.y: -1.86302
            eulerRotation.z: -102.386
            scale.x: 3.46045
            scale.y: 3.46045
            scale.z: 48.5758
            source: "meshes/l_Basal_Ganglia_Part2.mesh"
            materials: [
                frontal_Lobe_material
            ]
        }
    }

    Model {
        id: r_Basal_Ganglia_LowPoly1
        x: 2.6511
        y: 3.121
        z: -1.7398
        eulerRotation.x: -88.0929
        scale.x: 0.8496
        scale.y: 0.8496
        scale.z: 0.8496
        source: "meshes/r_Basal_Ganglia_LowPoly1.mesh"

        DefaultMaterial {
            id: frontal_Lobe_material2
            diffuseColor: "#ff1e419b"
        }
        materials: [
            frontal_Lobe_material2
        ]

        Model {
            id: l_Basal_Ganglia_Part4
            x: -11.7495
            y: 2.8618
            z: -6.8559
            eulerRotation.x: -88.9901
            eulerRotation.y: 1.61802
            eulerRotation.z: 121.993
            scale.x: -3.46045
            scale.y: -3.46045
            scale.z: -48.5758
            source: "meshes/l_Basal_Ganglia_Part4.mesh"
            DefaultMaterial {
                id: frontal_Lobe_material3
                diffuseColor: "#ff1e419b"
            }
            materials: [
                frontal_Lobe_material3
            ]
        }

        Model {
            id: l_Basal_Ganglia_Part5
            x: -10.2864
            y: 3.1786
            z: -6.925
            eulerRotation.x: -89.8566
            eulerRotation.y: 2.83201
            eulerRotation.z: 119.47
            scale.x: -2.83663
            scale.y: -3.4016
            scale.z: -49.1996
            source: "meshes/l_Basal_Ganglia_Part5.mesh"
            DefaultMaterial {
                id: frontal_Lobe_material4
                diffuseColor: "#ff1e419b"
            }
            materials: [
                frontal_Lobe_material4
            ]
        }
    }

    Model {
        id: l_Frontal_Lobe
        x: -0.3305
        eulerRotation.x: -88.0929
        scale.y: 1
        scale.z: 1
        source: "meshes/l_Frontal_Lobe.mesh"
        DefaultMaterial {
            id: frontal_Lobe_material5
            diffuseColor: "#ff1e419b"
        }
        materials: [
            frontal_Lobe_material5
        ]
    }

    Model {
        id: r_Frontal_Lobe
        x: -0.3305
        eulerRotation.x: -88.0929
        scale.y: 1
        scale.z: 1
        source: "meshes/r_Frontal_Lobe.mesh"
        opacity: 0.5
        DefaultMaterial {
            id: frontal_Lobe_material6
            diffuseColor: "#ff1e419b"
        }
        materials: [
            frontal_Lobe_material6
        ]
    }

    Model {
        id: l_Brain_Cut
        x: 0.3185
        eulerRotation.x: 91.9071
        scale.x: -1
        scale.y: -1
        scale.z: -1
        source: "meshes/l_Brain_Cut.mesh"

        DefaultMaterial {
            id: brain_Transparent_material1
            diffuseColor: "#ff416ea9"
        }
        materials: [
            brain_Transparent_material1
        ]
    }

    Model {
        id: r_Brain_Cut
        x: -0.3305
        eulerRotation.x: -88.0929
        scale.y: 1
        scale.z: 1
        source: "meshes/r_Brain_Cut.mesh"

        DefaultMaterial {
            id: brain_Transparent_material2
            diffuseColor: "#ff416ea9"
        }
        materials: [
            brain_Transparent_material2
        ]
    }



    //状态 FULL HALFBRAIN
    state:"FULL";
    states: [
        State {
            name: "FULL"
            PropertyChanges {
                target: l_Brain_Cut
                opacity: 1
            }
            PropertyChanges {
                target: l_Frontal_Lobe
                opacity: 1
            }
            PropertyChanges {
                target: l_Basal_Ganglia_LowPoly
                opacity: 1
            }
            PropertyChanges {
                target: root
                scale: Qt.vector3d(2, 2, 2)
            }
            PropertyChanges {
                target: frontal_Lobe_material2
                diffuseColor: "#ff1e419b"
            }

        },
        State {
            name: "HALFBRAIN"
            PropertyChanges {
                target: l_Brain_Cut
                opacity: 0
            }
            PropertyChanges {
                target: l_Frontal_Lobe
                opacity: 0
            }
            PropertyChanges {
                target: l_Basal_Ganglia_LowPoly
                opacity: 0
            }
            PropertyChanges {
                target: root
                eulerRotation.y: 270
            }
            PropertyChanges {
                target: root
                scale: Qt.vector3d(3, 3, 3)
            }
            PropertyChanges {
                target: frontal_Lobe_material2
                diffuseColor: "#DD4425"
            }
        },
        State {
            name: "FENSAN"
        }
    ]
    transitions: [
        Transition {
            from: "FULL"
            to: "HALFBRAIN"
            ParallelAnimation {
                NumberAnimation {
                    properties: "x,y,opacity";
                    easing.type: Easing.InOutQuad; duration: 500
                }
                NumberAnimation {
                    properties: "eulerRotation.y";
                    easing.type: Easing.InOutQuad; duration: 500
                }
                NumberAnimation {
                    properties: "scale";
                    easing.type: Easing.InOutQuad; duration: 500
                }
            }
        },
        Transition {
            from: "HALFBRAIN"
            to: "FULL"
            ParallelAnimation {
                NumberAnimation {
                    properties: "x,y,opacity";
                    easing.type: Easing.InOutQuad; duration: 500
                }
                NumberAnimation {
                    properties: "eulerRotation.y";
                    easing.type: Easing.InOutQuad; duration: 500
                }
                NumberAnimation {
                    properties: "scale";
                    easing.type: Easing.InOutQuad; duration: 500
                }
            }
        }
    ]
}
