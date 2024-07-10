[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/_dVpKF01)
# AoP SS2024 - Übungsblatt 10

"_Place (offiziell `r/place`) ist ein wiederkehrendes Gemeinschaftsprojekt und soziales Experiment des sozialen Netzwerks Reddit._

_Registrierte Benutzer können auf der Seite ein Pixelfeld bearbeiten, indem sie die Farbe eines einzelnen Pixels durch Auswählen aus einer 16-Farben-Palette ändern. Nachdem ein Pixel platziert wurde, hindert ein Timer den Benutzer für einen Zeitraum von 4 bis 5 Minuten daran, weitere Pixel zu platzieren._

_Das erste Experiment wurde am 1. April 2017 von Reddit-Administratoren als Aprilscherz gestartet und etwa 72 Stunden nach seiner Erstellung am 3. April 2017 beendet. Über 1 Million Benutzer bearbeiteten die Leinwand und platzierten insgesamt etwa 16 Millionen Kacheln. Als das Projekt beendet wurde, waren über 90.000 Benutzer aktiv._"

https://de.wikipedia.org/wiki/Place_(Reddit) 


![The canvas in 2023 on the last day of the event](./R-place_2023_final.jpg)
#### Abbildung 01: Der Canvas 2023 kurz vor Ende des Events. (Bildquelle: https://en.wikipedia.org/wiki/R/place)


Im Rahmen dieses Übungsblatts soll eine simple Version von `r/place` (ohne Timer und mit kleinerem Canvas) nachgebaut werden. Im Repository findet sich ein kurzes Video mit einer möglichen Lösung.

Die fertige App könnte z.B. so aussehen:

![Beispiel für den Canvas Screen](./canvas.png)
#### Abbildung 02: Der Canvas Screen (mit Logout Button in der AppBar, Canvas und Farbpalette).

## Backend

Für das Backend kann `Firebase` oder ein anderer vergleichbarer Anbieter benutzt werden.

### Login, SignUp und Logout

Die App soll nur für registrierte User nutzbar sein.
Daher muss die App sowohl einen funktionierenden SignUp- also auch einen SignIn-Screen enthalten.

Außerdem muss es eine Möglichkeit geben, sich wieder auszuloggen.

### Cloud Datenbank

Da alle User der App auf dem gleichen Canvas malen, muss es im Backend eine Möglichkeit zum Speichern der Farben der einzelnen Pixel geben.
In Code der Beispiel-App im Video wurde eine `Firestore Database` verwendet. Diese enthält eine Collection `pixels`, die wiederum für jeden bereits einmal gesetzten Pixel ein Document enthält. Die Beispiel-App zeigt ein 10x10 Grid an Pixeln an. Jedem Pixel wurde eine fortlaufende ID zugewiesen, mit der das entsprechende Document eindeutig in der Collection identifiziert werden kann.
Jedes Document enthält dann wiederum den Farbwert des Pixels als Key-Value-Paar.

Beim Klick auf einen Pixel auf dem Canvas in der App wird der zugehörige Eintrag in der Cloud Datenbank aktualisiert.

Alle Documents in der Collection werden über einen Stream im Frontend automatisch jedes Mal abgerufen, wenn sich an den Daten etwas geändert hat.


## Frontend

### Screens und Navigation

Die App muss mindestens die folgenden Screens enthalten:
- Login Screen
- SignUp Screen
- Canvas Screen

Der Canvas Screen darf nur für erfolgreich eingeloggte User erreichbar sein.
Beim Logout soll sich automatisch sofort der Login Screen wieder öffnen.


### Der Canvas

Auf dem Canvas-Screen soll eine Farbpalette mehrere Farben zur Auswahl anbieten.
Es soll im UI klar ersichtlich sein, welche Farbe gerade ausgewählt wurde.

Der eigentliche Canvas besteht in der Beispiel-App im Video aus 10x10 "Pixeln", wobei jeder "Pixel" eigentlich nur ein `Container` Widget in einem `GridView` ist.

Beim Klick auf einen "Pixel" wird dieser in der aktuell ausgewählten Farbe eingefärbt.
Diese Farbänderung wird auch gleichzeitig in der Cloud Datenbank persistiert.

