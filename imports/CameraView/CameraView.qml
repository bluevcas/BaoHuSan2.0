import QtQuick 2.15
import QtMultimedia 5.15

Item {
    anchors.fill: parent

    property alias camera: maincamera
    property alias captureTimer: captureTimer

    //拍照方法 maincamera.imageCapture.capture()
//    Timer { //人脸识别计时器
//        id: captureTimer
//        interval: 4000
//        running: true
//        repeat: true
//        onTriggered: {
//            maincamera.imageCapture.capture()
//        }
//    }

    Timer {
        id: captureTimer
    }

    Connections {
        target: maincamera.imageCapture

        onImageSaved: faceDtec.faceSerch(path)
//        function onImageSaved(requestId, path) {
//           faceDtec.faceSerch(path)
//        }
    }

    Connections {
        target: faceDtec

        function onTrustScoreChanged(trustScore) {
            if(trustScore > 75) {
                loader.push("qrc:/mainpanel.qml")
                captureTimer.stop()
                console.log("Face Dtec Success")
            }
        }
    }

    Camera {
        id: maincamera
    }

    VideoOutput {
        id: output
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        //anchors.centerIn: parent
        source: maincamera
        autoOrientation: true
    }

    //    ListView {
    //        id: list
    //        anchors.top: output.bottom

    //        model: QtMultimedia.availableCameras
    //        delegate: Text {
    //            text: modelData.displayName

    //            MouseArea {
    //                anchors.fill: parent
    //                onClicked: maincamera.deviceId = modelData.deviceId
    //            }
    //        }
    //    }
}
