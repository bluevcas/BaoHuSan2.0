import QtQuick 2.0

Item {
    id: card

    property bool raised: false
    property alias mouseArea: mouseArea
    property alias source: image.img_src

    signal clicked

    width: 300
    height: 400

    CircularImage {
        id: image
        anchors.fill: parent
    }

    PaperShadow {
        id: shadow
        source: image
        dp: card.enabled ? (card.raised ? 2 : 1) : 0
    }

    //控制卡牌翻转
    transform: Rotation {
        id: animationrotate
        origin.x: image.width/2.0
        origin.y: -image.height/2.0
        axis{x:1;y:0;z:0}
        angle: 0
    }

    //动画控制翻转角度
    PropertyAnimation {
        id: animation
        target: animationrotate
        easing.type: Easing.OutQuad
        properties: "angle"
        duration: 500
    }

    //鼠标事件
    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        enabled: card.enabled
        onClicked: card.clicked()

        onEntered: {
            if(animation.running)
            {
                animation.running = false
            }
            animation.to=5
            animation.running=true;
        }
        onExited: {
            if(animation.running)
            {
                animation.running = false
            }
            animation.to=0
            animation.running=true;
        }
    }
}