Wird auf einem zweiten Gerät ein Pixel umgefärbt, so sind diese Änderungen auch unmittelbar auf dem eigenen Gerät zu sehen (siehe Video im Repository).


## Weitere Anforderungen

Neben dem Quellcode soll dieses Mal auch eine APK-Datei mit abgegeben werden (siehe Vorlesung 11).
Es reicht, diese vor der Abgabe mit in das Repository hochzuladen.

Es gelten die gleichen Regeln wie bei Übungsblatt 09 für das Arbeiten im Team mit Git und GitHub (Branches, Pull Requests, etc.).

Die Aufgabenverteilung im Team muss im folgenden Abschnitt dokumentiert werden.

## Dokumentation der Aufgabenverteilung

Aufgaben Teammitglied 1: {Name hier einfügen}
- {Aufgabe 1}
- {Aufgabe 2}
- {Aufgabe 3}
- {Aufgabe 4}
- {...}

Aufgaben Teammitglied 2: {Name hier einfügen}
- {Aufgabe 1}
- {Aufgabe 2}
- {Aufgabe 3}
- {Aufgabe 4}
- {...}


## Checkliste für das Übungsblatt

- [ ] In der App kann man sich als User mit E-Mail Adresse und Passwort registrieren.
- [ ] Nach Registrierung ist auch ein Login mit den gleichen Daten möglich.
- [ ] Der Canvas Screen ist nur als eingeloggter User erreichbar.
- [ ] Auf dem Canvas Screen soll man sich auch wieder aus der App ausloggen können. 
- [ ] Es gibt eine Farbpalette mit mehreren Farben. Es ist im UI klar ersichtlich, welche Farbe gerade ausgewählt ist.
- [ ] Der "Canvas" besteht aus 10x10 (oder mehr) "Pixeln", die durch Klick eingefärbt werden können.
- [ ] Änderungen am Canvas sind für alle User der App, auch auf verschiedenen Smartphones sofort sichtbar (sofern natürlich eine Internetverbindung besteht).
- [ ] Die App soll durchwegs korrektes Error Handling umsetzen. Egal ob fehlende Internetverbindung, falsches Passwort beim Login, etc. Der User soll stets bei Problemen mit nicht-technischen und klar verständlichen Beschreibungen über diese informiert werden.
- [ ] Im Repository findet sich neben dem Code eine APK-Datei der fertigen App
- [ ] Alle in der App angezeigten Widgets und Screens sind ansprechend formatiert (Text "klebt" nicht am Rand, etc.).
- [ ] Die App darf nicht abstürzen oder "einfrieren".
- [ ] Der Code ist modular aufgebaut, angemessen kommentiert und korrekt formatiert. Toter oder doppelter Code wurde vor der Abgabe entfernt.
- [ ] Die Aufgabenverteilung im Team ist fair (beide Teammitglieder erledigen ca. 50% der Arbeit. **Nicht**: _"A hat nur das Design gemacht und B den Rest"_).
- [ ] Die Aufgabenverteilung im Team wurde in dieser Readme-Datei dokumentiert.
- [ ] Alle Features wurden auf eigenen Feature-Branches implementiert.
- [ ] Für Branches mit fertig implementierten Features wurden Pull-Requests gestellt, aber nicht selbst beantwortet.
- [ ] Alle relevanten Branches wurden auf den main-Branch gemerged (**Wichtig:** Nur der Code auf diesem Branch wird bewertet!).
- [ ] Alle Änderungen am Code sind durch regelmäßige Commits mit aussagekräftigen Commit-Messages dokumentiert und auf das Remote Repository auf GitHub gepusht worden.
- [ ] Im User Interface dürfen keine Overflow Warnungen (orange Warnstreifen) angezeigt werden.


## Optionale Erweiterungen

- Ein Timer wie beim originalen `r/place`, der nur alle X Sekunden eine Änderung am Canvas erlaubt
- Anzahl der geänderten Pixel je User in der Cloud Datenbank protokollieren.
- Eure eigenen Ideen für Erweiterungen :)