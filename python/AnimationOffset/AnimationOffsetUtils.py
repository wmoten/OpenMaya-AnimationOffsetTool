
from maya import cmds
import json
import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


def updateJson(path, newDict):

    with open(path, 'r') as readFile:
        try:
            openedFile = json.load(readFile)
        except Exception as e:
            logger.debug(e)
            openedFile = {}

        openedFile.update(newDict)

    with open(path, 'w') as writeFile:
        json.dump(openedFile, writeFile)

def getParents(node, checked=None):
    """Returns all connected ancestors of a given node"""
    if not checked:
        checked = []
    ancestors = []
    checked.append(node)
    parents = cmds.listRelatives(node, ap=True)
    if parents:
        for parent in parents:
            if parent not in checked:
                checked.append(parent)
                ancestors.append(parent)
                ancestors += getParents(parent, checked=checked)
    return ancestors

def getChildren(node, checked=None):
    if not checked:
        checked = []
    children = []
    checked.append(node)
    childrenlist = cmds.listRelatives(node, c=True)
    if childrenlist:
        for child in childrenlist:
            if child not in checked:
                checked.append(child)
                children.append(child)
                children += getChildren(child, checked=checked)

    return children

def getConnections(node, checked=None):
    if not checked:
        checked = []
    conn = []
    checked.append(node)
    connlist = cmds.listConnections(node, skipConversionNodes=True)
    if connlist:
        for c in connlist:
            if c not in checked and not cmds.objectType(c).startswith('animCurve'):
                checked.append(c)
                conn.append(c)
                conn += getConnections(c, checked=checked)
    return conn

def getAllLinkedObjs():
    nodes = cmds.ls(sl=True)
    linkedObjs = {}

    for node in nodes:
        linkedObjs[node] = {}
        children = getChildren(node)
        parents = getParents(node)
        connections = getConnections(node)
        linkedObjs[node].update({"connections" : {c : cmds.listConnections(c, t='animCurve') for c in connections}})
        linkedObjs[node].update({"children"    : {c : cmds.listConnections(c, t='animCurve') for c in children}})
        linkedObjs[node].update({"parents"     : {p : cmds.listConnections(p, t='animCurve') for p in parents}})

    return linkedObjs

def extractAnimCurves(items, curveList=[]):
    """
    takes any dictionary and returns the animation curves inside
    """
    for key, val in items.items():
        if cmds.objExists(key):
            if cmds.objectType(key).startswith('animCurve') and key not in curveList:
                curveList.append(key)

        if val is None:
            continue
        if type(val) is dict:
            curveList = extractAnimCurves(val, curveList)

        elif type(val) is list:
            for v in val:
                if not cmds.objExists(v):
                    continue
                if cmds.objectType(v).startswith('animCurve') and v not in curveList:
                    print "v"
                    curveList.append(v)

        elif type(val) is str:
            v = val
            if not cmds.objExists(v):
                continue
            if cmds.objectType(v).startswith('animCurve') and v not in curveList:
                curveList.append(v)
            
    return curveList

def getObjAttributes(obj, userDefined=False):

    obj = cmds.ls(obj, long=True)[0]
    newDict = {obj:[]}
    for attr in cmds.listAttr(obj, ud=userDefined):
        newDict[obj].append(attr)

    return newDict
