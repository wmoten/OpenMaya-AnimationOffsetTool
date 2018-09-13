
import AnimationOffsetUtils
from AnimationOffset import AnimOffset
from maya import OpenMayaUI as omui
#from Qt import QtWidgets, QtCore, QtGui
from PySide2 import QtWidgets, QtCore, QtGui

UI_LABEL = "Setup Anim Offset Object"
UI_NAME = UI_LABEL.strip()

class SetClasses(QtWidgets.QDialog):

    def __init__(self):
        super(SetClasses, self).__init__()

        self.selected = AnimationOffsetUtils.getSelected()
        self.animOffsets = AnimOffset()
        self.attrs = []

        parent = QtWidgets.QDialog(parent=getMayaMainWindow())
        parent.setObjectName(UI_NAME)
        parent.setWindowTitle(UI_LABEL)

        self.buildUI()
        self.populate()
        self.parent().layout().addWidget(self)



    def buildUI(self):

        layout = QtWidgets.QGridLayout(self)

        self.selectedObjsCB = QtWidgets.QComboBox()
        for sel in self.selected:
            self.selectedObjsCB.addItem(sel)
        layout.addWidget(self.selectedObjsCB, 0, 0, 1, 2)

        self.userDefinedCheck = QtWidgets.QCheckBox('User Defined Attributes')
        layout.addWidget(self.userDefinedCheck, 0, 0, 2, 2)

        addBtn = QtWidgets.QPushButton('Add')
        addBtn.clicked.connect(self.displayAttributes)
        # We add it to the layout in row 0, column 2
        layout.addWidget(addBtn, 0, 2)

        # container widget
        scrollWidget = QtWidgets.QWidget()
        scrollWidget.setSizePolicy(QtWidgets.QSizePolicy.Maximum, QtWidgets.QSizePolicy.Maximum)
        self.scrollLayout = QtWidgets.QVBoxLayout(scrollWidget)

        scrollArea = QtWidgets.QScrollArea()
        scrollArea.setWidgetResizable(True)
        scrollArea.setWidget(scrollWidget)
        layout.addWidget(scrollArea, 1, 0, 1, 3)

        saveBtn = QtWidgets.QPushButton('Save')
        saveBtn.clicked.connect(self.save)
        layout.addWidget(saveBtn, 2, 0)

        refreshBtn = QtWidgets.QPushButton('Refresh')
        refreshBtn.clicked.connect(self.refresh)
        layout.addWidget(refreshBtn, 2, 2)


    def displayAttributes(self):

        curObj = str(self.selectedObjsCB.currentText())
        udCheckBox = self.userDefinedCheck.ischecked()
        self.attrs = AnimationOffsetUtils.getObjAttributes(curObj, udCheckBox)




def showUI():
    """
    :return: QtWidgets.QDialog
    """
    ui = SetClasses()
    ui.show()
    return ui

def getMayaMainWindow():
    """
    Returns:
        pointer
        QtWidgets.QMainWindow: The Maya MainWindow
    """
    win = omui.MQtUtil_mainWindow()
    ptr = wrapInstance(long(win), QtWidgets.QMainWindow)
    return ptr
