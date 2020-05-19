/*
Identificatore surrogato: id, usato quando nella tabella non c'è altro modo per identificare un record

CASO DI IDENTIFICATORE ESTERNO -> Entità debole, identificatore debole
   matricola
 •		○ 
 |------|-----------+		
+---------------+	|
|				|	|
|	studente	|	|
|				|	|
+---------------+	|
	|	|N	|		|
  nome  | cognome	|
		|-----------+
		|
  ____________
 /			  \
/			   \
\			   /
 \____________/
		|
		|
		|
		|1
+---------------+
|				|
|	università	|--○ a1
|				|--○ a2
+---------------+
	|
	•	
  nome(pk) 	  

- Se l'universo del discordo riguarda solo 1 università, matricola basta per identificare lo studente
- Se l'universo del discordo comprende più università allora la matricola da sola non basta più a identificare lo studente

università(nome, a1, a2, ...)
		   ‾‾‾‾
		   / \
			|
		 	|
studenti(nome_università, matricola, nome, cognome, ...)
		 ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾  ‾‾‾‾‾‾‾‾‾				

ESEMPIO 2


      n_stanza
 •		○ 
 |------|-----------+		
+---------------+	|
|				|	|
|	  stanza	|	|
|				|	|
+---------------+	|
	|	|N	|		|
 posti  |   tv		|
 letto	|-----------+
		|
  ____________
 /			  \
/			   \
\			   /
 \____________/
		|
		|
		|
		|1
+---------------+
|				|
|	albergo		|--○ a1
|				|--○ a2
+---------------+
|---|-------|--			----> coppia di valori per la PK
•	○	    ○1
  nome    città

n_stanza: è un identificatre esterno perchè da solo non permette di identificare la stanza

alberghi(nome, città, stanze,)
		 ‾‾‾‾  ‾‾‾‾‾
		  ^		  ^
		  |		  |
		  |		  +-----+
		  |				|
stanze(nome_albergo, città_albergo, n_stanza, tv, ac, ...)
	   ‾‾‾‾‾‾‾‾‾‾‾‾  ‾‾‾‾‾‾‾‾‾‾‾‾‾  ‾‾‾‾‾‾‾‾


ESEMPIO 3
		
+---------------+	
|				|	
|	 cinema		|
|				|	
+---------------+	
	|	|1	|
	•	|	•		
  nome  | città 	
		|
		|
  ____________
 /			  \
/			   \
\			   /
 \____________/
		|
		|
		|---------+
		|N 		  |
+---------------+ |
|				|--○ nome
|	 sala		| |
|				|--•
+---------------+ 
		|1
		|	
  ____________
 /			  \
/			   \
\			   /
 \____________/
		|---------+
		|N 		  |
+---------------+ |
|				|--○ n_posto
|	 posto		| |
|				|--• 
+---------------+

cinema(nome, città, telefono, ...)
	   ‾‾‾‾‾‾‾‾‾‾‾
		^		^
		|		|
sale(cine_nome, cine_città, nome, ...)
	 ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
		^			^		  ^
		|			|		  |
posti(cine_nome, cine_città, nome_sala, n_posto)
	  ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
*/				