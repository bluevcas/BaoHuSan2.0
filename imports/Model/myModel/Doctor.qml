import QtQuick 2.15
import QtQuick3D 1.15

Node {
    id: rootNode

    Node {
        id: armature
        z: -431.475
        eulerRotation.x: -90
        scale.x: 37463.4
        scale.y: 37463.4
        scale.z: 37463.4

        Model {
            id: cuerpo_001
            source: "meshes/cuerpo_001.mesh"

            DefaultMaterial {
                id: node1m4g3n_texura_An1we_png_material
                diffuseMap: Texture {
                    source: "qrc:/imports/Model/myModel/source/textures.png"
                }
            }

            DefaultMaterial {
                id: borde_material
                diffuseColor: "#74C8E1"
            }
            materials: [
                node1m4g3n_texura_An1we_png_material
            ]
        }

        Model {
            id: cabeza_001
            x: 3.57597e-16
            y: 0.0121317
            z: 1.59834
            eulerRotation.x: 90
            scale.x: 1.28523
            scale.y: 1.27659
            scale.z: 1.27659
            source: "meshes/cabeza_001.mesh"
            materials: [
                node1m4g3n_texura_An1we_png_material,
                borde_material
            ]
        }


        Model {
            id: export_001
            x: 3.59117e-16
            y: 0.0189759
            z: 1.59834
            eulerRotation.x: 90
            scale.x: 1.27659
            scale.y: 1.27659
            scale.z: 1.27659
            source: "meshes/export_001.mesh"
            materials: [
                node1m4g3n_texura_An1we_png_material,
                borde_material
            ]
        }

        Model {
            id: cuerpo
            source: "meshes/cuerpo.mesh"
            materials: [
                node1m4g3n_texura_An1we_png_material,
                borde_material
            ]
        }

    }

    Model {
        id: cube
        x: 60.5517
        z: -1688.41
        eulerRotation.x: -90
        eulerRotation.z: 1.36604e-05
        scale.x: 119.928
        scale.y: 119.928
        scale.z: 119.928
        source: "meshes/cube.mesh"
        materials: [
            node1m4g3n_texura_An1we_png_material
        ]
    }
}
