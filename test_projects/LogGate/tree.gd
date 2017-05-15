extends Node
var root #root-node
var nodes=[] #Array

func _init(node):
	root = node
	nodes.append(node)
	pass

func getNodes():
	return nodes

func getNode(id):
	for n in nodes:
		if (id == n.getID()):
			return n
	return null #change null to try block

func changeNode(id, node):
	for n in nodes:
		if (id == n.getID()):
			n = node
			return true
	return false

func getRoot():
	return root

func isFree(node):
	return node.isFree()

func isLFree(node):
	return node.isLeftChildFree()
	
func isRFree(node):
	return node.isRightChildFree()

func addNode():
	nodes.append(node)
	if (root):
		m 
