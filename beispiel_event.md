//Mit erklärenden Kommentaren
Event:
Name: "Beispiel Event"
Desc: "Dies ist ein Beispiel Event. Es soll einen möglich großen Umfang an Optionen aufzeigen, muss aber Inhaltlich keine Maßstäbe setzen. Mit anderen Worten, langsam werde ich doch Müde."
Message: "Dieses Event wurde ihnen präsentiert von: Einem Ziegelstein. Mit Space ist alles besser."

Requierements: reqA, reqB, reqC
weightmodifiers: weigmodA, weigmodB
outcomes: outA, outB, outC
options: optA, optB

Requierements:
reqA:
  valuekey: "money"
  value: 40 //Zahlen ohne Anführungsstriche
  valuetype: 1
  operator: 0
reqB:
  valuekey: "lifesupport-avaible" //Es gäbe noch lifesupport-total, das wäre der freie Lifesupport + der "besetzte"
  value: 5
  valuetype: 0
  operator: 0
reqC:
  valuekey: "non-existing-key"
  value: false //Ist ein Bool -> Wahrheitswert
  valuetype: 3
  operator: 2 // Bei Bools macht es fast nur Sinn zu vergleichen
reqD: //reqD ist das Requierment von "weigmodA"
  valuekey: "heat"
  value: 3
  valuetype: 1
  operator: 1
reqE:
 valuekey: "title"
 value : "König"
 valuetype: 3
 operator: 2




weightmodifiers:
weigmodA:
 requierement: reqD
 weightgain: 10
weigmodB:
 requierement: null
 weightgain: -3

outcomes:
outA:
 valuekey: "money"
 value: 3
 valuetype: 1
 operator: 0
 message: "Du hast Geld bekommen"
outB:
 valuekey: ""
 value 0
 valuetype: 0
 operator: 0
 message: "man kann auch 'leere' outcomes erzeugen"
outC:
 valuekey: "heat"
 value: 3
 valuetype: 1
 operator: 1
 message: "" //oder leere Nachrichten.
outD:
 valuekey: "money"
 value: -2000 //negative Zahlen sind auch möglich
 valuetype: 1
 operator: 0
 message: "du hast -2000 Geld verdient!"
outF:
 valuekey: "title"
 value: "König"
 valuetype: 3
 operator: 4
 message:"Wenigstens bist du jetzt König!"

options:
optA:
 outcomes: //Da die Outcomes leer sind, werden einfach die Outcomes vom Event ausgeführt
 requierements: reqE
 name: "Königsweg"
 desc: "Du bist halt einfach der King"
 message: "Der König hat entschieden"
optB:
 outcomes: outD, outF
 requierements:
 name: "Holzweg"
 desc: "Du bist eher so nen Bauer"
 message: "Du Esel!"
