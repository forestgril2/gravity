import QtQuick 2.15
import QtQml 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Timer {
        interval: 50
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

        property double xSpeed: 0.1
        property double ySpeed: 0.1

        onPaint: {
            var ctx = getContext("2d");
            ctx.strokeStyle = Qt.rgba(0, 0, 0, 1);
            ctx.lineWidth = 1;

            var diffTime = new Date() - startTime
            ctx.beginPath();
            ctx.moveTo(0, 0);//start point
            ctx.lineTo(diffTime*xSpeed, diffTime*ySpeed);//start point
            ctx.stroke();
        }
    }
}
