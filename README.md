# Volumeter. Sistem distribuit pentru estimarea volumui
Acest repository conține codul Flutter pentru aplicația client. Sistemul 
le permite utilizatorilor să captureze și să editeze imagini prin intermediul aplicației mobile, acestea urmând să fie 
trimise către un server backend pentru a putea fi procesate.

## Cuprins
1. [Prezentarea sistemului](#1-Prezentarea-generală-a-sistemului)
2. [Aplicația client](#2-Aplicația-client)
   * 2.1 [Dependințe](#21-Dependințe)
   * 2.2 [Obținerea codului](#22-Obținerea-codului)
   * 2.3 [Configurarea aplicației](#23-Configurarea-aplicației)
   * 2.4 [Lansarea și rularea aplicației](#24-Lansarea-și-rularea-aplicației)
3. [Aplicația de pe server](#3-Aplicația-de-pe-server)
   * 3.1 [Dependințe](#31-Dependințe)
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
 ```git
git clone https://github.com/sgirban/volumeter_app.git
```
### 2.3 Configurarea aplicației
Navigați în directorul ce a fost copiat local în pasul anterior și descărcați pachetele necesare folosind comanda 
 ```bash
flutter pub get
```
### 2.4 Lansarea și rularea aplicației
Pentru a complia și rula aplicația trebuie să folosiți comanda:
 ```bash
flutter run
```
## 3. Aplicația de pe server
În această secțiune detaliem cum trebuie instalat și configurat programul de pe server.
### 3.1 Dependințe
 Înainte de a începe trebuie să vă asigurați că aveți instalate următoarele programe:
 * **Python 3.x:** (e.g., Python 3.9 sau chiar o versiune mai recentă).
    * [Descarcă Python](https://www.python.org/downloads/)
* **Colmap:** Un pipeline care are implementatți algoritmi precum Structure-from-Motion (SfM) și Multi-View Stereo (MVS).  
    * [Descărcați COLMAP](https://colmap.github.io/install.html) 
    * Pentru Colmap este foarte important să vă asigurați că executabilul este accesibil via PATH.
  **Blender:** Blender este util atât pentru viuzalizarea datelor, dar și pentru a calcula mult mai precis volumul. Aplicația de server folosește câteva scripturi blender.
  * [Descarcă Blender](https://www.blender.org/download/)
  
