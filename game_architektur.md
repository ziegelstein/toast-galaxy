# Spielarchitektur
Jetzt, da wir keinen Zeitdruck mehr haben, wäre ich der Idee nicht abgeneigt, den Code den wir haben, in eine schönere Struktur zu bringen, als sie jetzt vorliegt. Das wäre natürlich mit mehr Aufwand verbunden, allerdings hätte das ganze auch einige Vorteile. Der Code wäre im Idealfall in Zukunft leichter wartbar, wir könnten einfacher neue Funktionen hinzufügen, und den Code vll. auch irgendwann mal vorzeigen. Ob wir die Architektur verändern / eine grundlegende Architektur einführen, würde ich an der Motivation der Leute, die mitmachen, festmachen.

Die Grundidee hinter der Architektur die mir vorschwebt ist, jede Funktion bzw. jedes Feature soweit wie möglich zu kapseln und diese von einem Singleton verwalten zu lassen. Wie genau ein Feature umgesetzt wird, ist dem Programmierer überlassen, wichtig ist nur das es über eine festgelegte Schnittstelle verfügt. Sollten weitere Designgrundsätze notwendig werden, können wir die natürlich mit einarbeiten / aufzählen. Weitere Grundsätze sollten wohlüberlegt sein, um einer Überfrachtung vorzubeugen.
![Skizze Architektur](https://i.imgur.com/oLcCgOt.png)

## Komponenten
In der Grafik oben habe ich einige Komponenten der Architektur skizziert. Die Einteilung von Module, Processor und Interface ist bisher eher lose und basiert noch nicht ganz auf einem soliden Konzept, ich hatte mich dabei grob an [Modell-View-Presenter](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93presenter) orientiert. Die genannten *Kategorien* sind allerdings eher alls übergeordnete Gruppe gedacht, die eigentliche Logik wird in *Features* untergebracht.
### Feature
Ein Feature ist die Summe von (Sub-)Szenen, Nodes, Scripts und sonstigen Ressourcen, die eine Funktion (ein Feature) im Spiel repräsentieren. Ein Feature hat immer ein Parentscript. welches als eine Art [Facade](https://en.wikipedia.org/wiki/Facade_pattern) fungiert. In diesem Parentscript sollen alle nach außenhin verfügbaren *Interface_Functions* und Variablen ansteuerbar (und beschrieben) sein. Die Logik sollte im Idealfall jedoch dahinter stattfinden.
*Ich selbst finde den Namen noch nicht sonderlich gelungen und würde mich über Verbesserungsvorschläge freuen.*
#### Interface_Functions
Interface_Functions sind Functionen die im Parentscript eines *Features* stehen und vom *Global* angesteuert werden können. Jede Interface_Function sollte öffentlich dokumentiert werden, mit erwartbaren Übergabeargumenten und erwartbaren Functionsreturn.
### Global
Die Global Szene enthält alle Nodes des Spiels. Er ist ein [Singleton Object](https://en.wikipedia.org/wiki/Singleton_pattern) und fungiert als [Mediator](https://en.wikipedia.org/wiki/Mediator_pattern) zwischen allen weiteren Features. D.h. Ein Request von Feature A zu Feature B läuft immer über die Globale Szene. Die Globale Szene gehört keiner Kategorie an.
### Kategorie
Eine Kategorie beschreibt infach eine Gruppe *Features* mit ähnlicher Funktion. *Es ist noch fraglich ob diese Einteilung überhaupt in Codeform stattfindet, da der Datenfluss eigentlich sowieso über das Global laufen sollte.* 
### Module
Enthält alle Features, die ein Spielelement und seine Daten in Codeform repräsentieren. Spielelemente wären soetwas wie die Station und ihre Ressourcen, Capsules (Stations_Module), Research usw. Module sollten immer eine Möglichkeit beinhalten eine neue Repräsentation dieses Moduls (z.b. eine neue Capsule, eine neue Forschung usw.) zu erzeugen und alle Repräsentation die im Spiel vorhanden sind aufzulisen. 
### Processor
Processor sind vorallem Util Features, die zur Erfassung, Aufbereitung und Verarbeitung von Daten genutzt werden. Beispiele für mögliche solcher Features wären ein *Config_Parser* für .json oder .csv Dateien, ein *Var_Finder* der die Module nach einem Key/Value Paar durchsucht und dieses zurück gibt, oder ein *Cycle_Changer* Feature, das die Datenverarbeitung beim Tages/Cyclewechsel durchführt. Die *Interface_Functions* dieser Features sollten möglichst flexibel und allgemein gehalten werden.
### Interface
Die Features, die der Interface-*kategorie* zugeordnet werden, bilden alle Funktionen ab, die das Benutzerinterface steuern, darstellen und verändern. Außerdem gehören zu dieser *Kategorie* alle *Features*, die Benutzereingaben entgegennehmen und für die weitere Verarbeitung aufbereiten.
*Auch dieser Name ist nicht wirklich sehr gut, ein besserer Vorschlag wird erhofft.*