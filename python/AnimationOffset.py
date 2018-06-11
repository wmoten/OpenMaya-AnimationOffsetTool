import os
import json
import maya.api.OpenMaya as om
import maya.api.OpenMayaAnim as oma

class AnimOffset(object):

    def __init__(self):
        super(AnimOffset, self).__init__()
        self.keydict = {}
        self.offsetAbleObjects = []
        self.mfnDepList = []
        #{name:[list, of, open, maya, anim, curves]}


    def getSelectedObjsInScene(self):
        """
        :return: self.mfnDepList
        """
        selectionList= om.MGlobal.getActiveSelectionList()
        if selectionList.length()>0:

            iterator = om.MItSelectionList(selectionList, om.MFn.kDagNode)

            while not iterator.isDone():
                # iterator.getDependNode() returns mobj. we're forcing a mfnDependency Obj
                self.mfnDepList.append(om.MFnDependencyNode(iterator.getDependNode()))

                iterator.next()

        return self.mfnDepList


    def getObjsAnimCurves(self, obj):
        """
        :param obj: OpenMaya.MFnDependencyNode
        :return: list of Anim Curves
        """
        animCurves = []
        for connection in obj.getConnections():
            if oma.MAnimUtil.isAnimated(connection):
                animCurves.append(oma.MFnAnimCurve(connection.source()))

        return animCurves



    def getEligibleAnimCurves(self):

        for obj in offsetableObjects:
            pass

