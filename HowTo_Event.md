#Events
Hallo. Ich habe ein grobes Modell für Ingame Events fertig geschrieben. Dieses ist relativ flexible und auch recht mächtig, allerdings benötigen wir einige Angaben, um Events ordentlich in das System einpflegen zu können. Daher findet sich im folgenden ein kleines Tutorial, wie gute Events geschrieben werden.

##Notation
**Fettgeschriebene Elemente** sind **IMMER** für ein Event nötig.
*Kursivgeschriebene Elemente* sind *optional*
normalgeschriebene Elemente sind idr. intern und müssen nicht angegeben werden.
Eine Variable = ein Element

##Das Event
Das Event ist die Grundlage des Eventsystems, jeden Cyclechange (Tages/Rundenwechsel) besteht die Möglichkeit ein Event zu erzeugen.
Ein Event besteht aus einigen Grundvariablen, einigen Unterkomponenten und einigen internen Variablen (Die hier nicht weiter erwähnt werden).
###Eventvariablen
- **name** Der Name des Events, sollte nach Möglichkeit einzig artig sein, und wird immer benötigt.
- **desc** Die Beschreibung oder Geschichte des Events, ein einfacher String (unformatierter Text). Wird immer benötigt.
- **message** Eine Nachricht die geschrieben wird sobald das Event "beendet" ist.
###Eventkomponenten
- *requierements* Eine Liste aller Bediengungen, die Erfüllt sein müssen, damit das Element "gezogen" werden kann. Kann leer bleiben wenn es keine Bediengungen gibt. Mehr Informationen zu [requierements](#requierements).
- *outcomes* Eine Liste aller Folgen, die durch das Event erzeugt werden. Kann leer bleiben, wenn das Event keine Folgen hat. Wird nicht aktiviert wenn das Event über **Optionen** verfügt. Mehr Informationen zu [outcomes](outcomes).
- *eventOptions* Eine Liste aller Auswahlmöglichkeiten, die in diesem Event möglich sind. Kann Leer bleiben wenn es keine Optionen gibt. Mehr Informationen zu [Optionen](#Options).
- *weight* Das Gewicht eines Events, bestimmt wie oft ein Event in der Liste aller verfügbaren Events vorkommt (ist das weight=1 kommt es einmal in der Liste vor, ist das weight = 2, kommt es zweimal vor usw.)

##requierements
Ein Requierement ist eine Bedingung die Erfüllt sein muss damit ein Event überhaupt in die Liste der möglichen Events kommt. Ein Requierment kann Grundsätzlich (nahezu) alle Variablen abfragen, die im Globalen "Singleton" gespeichert werden. Ein Requierement hat folgende Variablen, die (fast immer) angegeben werden müssen:
### requierementvariablen
- **valuekey** Die "Eigenschaft", die Überprüft werden soll, wenn z.b. die Geldmenge überprüft werden soll, wäre der Wert "money", wenn die Verdächtigkeit überprüft werden soll, "heat" usw. (*Eine Vollständige Liste aller Keys und deren Values wird beizeiten noch geschrieben.*)
- **value** Der "Wert" auf den hin geprüft werden soll. Wenn der Spieler z.b. mehr als 3000 Uron braucht, wäre der Value -> 3000, wenn er eine Werkstatt gebaut haben muss -> "workshop".
- *valuetype* Die Art des values, also ob es eine Ressource ist, ein Station_Stat, ein Module oder ein sonstiger Wert. Wäre schön wenn das angegeben wird, ist aber kein muss. (Muss dann halt nen Programmierer raussuchen)
- **operator** Der Operator auf den hin geprüft wird. Ist immer als Zahl angegeben, eine 0 überprüft ob der angegebene Value größer als der Wert des Spielers ist, eine 1 überprüft ob der Wert kleiner ist und eine 2 überprüft ob der Wert übereinstimmt.
- **weight** Das "Gewicht" eines requierements, wenn das requierement erfüllt wird erhöht sich die Wahrscheinlichkeit des Events, das es vorkommt. Die Summe aller weights wird am Ende gemittelt


##outcomes
Outcomes bestimmen die Folgen eines Events. Mit einem Outcome kann man eine Variable aus allen Variablen des globalen Singletons verändern. Ein Outcome hat folgende Variablen:
###outcomevariablen
- **valuekey** Die "Eigenschaft", die verändert werden soll. Wenn das Geld vom Spieler verändert werden soll, z.b. "money", die Verdächtigkeit wäre "heat" usw. (*Eine Liste mit allen globalen Values wird beizeiten noch angelegt*)
- **value** Der Wert, um die die Eigenschaft verändert werden soll.
- *valuetype* Der Typ der Eigenschaft die verändert werden soll. 0 sind ressourcen, 1 sind station_stats, 2 sind die module und 3 sind andere variablen. Ist für die Interne Abfrage nötig, wenn der valuetype nicht bekannt ist, kann er ausgelassen werden (ein programmierer sucht dann den richtigen typ raus).
- **operator** Bestimmt wie die Eigenschaft verändert wird. 0 heißt das der value addiert wird, 1 heißt das der value abgezogen wird, 2 heißt das der bisherige Wert der Eigenschaft durch den Value geteilt wird, 3 heißt das der bisherige Wert der Eigenschaft mit dem Value multipliziert wird und 4 heißt das die der bisherige Wert der Eigenschaft durch den value ersetzt wird.
- *message* Die Nachricht die erscheinen soll, wenn ein Outcome erfüllt wurde.

##Options
Eine Option ist eine Wahlmöglichkeit eines Events. Sollte keine der Wahlmöglichkeiten möglich sein, da die Bedingungen der Wahlmöglichkeiten nicht erfüllt wurden, wird das normale "outcome" eines Events ausgeführt. Wenn eine Bedingung eines Events gewählt wird, wird widerum nur das Outcome der Bedingung ausgeführt. Im folgenden die Variablen einer Option:
###Optionvariablen
- *outcomes* Liste aller [Outcomes](#outcomes), die vollbracht werden, wenn diese Option gewählt wird.
- *requierments* Liste aller [Bedingungen](#requierments), die erfüllt sein müssen, damit diese Option überhaupt auswählbar ist.
- **name** Name der Option, sollte einzigartig sein
- **desc** Beschreibung der Option, der Text der Angezeigt wird, um die Option textlich darzustellen.
- **message** Nachricht, die angezeigt wird, wenn diese Option gewählt wird.
