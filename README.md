# Volumeter. Sistem distribuit pentru estimarea volumui
Acest repository conține codul Flutter pentru aplicația client. Sistemul 
le permite utilizatorilor să captureze și să editeze imagini prin intermediul aplicației mobile, acestea urmând să fie 
trimise către un server backend pentru a putea fi procesate.

## Cuprins
1. [Prezentarea sistemului](#1-Prezentarea-generală-a-sistemului)
## 1. Prezentarea generală a sistemului
Sistemul oferă o serie de etape ce pot fi urmate pentru a estima volumul din imagile încărcate de utilizatori.
* **Aplicația client (în Flutter):** Se ocupă cu gestionarea, editarea și organizarea imaginilor ce trebuiesc procesate, dar și
cu transmisia acestora pe server (via gRPC).
* **Aplicația de pe server:** Este Responsabilă de primirea imaginilor și procesarea acestora folosind COLMAP, Poisson și metode statistice pentru filtrare pentru a estima volumul obiectului.
  
