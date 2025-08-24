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


# ------------------------------- COAT RACK -------------------------------

var coatRackFillInLettersTimeOn = false
var lettercoatRackPCorrect = false
var lettercoatRackRCorrect = false
var coatRackFillInLettersOnCorrect = false

var coatRackFillInLettersTimeOff = false
var lettercoatRackECorrectOff = false
var lettercoatRackOCorrectOff = false
var coatRackFillInLettersOffCorrect = false

# ------------------------------- COUCH RIGHT -------------------------------

var CRFillInLettersTimeSleep = false
var letterCRCorrectL = false
var letterCRCorrectO = false
var sleepRight = false
var CRFillInLettersTimeSleepCorrect = false


var CRFillInLettersTimeSleepTwo = false
var letterCRCorrectLTwo = false
var letterCRCorrectfTwo = false
var CRFillInLettersTimeSleepCorrectTwo = false

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

var instructionsShowing = true
var hideInstructions = false
var showSecond = false
var showSecondInstruction = false

# ------------------------ INPUT CONTROLS -----------------------------

var twiceRadio = false
var twiceLamp = false
var twiceTv = false
var twiceCoatRack = false
var twiceCouch = false

var paintingPurchased = true
var lampPurchased = true
var couchPurchased = true
var tablePurchased = true
var coatRackPurchased = true
