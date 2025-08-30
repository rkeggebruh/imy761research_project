extends Node2D


func _ready():
	$coatRackLine.hide()
	$tableLine.hide()
	$couchLine.hide()
	$lampLine.hide()
	$paintingLine.hide()
	$lampCount.hide()
	$couchCount.hide()
	$tableCount.hide()
	$paintingCount.hide()
	$coatRackCount.hide()
	$lampCount2.hide()
	$couchCount2.hide()
	$tableCount2.hide()
	$paintingCount2.hide()
	$coatRackCount2.hide()


func _process(_delta):
	if State.coatRackFillInLettersOnCorrect:
		$coatRackCount.show()
	if State.CRFillInLettersTimeSleepCorrect:
		$couchCount.show()
	if State.lampFillInLettersOnCorrect:
		$lampCount.show()
	if State.TVFillInLettersCorrect:
		$tableCount.show()
	if State.boomBoxFillInLettersOnCorrect:
		$paintingCount.show()
	
	
	if State.twiceCoatRack:
		$coatRackLine.show()
		$coatRackCount2.show()
	if State.twiceLamp:
		$lampLine.show()
		$lampCount2.show()
	if State.twiceTv:
		$tableLine.show()
		$tableCount2.show()
	if State.twiceCouch:
		$couchLine.show()
		$couchCount2.show()
	if State.twiceRadio:
		$paintingLine.show()
		$paintingCount2.show()
