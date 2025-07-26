import qs.modules.common
import qs.modules.common.widgets
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    required property string iconName
    required property double percentage
    property bool shown: true
    property string tooltipText: ""
    property bool hovered: false

    clip: true
    visible: width > 0 && height > 0
    implicitWidth: resourceRowLayout.x < 0 ? 0 : childrenRect.width
    implicitHeight: childrenRect.height

    RowLayout {
        spacing: 4
        id: resourceRowLayout
        x: shown ? 0 : -resourceRowLayout.width

        // Very very ugly!!! And WHY THE ANIMATION NOT WORKING!!!
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                root.hovered = true;
            }
            onExited: {
                root.hovered = false;
            }
        }

        StyledToolTip {
            delay: 200
            // WHY SHOULD BE NEGATIVE?!
            verticalPadding: -55
            extraVisibleCondition: root.hovered && root.tooltipText.length > 0
            content: root.tooltipText
        }

        CircularProgress {
            Layout.alignment: Qt.AlignVCenter
            lineWidth: 2
            value: percentage
            size: 26
            secondaryColor: Appearance.colors.colSecondaryContainer
            primaryColor: Appearance.m3colors.m3onSecondaryContainer
            enableAnimation: false

            MaterialSymbol {
                anchors.centerIn: parent
                fill: 1
                text: iconName
                iconSize: Appearance.font.pixelSize.normal
                color: Appearance.m3colors.m3onSecondaryContainer
            }

        }

        StyledText {
            Layout.alignment: Qt.AlignVCenter
            color: Appearance.colors.colOnLayer1
            text: `${Math.round(percentage * 100)}`
        }

        Behavior on x {
            animation: Appearance.animation.elementMove.numberAnimation.createObject(this)
        }

    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: Appearance.animation.elementMove.duration
            easing.type: Appearance.animation.elementMove.type
            easing.bezierCurve: Appearance.animation.elementMove.bezierCurve
        }
    }
}