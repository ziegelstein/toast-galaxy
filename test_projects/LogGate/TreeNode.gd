extends Node

var content
var id = 0
var isRoot = false
var parent = null
var child1 = null
var child2 = null

func _init(id, parent, content):
	"id = number, parent either parent element or bool, content = content element"
	this.id = id
	if (parent == true):
		isRoot = parent
	else:
		this.parent = parent
	this.content = content

func addChild(child):
	if (child1 == null):
		child1 = child
	elif (child2 == null):
		child2 = child
	else: return false
	return true
	
func removeChild():
	if (child2 != null):
		child2 = null
	elif (child1 != null):
		child1 = null
	else: return false
	return true

func getID():
	return id
	
func isRoot():
	return isRoot

func getChilds():
	return [child1,child2]

func getLeftChild():
	return child1

func getRightChild():
	return child2
	
func changeLeftChild(child):
	if (child1 == null):
		child1 = child
		return false
	else:
		child1 = child
		return true
		
func getParent():
	return parent

func changeParent(node):
	if (isRoot == true):
		return false
	else: parent = node

func getContent():
	return content
	
func isFree():
	if (child1 == null || child2 == null):
		return true
	else: return false
	
func isLeftChildFree():
	if (child1 == null):
		return true
	return false
	
func isRightChildFree():
	if (child2 == null):
		return true
	return false
	
func changeContent(content):
	return content