# Code Konventionen
Der bisherige Code ist diesbezüglich leider etwas Inkonsistent (was durchaus auch meine Schuld ist). Im folgenden schlage ich einige Code Konventionen vor, um den von uns produzierten Code einheitlicher zu machen.
## Allgemeine Code Konventionen
- **Worttrennung durch Unterstriche** Die Worte aller Bezeichner werden durch Unterstriche getrennt. z.b. *Some_Random_Node* oder *another_random_function()*
- **Nodes, Scripts, Scenes und Ressourcenamen werden Groß geschrieben**
- **Objekte, funcs und Variablennamen werden klein geschrieben**
- **Konstantennamen werden in CAPSLOCK geschrieben** (Kann auch genutzt werden um anzuzeigen das eine Variable nach erzeugung ihren Wert nicht mehr ändern wird)
- **Der Name sollte selbsterklärend sein** Der Name einer/s Nodes/Scripts/Scene/Variable/Konstante/Ressource sollte (grob) die Funktion derselbigen beschreiben.
- **Alle Namen und Kommentare werden in Englisch verfasst**
- **Jedes Script soll zu Beginn einen Kommentar mit einer Beschreibung des Scripts enthalten**
- **Jede komplexere func soll eine Beschreibung enthalten** Als Faustregel gilt eine func Komplex wenn sie mehr als drei Zeilen Code enthält. In der Beschreibung soll stehen was die *func* macht, welche Argumente sie übergibt und welche sie braucht.
- **Liste werden immer im Plural (mit s am Ende) geschrieben, Elemente aus Listen immer im Singular (ohne s am Ende)**
## Allgemeine Bezeichner
Im folgenden eine Liste für Bezeichner (namen) die für bestimmte Komponenten des Codes genutzt werden können.
### Scripte und Nodes
- **_Factory** Ein Script in dem Exemplare eines Features erzeugt werden.
- **_Interface**
### funcs
- **has_**  Überprüft ob ein Element mit dem übergebenden Bezeichner (oder Key) vorhanden ist. Gibt einen Bool zurück
- **is_** Überprüft ob eine Variable den übergebenen Wert hat. Kann evtl. auch ein Key/Value Paar verarbeiten. Gibt einen Bool zurück
- **add_** Fügt einer Liste (Dict oder Array) einem Wert hinzu. Ist der Key noch nicht vorhanden, wird ein neues Key/Value Paar erzeugt. 
- **set_** Setzt den Wert einer Variable auf den des übergebenen arguments.
- **get_** Übergibt den Wert einer Variable
### Variablen
- **_key / _value** Identifiziert den Key und den Value eines Dicts o.ä.