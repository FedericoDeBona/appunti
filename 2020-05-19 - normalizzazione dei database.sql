/*
Normalizzazione di database

Forme normali:
- 1NF
- 2NF
- 3NF
- ...

Obbiettivo:
	- evitare le RIDONDANZE
				|
				V
	- evitare INCONSISTENZE dei dati

Per risolvere i seguenti problemi:
	- ANOMALIE 
		- di aggiornamento
		- di inserimento
		- di cancellazione

1NF -> Prima Forma Normale:
Tutti gli attributi devono essere:
	- semplici(non composti) es. indirizzo
	- un UNICO valore(no attributi multivalori) es. nominativo (nome + cognome)

Concetto di DIPENDENZA FUNZIONALE (tra insiemi di attributi):
si ha quando il valore di un attributo determina il valore di un altro attributo 
es. tra sigla della provinca e il nome della provincia
Def:
Siano Ax, Ay due attributi di una relazione R
Diciamo che l'attributi Ax DETERMINA FUNZIONALMENTE Ay,
e lo indichiamo con la notazione Ax->Ay, se per ogni possibile coppia 
r,t di record di R se t[Ax] = r[Ax] => t[Ay] = r[Ay]

2NF -> Seconda Forma Normale:
	- deve rispettare la 1NF
	- tutti gli attributi non primi(non chiave) dipendono funzionalmente da TUTTA la chiave primaria
	  (ossia gli attributi non primi non possono dipendere da una parte della chiave primaria),
	  condizione verificata se la PK è formata solo da un attributo
per verificare la condizione si crea una tabella esterna

3NF -> Terza Forma Normale:
	- deve rispettare la 2NF
	- non devono esistere dipendenze funzionali tra attributi non chiave
per verificare la condizione si crea una tabella esterna
*/