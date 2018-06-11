import os
import json
import maya.api.OpenMaya as OM
import maya.api.OpenMayaAnim as OMA

class AnimOffset(object):

    def __init__(self):
        self.keydict = {}
        self.offsetableObjects = []
        self.mfnDepList = []
        #{name:[list, of, open, maya, anim, curves]}


    def getSelectedObjsInScene(self):
        """
        :return: self.mfnDepList
        """
        selectionList= OM.MGlobal.getActiveSelectionList()
        if selectionList.length()>0:

            iterator = OM.MItSelectionList(selectionList, OM.MFn.kDagNode)

            while not iterator.isDone():
                #iterator.getDependNode() returns mobj. we're forcing a mfnDependency Obj
                self.mfnDepList.append(OM.MFnDependencyNode(iterator.getDependNode()))

                iterator.next()

        return self.mfnDepList


    def getObjsAnimCurves(self, obj):
        """
        :param obj: OpenMaya.MFnDependencyNode
        :return: list of Anim Curves
        """
        animCurves = []
        for connection in obj.getConnections():
            if OMA.MAnimUtil.isAnimated(connection):
                animCurves.append(OMA.MFnAnimCurve(connection.source()))

        return animCurves



    def getEligibleAnimCurves(self):

        for obj in offsetableObjects:
            pass

