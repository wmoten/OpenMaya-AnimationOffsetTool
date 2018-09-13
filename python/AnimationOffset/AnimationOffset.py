import os
import json
import maya.api.OpenMaya as om
import maya.api.OpenMayaAnim as oma
import AnimationOffsetUtils as aou
from maya import cmds

class KeyFrame(object):
    def __init__(self, curve, idx):
        super(KeyFrame, self).__init__()
        self.curveobj = curve
        self.idx = idx
        self.timeobj = oma.MTime()
        self.time = 0.0
        self.value = 0.0
        self.inTanWT = (om.MAngle(0, om.MAngle.kRadians), 1.0)
        self.inTanXY = (1.0, 0.0)
        self.outTanWT = (om.MAngle(0, om.MAngle.kRadians), 1.0)
        self.outTanXY = (1.0, 0.0)
        self.load(idx)
    
    def load(self, idx):
        self.timeobj = self.curveobj.input(idx)
        self.time = self.timeobj.value
        self.value = self.curveobj.value(idx)
        self.inTanWT = self.curveobj.getTanAngleWeight(idx, True)
        self.inTanXY = self.curveobj.getTanXY(idx, True)
        self.outTanWT = self.curveobj.getTanAngleWeight(idx, False)
        self.outTanXY = self.curveobj.getTanXY(idx, False)
        

class AnimOffset(object):

    def __init__(self):
        super(AnimOffset, self).__init__()
        self.keydict = {}
        self.curveList = []
        self.setAnimCurves()

    def setAnimCurves(self):
        """
        :return: None
        Sets the animCurves for the selection
        """
        self.curveList = []
        animCurves = aou.extractAnimCurves(aou.getAllLinkedObjs())
        cmds.select(animCurves)
        selectionList= om.MGlobal.getActiveSelectionList()
        if selectionList.length()>0:
            kd = {}
            iterator = om.MItSelectionList(selectionList, om.MFn.kDagNode)
            while not iterator.isDone():
                # iterator.getDependNode() returns mobj. we're forcing a AnimCurve Obj
                curve = oma.MFnAnimCurve(iterator.getDependNode())
                kd[curve] = []
                for k in range(curve.numKeys):
                    kd[curve].append(KeyFrame(curve, k))
                self.keydict.update(kd)
                self.curveList.append(curve)
                iterator.next()


    def offsetAnimCurves(self, offset):
        """
        :param curve:
        :return:
        """
        for curve, keys in self.keydict.items():
            pass
            #pick up here
            if offset >= 0:
                keys.sort(reverse=True)
            for key in keys:
                curve



