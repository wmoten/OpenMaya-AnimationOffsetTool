
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


def getSelected():

    return cmds.ls(selected=True)


def getObjAttributes(obj, userDefined=False):

    obj = cmds.ls(obj, long=True)[0]
    newDict = {obj:[]}
    for attr in cmds.listAttr(obj, ud=userDefined):
        newDict[obj].append(attr)

    return newDict
