import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    title: qsTr("Circle go")

    Item {
        id: scene
        anchors.fill: parent
        state: "InitState"


        Rectangle {
            id: leftRectangle
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    circle.x += 50
                    if (circle.x >= rightRectangle.x + (rightRectangle.width - circle.width) / 2) {
                        scene.state = "InitState"
                    }
                    else {
                        scene.state = "IntermediateState"
                    }
                }
            }
        }

        Rectangle {
            id: rightRectangle
            anchors.right: parent.right
            anchors.rightMargin: leftRectangle.anchors.leftMargin
            anchors.verticalCenter: parent.verticalCenter
            color: leftRectangle.color
            width: leftRectangle.width
            height: leftRectangle.height
            border.color: leftRectangle.border.color
            border.width: leftRectangle.border.width
            radius: leftRectangle.radius
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    scene.state = "InitState"
                }
            }
        }

        Rectangle {
            id: circle
            x: leftRectangle.x + (leftRectangle.width - width)/2
            anchors.verticalCenter: leftRectangle.verticalCenter
            color: "darkgreen"
            width: leftRectangle.width - 10
            height: width
            radius: width/2
        }

        states: [
            State {
                name: "InitState"
                PropertyChanges {
                    target: circle
                    x: leftRectangle.x + (leftRectangle.width - width)/2
                }
            },
            State {
                name: "IntermediateState"
                PropertyChanges {
                    target: circle
                    x: circle.x
                }

            }
        ]

        transitions: [
            Transition {
                from: "IntermediateState"
                to: "InitState"

                SpringAnimation {
                    properties: "x"
                    spring: 2;
                    damping: 0.2
                }
            }
        ]
    }
}
