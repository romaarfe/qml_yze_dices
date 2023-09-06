import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Rolador de Dados"
    font.bold: true

    Rectangle {
        color: "orange"
        anchors.fill: parent

        Column {
            spacing: 10
            anchors.centerIn: parent

            Row {
                spacing: 10

                Label {
                    text: "Quantidade de Dados (Atributo):"
                    font.pixelSize: 16
                }

                SpinBox {
                    id: attributeSpinBox
                    from: 1
                    to: 10
                    value: 1
                }
            }

            Row {
                spacing: 10

                Label {
                    text: "Quantidade de Dados (Perícia):"
                    font.pixelSize: 16
                }

                SpinBox {
                    id: skillSpinBox
                    from: 1
                    to: 10
                    value: 1
                }
            }

            Row {
                spacing: 10

                Label {
                    text: "Quantidade de Dados (Equipamento):"
                    font.pixelSize: 16
                }

                SpinBox {
                    id: equipmentSpinBox
                    from: 1
                    to: 10
                    value: 1
                }
            }

            Button {
                text: "Rolar Dados"
                onClicked: {
                    // Limpar resultados anteriores
                    clearResults();

                    // Rolar dados para Atributo, Perícia e Equipamento
                    rollDice("Atributo", "red", attributeSpinBox.value);
                    rollDice("Perícia", "green", skillSpinBox.value);
                    rollDice("Equipamento", "blue", equipmentSpinBox.value);
                }
            }

            Rectangle {
                width: parent.width
                height: 100
                color: "transparent"

                Text {
                    anchors.centerIn: parent
                    text: "Resultados:"
                    font.pixelSize: 18
                }

                TextArea {
                    id: resultsTextArea
                    width: parent.width
                    height: 100
                    readOnly: true
                    wrapMode: TextEdit.WordWrap
                    font.pixelSize: 14

                    text: "Atributo: " + attributeResult + " (Sucessos: " + attributeSuccesses + ")" +
                          "\nPerícia: " + skillResult + " (Sucessos: " + skillSuccesses + ")" +
                          "\nEquipamento: " + equipmentResult + " (Sucessos: " + equipmentSuccesses + ")"
                }
            }
        }
    }

    function clearResults() {
        attributeResult = 0;
        skillResult = 0;
        equipmentResult = 0;
        attributeSuccesses = 0;
        skillSuccesses = 0;
        equipmentSuccesses = 0;
    }

    function rollDice(label, color, quantity) {
        var totalResult = [];
        var successes = 0;

        for (var i = 0; i < quantity; i++) {
            var diceValue = Math.floor(Math.random() * 6) + 1;
            totalResult.push(diceValue);

            if (diceValue === 6) {
                successes++;
            }
        }

        if (label === "Atributo") {
            attributeResult = totalResult;
            attributeSuccesses = successes;
        } else if (label === "Perícia") {
            skillResult = totalResult;
            skillSuccesses = successes;
        } else if (label === "Equipamento") {
            equipmentResult = totalResult;
            equipmentSuccesses = successes;
        }
    }

    property var attributeResult: []
    property var skillResult: []
    property var equipmentResult: []
    property int attributeSuccesses: 0
    property int skillSuccesses: 0
    property int equipmentSuccesses: 0
}
