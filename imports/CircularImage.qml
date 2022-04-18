import QtQuick 2.6
import QtGraphicalEffects 1.0

Rectangle {
    property string img_src

    radius: 5

    Image {
        id: _image
        smooth: true
        visible: false
        anchors.fill: parent
        source: img_src
        sourceSize: Qt.size(parent.size, parent.size)
        antialiasing: true
    }
    Rectangle {
        id: _mask
        color: "black"
        anchors.fill: parent
        radius: 5
        visible: false
        antialiasing: true
        smooth: true
    }
    OpacityMask {
        id: mask_image
        anchors.fill: _image
        source: _image
        maskSource: _mask
        visible: true
        antialiasing: true
    }
}
