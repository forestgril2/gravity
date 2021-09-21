import QtQuick 2.15
import QtQml 2.15
import QtQuick.Window 2.15

Window {
    width: 1280
    height: 960
    visible: true
    title: qsTr("Hello World")

    Timer {
        interval: 17
        running: true
        repeat: true
        onTriggered: {
            myCanvas.requestPaint()
        }
    }

    Canvas {
        id: myCanvas
        anchors.fill: parent
        property var startTime: new Date();
        property var lastTime

        property double xSpeed: 0.2
        property double ySpeed: -0.3

        property double xStart: 0
        property double yStart: 960

        property double yPrev: 960
        property double xPrev: 960

        property double yAcceleration: 0.001


        onPaint: {
            var ctx = getContext("2d");
            ctx.strokeStyle = Qt.rgba(0, 0, 0, 1);
            ctx.lineWidth = 3;

            var diffTime = new Date() - startTime

//            ySpeed = ySpeed  - yAcceleration*diffTime

            ySpeed = ySpeed + yAcceleration

            ctx.beginPath();
            ctx.moveTo(xPrev, yPrev);//start point

            var xNew = xStart + diffTime*xSpeed
            var yNew = yStart + diffTime*ySpeed

            ctx.lineTo(xNew, yNew);//end point

            xPrev = xNew
            yPrev = yNew

            ctx.stroke();
        }
    }
}
