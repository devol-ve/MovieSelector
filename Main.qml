import QtQuick
import QtQuick.Controls.Basic

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Movie Selector")
    color: "#070808"
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
        id:outputField
        width: 640
        height: 311
        anchors.horizontalCenter: parent.horizontalCenter
        Image {
            id: image
            source: "qrc:/MovieSelector/marquee.jpg"
            sourceSize: Qt.size(1000, 611)
            width: parent.width
            height: parent.height
            smooth: true

        }
        Text {
            id: output
            text: qsTr("")
            anchors.bottom: outputField.bottom
            anchors.bottomMargin: 126
            anchors.horizontalCenter: parent.horizontalCenter
            font {
                pointSize: 16
                bold: true
            }
            onTextChanged: {
                if (text === "NO OTHER FILMS AVAILABLE."){
                    textInput.readOnly = true;
                    inputField.color = "#C0AC9F"
                    submitButton.color = "#A08C7F"
                }
            }
        }
    }

    Rectangle {
        id: inputField
        width: 150
        height: 30
        color: "#F5FDFD"
        border.width: 1
        radius: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: outputField.bottom

        TextInput {
            id: textInput
            width: parent.width
            height: parent.height
            padding: 6
            focus: true
            clip: true
            validator: IntValidator {
                bottom: 1
                top: 999999999
            }

            Keys.onReturnPressed: {
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
        id: prompt
        anchors.bottom: inputField.top
        anchors.bottomMargin: 5
        anchors.left: inputField.left
        color: inputField.color
        font {
            pointSize: 10
            bold: true
        }

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
        color: "#7DAFDA"
        border.width: 1

        MouseArea {
            id: submit
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                if(textInput.text !== "")
                    parent.color = "#427AEC"
            }

            onExited: {
                if (!textInput.readOnly)
                    parent.color = "#7DAFDA"
            }

            onPressed: {
                if(textInput.text !== "")
                    buttonPressedAnimation.start();
            }

            onReleased: {
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
                from: "#52A3FE"
                to: "#245F9A"
                duration: 50
            }
        }


        SequentialAnimation {
            id: buttonReleasedAnimation

            ParallelAnimation{
                ColorAnimation {
                    target: parent
                    property: "color"
                    from: "#245F9A"
                    to: "#52A3FE"
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
        color: "#7DAFDA"
        border.width: 1

        MouseArea {
            id: exit
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                parent.color = "#CB4D2F"
            }

            onExited: {
                parent.color = "#7DAFDA"
            }

            onClicked: {
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
