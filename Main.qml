import QtQuick
import QtQuick.Controls.Basic

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Movie Selector")
    color: "#CFE2E5"
    id: page

    //============================//
    // signal
    signal qmlRequireData(string msg)
    //============================//
    // slot
    function qmlUpdateData(data: string) {
        output.text = data
    }

    Rectangle {
        id: inputField
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
                console.log("Enter pressed: " + text);
                if(text !== "") {
                    page.qmlRequireData(text);
                    text = "";
                }
            }
            Keys.onEscapePressed: {
                close();
            }
        }
    }

    Text {
        id: output
        text: qsTr("")
        anchors.bottom: inputField.top
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        font {
            pointSize: 12
            bold: true
        }
    }

    Text {
        id: prompt
        anchors.bottom: inputField.top
        anchors.bottomMargin: 5
        anchors.left: inputField.left

        text: "Enter a number"
    }

    Rectangle {
        id: submitButton
        anchors.top: inputField.bottom
        anchors.topMargin: 20
        anchors.left: inputField.left
        anchors.leftMargin: 10
        width: 85
        height: 30
        radius: 5
        color: "#8DBFDA"
        border.width: 1

        MouseArea {
            id: submit
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                if(textInput.text !== "")
                    parent.color = "#B2E3FE"
            }

            onExited: {
                parent.color = "#8DBFDA"
            }

            onPressed: {
                console.log("Submit pressed");
                if(textInput.text !== "")
                    buttonPressedAnimation.start();
            }

            onReleased: {
                console.log("Submit released: " + textInput.text);
                if(textInput.text !== ""){
                    page.qmlRequireData(textInput.text);
                    buttonReleasedAnimation.start();
                }
            }
        }

        Text {
            id: submitLabel
            text: qsTr("Select Movie")
            anchors.centerIn: parent
        }

        SequentialAnimation {
            id: buttonPressedAnimation

            ColorAnimation {
                target: parent
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
                    target: parent
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
        id: exitButton
        anchors.top: inputField.bottom
        anchors.topMargin: 20
        anchors.right: inputField.right
        anchors.rightMargin: 10
        width: 35
        height: 30
        radius: 5
        color: "#8DBFDA"
        border.width: 1

        MouseArea {
            id: exit
            anchors.fill: parent
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
            id: exitLabel
            text: qsTr("Exit")
            anchors.centerIn: parent
        }
    }
}
