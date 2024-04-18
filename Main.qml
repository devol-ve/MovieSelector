import QtQuick
import QtQuick.Controls.Basic

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Movie Selector")
    color: "#CFE2E5"

    Rectangle {
        id: inputRect
        width: 150
        height: 30
        color: "#F5FDFD"
        border.width: 1
        radius: 5
        anchors.centerIn: parent

        TextInput {
            id: textInput
            width: parent.width
            height: parent.height
            padding: 6
            focus: true
            validator: IntValidator {
                bottom: 1
                top: 999999999
            }
            Keys.onReturnPressed: {
                console.log("Enter pressed: " + textInput.text);
                output.text = textInput.text;
                buttonAnimation.start();
            }
            Keys.onEscapePressed: {
                close();
            }
        }
    }

    Text {
        id: output
        text: qsTr("")
        anchors.bottom: inputRect.top
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        font {
            pointSize: 12
            bold: true
        }
    }

    Text {
        id: prompt
        anchors.bottom: inputRect.top
        anchors.bottomMargin: 5
        anchors.left: inputRect.left

        text: "Enter a number"
    }

    Rectangle {
        id: buttonRect
        anchors.top: inputRect.bottom
        anchors.topMargin: 20
        width: 100
        height: 35
        radius: 5
        color: "#8DBFDA"
        border.width: 1
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            id: submit
            anchors.fill: buttonRect
            hoverEnabled: true
            onEntered: {
                parent.color = "#B2E3FE"
            }

            onExited: {
                parent.color = "#8DBFDA"
            }

            //onClicked: {
            //    console.log("Submit pressed: " + textInput.text);
            //    output.text = textInput.text;
            //    buttonAnimation.start();
            //}
            onPressed: {
                console.log("Submit pressed");
                buttonPressedAnimation.start();
            }

            onReleased: {
                console.log("Submit released: " + textInput.text);
                output.text = textInput.text;
                buttonReleasedAnimation.start();
            }
        }

        Text {
            id: label
            text: qsTr("Submit")
            anchors.centerIn: buttonRect
        }

        SequentialAnimation {
            id: buttonPressedAnimation

            ColorAnimation {
                target: buttonRect
                property: "color"
                from: "#B2E3FE"
                to: "#4D7F9A"
                duration: 50
            }
        }


        SequentialAnimation {
            id: buttonReleasedAnimation

            ParallelAnimation{
                ColorAnimation {
                    target: buttonRect
                    property: "color"
                    from: "#4D8F9A"
                    to: "#B2E3FE"
                    duration: 150
                }
                PropertyAnimation {
                    target: textInput
                    property: "text"
                    from: textInput.text
                    to: ""
                }
            }


        }
    }

    Rectangle {
        id: exitRect
        anchors.top: buttonRect.bottom
        anchors.topMargin: 10
        width: 100
        height: 35
        radius: 5
        color: "#8DBFDA"
        border.width: 1
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            id: exitbutton
            anchors.fill: exitRect
            hoverEnabled: true

            onEntered: {
                parent.color = "#FDAFAA"
            }

            onExited: {
                parent.color = "#8DBFDA"
            }

            onClicked: {
                console.log("exit");
                close();
            }
        }

        Text {
            id: exitlabel
            text: qsTr("Exit")
            anchors.centerIn: exitRect
        }
    }
}
