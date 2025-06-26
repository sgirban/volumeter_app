# Volumeter. Sistem distribuit pentru estimarea volumui
Acest repository conține codul Flutter pentru aplicația client. Sistemul 
le permite utilizatorilor să captureze și să editeze imagini prin intermediul aplicației mobile, acestea urmând să fie 
trimise către un server backend pentru a putea fi procesate.

## Cuprins
1. [Prezentarea sistemului](#1-Prezentarea-generală-a-sistemului)
2. [Aplicația client](#2-Aplicația-client)
   * 2.1 [Dependințe](#21-Dependințe)
   * 2.2 [Obținerea codului](#22-Obținerea-codului)
## 1. Prezentarea generală a sistemului
Sistemul oferă o serie de etape ce pot fi urmate pentru a estima volumul din imagile încărcate de utilizatori.
* **Aplicația client (în Flutter):** Se ocupă cu gestionarea, editarea și organizarea imaginilor ce trebuiesc procesate, dar și
cu transmisia acestora pe server (via gRPC).
* **Aplicația de pe server:** Este Responsabilă de primirea imaginilor și procesarea acestora folosind COLMAP, Poisson și metode statistice pentru filtrare pentru a estima volumul obiectului.
## 2. Aplicația client 
Această secțiune detaliază procesul de configurare care trebuie urmat pentru a putea rula codul sursă
 al aplicației Flutter.
 ### 2.1 Dependințe 
 Înainte de a începe trebuie să vă asigurați că aveți instalate următoarele programe:
 * **SDK-ul Flutter:** Puteți urmări instrucțiunile prezentate în documentația lor oficială pentru a instala corect kitul.
    * [Ghid de instalare pentru Flutter (oficial)](https://docs.flutter.dev/get-started/install)
 * **IDE (Integrated Development Environment):**

  * [VS Code](https://code.visualstudio.com/) cu extensiile oficiale pentru Flutter.

  * [Android Studio](https://developer.android.com/studio) cu extensiile oficiale pentru Flutter și Dart.
* **Git:** Pentru a face o clonă a repository-ului central.

  * [Git Download](https://git-scm.com/downloads)
 ### 2.2 Obținerea codului
 Pentru a copia repository-ul local, pe dispozitivul dumeavoastră puteți folosi comanda:

