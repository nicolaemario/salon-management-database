# Proiect: bază de date de gestionare a unui salon

## #1. Ce este proiectul

Acest proiect reprezintă o bază de date simplă pentru un salon fictiv.
În acesta, se pot adăuga ușor: **angajați**, **clienți**, **funcții**, **servicii**, **programări**.

## #2. Ce conține proiectul

Proiectul are 2 componente: **Diagrama Entitate-Relație** și **fișierul SQL**.
**Diagrama Entitate-Relație** permite modelarea bazei de date realizată în MySQL într-un
mod prietenos de înțelegere a **relațiilor dintre entități**, a **cardinalității** lor,
dar și a **atributelor** entităților respective.
**Fișierul SQL** reprezintă tot procesul de creare a acestei baze de date cu scopul de a stoca
date în mod digital: de la **crearea primelor tabele** la **inserarea unor date fictive**.

## #3. Descriere

**Entități** (4):
- _Angajat_ (tabelul unde sunt introduși toți angajații salonului)
- _Client_ (tabelul unde sunt introduși toți clienții salonului)
- _Funcție_ (tabelul unde sunt introduse toate funcțiile deținute de angajați)
- _Serviciu_ (tabelul unde sunt introduse toate serviciile oferite de salon)
- _Programări_ (tabelul unde sunt introduse toate programările făcute de către clienți)

**Relații** (4)
- _Client-Serviciu_ (**Cardinalitate Many-to-Many**(M:N))
    * _Un Client_ **poate primi** _mai multe Servicii_,
    *  _Un Serviciu_ **poate fi primit** de _mai mulți Clienți_;
- _Serviciu-Programare_ (**Cardinalitate One-to-Many**(1:M))
    * _Un Serviciu_ **poate avea** _mai multe _Programări_,
    *  _O Programare_ **poate avea** _un singur Serviciu_;
- _Serviciu-Angajat_ (**Cardinalitate Many-to-Many**(M:N))
    * _Un Serviciu_ **poate avea** _mai mulți _Angajați_,
    *  _Un Angajat_ **poate avea** _mai multe Servicii_;
- Angajat-Funcție_ (**Cardinalitate Many-to-One**(M:1))
    * _Un Angajat_ **poate deține** _o singură _Funcție_,
    *  _O funcție_ **poate fi deținută**de _mai mulți Angajați_;
 
  **Inserări**
  -       
 
