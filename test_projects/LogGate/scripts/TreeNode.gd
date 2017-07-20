extends Node

var content
var id = 0
var isRoot = false
var parent = null
var child1 = null
var child2 = null

func _init(parent, content):
	"parent either parent element or bool, content = content element"
	this.id = this.getWeight(0)
	if (parent == null):
		isRoot = true
	else:
		this.parent = parent
	this.content = content

func addNode(content):
	if (child1 == null):
		child1 = TreeNode.new(this, content)
	elif (child2 == null):
		child2 = TreeNode.new(this, content)
	else:
		if (child1.getWeight(0) >= child2.getWeight(0)):
			child1.addNode(content)
		else:
			child2.addNode(content)
	
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
	
func getWeight(preWeight):
	if (isLeftChildFree() == true && isRightChildFree() == true):
		return preWeight + 1
	elif (isRightChildFree() == true):
		return child2.getWeight(preWeight + 1)
	else:
		return child1.getWeight(preWeight + 1) + child2.getWeight(preWeight + 1)