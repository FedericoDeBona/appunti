<?php
/*
http -> protocollo stateless: non è in grado di sapere con chi sta comunicando

identificatore di sessione -> per identificare il client

Il server controlla se il client ha inviato un identificatore di sessione (nel caso di PHP, questo identificatore si chiama PHPSESSID)
	- Se il client non ha spedito nessun id di sessione => sessione nuova
	- Se l'id di sessione non esiste oppure corrisponde con una sessione scasdute => sessione nuova
	- Session id valido e non scaduto => ripristino sessione
										 ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

	Per ogni id di sessione generato dal server, il server memorizza su disco tutti i dati relativi alla sessione specificata (su file o su DBMS, in php su file) 
*/

//Programma php che salva una sessione preferenze.php?lingua=it
session_start(); #Controlla se il session file esiste e lo mette in $_SESSION, altrimenti viene generato un nuovo id di sessione
if(isset($_GET['lingua']))
{
	$_SESSION['lingua'] = $_GET['lingua'];
	echo "Lingua impostata a " . $_GET['lingua'];
}
//Quando termina l'esecuzione di uno script in cui è presente il session_start(), in autmatico i dati dell'array $_SESSION vangono salvati nel corrispondente file di sessione

//main.php
session_start();
if($_SESSION['lingua'] == 'it')
{
	include "main_it.php";
}
//I file di session in XAMPP vangono salvati di default nella cartella /temp

//carrello.php?codProd=7985&action=inc/dec
session_start();
if(!isset($_GET['action'])) exit();
if(!isset($_GET['codProd'])) exit();
$cod_prod = $_GET['codProd'];
$action = $_GET['action'];

$carrito = $_SESSION['carrito']; #$carrito è una copia dell'array $_SESSION

if($action == 'inc')
{
	if(isset($carrito[$cod_prod]))
		$carrito[$cod_prod]++;
	else
		$carrito['codProd'] = 1;
}
if($action == 'dec')
{
	if(isset($carrito[$cod_prod]) && $carrito['codProd'] > 0)
		$carrito[$cod_prod]--;
}

//Esempio logout
session_start();
/*...*/
$_SESSION = [];
session_destroy();