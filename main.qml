import QtQuick 2.15
import QtQml 2.15
import QtQuick.Window 2.15

Window {
    width: 1280
    height: 960
    visible: true
    title: qsTr("Hello World")

    Timer {
        id: timer
        interval: 17
        running: true
        repeat: true
        onTriggered: {
            myCanvas.requestPaint()
        }
    }

    Bullet {
        id: leftBullet
    }

    Canvas {
        id: myCanvas
        anchors.fill: parent
        property var prevTime: new Date()

        property bool isInitialized: false

        property double yAcceleration: 0.002

        onPaint: {
            var ctx = getContext("2d");
            ctx.strokeStyle = Qt.rgba(0, 0, 0, 1);

            var currentTime = new Date()
            var diffTime = currentTime - prevTime
//            console.log(" ### diffTime: ", diffTime)
            prevTime = currentTime

            ctx.reset()
            ctx.lineWidth = 5;
            ctx.beginPath();

            leftBullet.v.y = leftBullet.v.y + yAcceleration
            ctx.moveTo(leftBullet.pos.x, leftBullet.pos.y); //line start point

            var xNew = leftBullet.pos.x + (diffTime * leftBullet.v.x)
            var yNew = leftBullet.pos.y + (diffTime * leftBullet.v.y)

            ctx.lineTo(xNew, yNew); // line end point

            leftBullet.pos.x = xNew
            leftBullet.pos.y = yNew

            ctx.stroke();
        }
    }
}
