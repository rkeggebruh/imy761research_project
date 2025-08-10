extends Node

# ------------------------------- LAMP -------------------------------
var lampFirstInteraction = false
var lampCorrect = false
var inLamp = false
var lampInstructionInput = "What is lamp in Spanish?"
var lampCanBeSwitchedOn = false

var lampFillInLettersTimeOn = false
var letterLampLCorrect = false
var letterLampACorrect = false
var lampFillInLettersOnCorrect = false

var lampTurnOff = false
var lampFillInLettersTimeOff = false
var letterLampACorrectOff = false
var letterLampRCorrectOff = false
var lampFillInLettersOffCorrect = false

# ------------------------------- BOOMBOX -------------------------------

var boomBoxFillInLettersTimeOn = false
var letterRadioACorrect = false
var letterRadioDCorrect = false
var radioOn = false
var boomBoxFillInLettersOnCorrect = false

var boomBoxFillInLettersTimeOff = false
var letterRadioLCorrectOff = false
var letterRadioRCorrectOff = false
var letterRadioOCorrectOff = false
var boomBoxFillInLettersOffCorrect = false

# ------------------------------- COUCH RIGHT -------------------------------

var CRFillInLettersTimeSleep = false
var letterCRCorrectL = false
var letterCRCorrectO = false
var sleepRight = false
var CRFillInLettersTimeSleepCorrect = false

var cappySleeping = false


# ------------------------------- TV -------------------------------
var inTV = false
var TVFirstInteraction = false
var TVINstructionInput = "What is TV in Spanish?"

var TVFillInLettersCorrect = false
var TVFillInLettersCorrectOff = false

var FillInTVLetterTime = false
var letterETVCorrect = false
var letterNTVCorrect = false

var letterTTVCorrectOff = false
var letterLTVCorrectOff = false
var letterITVCorrectOff = false

var tvOn = false
var FillInTVLetterTimeTVOFF = false


# ------------------------- CAPPY MOVEMENT -------------------------

var is_in_dialog: bool = false

var otterMoving = false
var otterSpeed = 0.09
