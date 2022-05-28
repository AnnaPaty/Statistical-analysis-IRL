# Anàlisi estadística de l'Institut Ramon Llull

L’Institut Ramon Llull (IRL) és una empresa pública creada amb l’objectiu de promoure el català a l’exterior en un ampli ventall d’àmbits com l’acadèmic, les arts visuals o la traducció de textos; internacionalitzant la cultura catalana. Aquest es troba compost per tres grans àrees: 

1.	Àrea de Creació
2.	Àrea de Literatura
3.	Àrea de Llengua i Universitats

Així mateix, es troben compostes per diversos projectes sobre els quals es volen prendre accions. Totes tres tenen en comú voler treballar sobre l'anàlisi de l'atorgament de subvencions per a finançar un gran rang d'activitats que promocionen el català arreu del món. A més a més, l'Àrea de Llengua i Universitats també ha decidit focalitzar l'atenció en:

1.	L’organització d’estades lingüístiques en territoris de parla catalana
2.	L’avaluació i la certificació de coneixements de la llengua catalana
3.	La selecció de professorat de català a les universitats per a garantir la continuïtat de la docència

En aquest repositori es poden descobrir doncs tots els passos duts a terme per a l'obtenció de les dades desitjoses d'analitzar (SQL), la seva neteja (Python) i finalment la visualització (Python - Altair) i explicació dels gràfics a partir dels quals poder prendre accions basades en evidències.


Requeriments
------------

Primer de tot cal comentar que l'extracció de les dades no es podrà dur a terme per tercers a causa de la privacitat de les bases de dades.

Per a executar la resta del projecte serà necessari treballar amb alguna interfície interactiva que accepti Python (ex: Jupyter Notebook o Google Collaboratory)

Els paquets de Python utilitzats han estat:

* pandas
* files de google.colab
* altair
* numpy
* time
* difflib
* re
* datetime
* Counter de collections
* io
* matplotlib.pyplot

Fer notar que s'ha de tenir openpyxl amb la versió 3.0.10 o superior. Es pot instal·lar o actualitzar executant: pip install openpyxl --upgrade --pre


Organització del projecte
------------

    ├── README.md                                    <- El README de primer nivell per als desenvolupadors del projecte.
    ├── Àrea de Creació
    │   ├── dades.zip                                <- Dades intermèdies i finals.
    │   ├── select_subv_creacio.sql                  <- Script per a l'extracció de dades.
    │   ├── subv_creacio.ipynb                       <- Neteja de les dades i creació de les gràfiques.
    │   ├── subv_creacio.html                        <- Neteja de les dades i creació de les gràfiques - EXECUTAT (per a la directa visualització).
    │   └── subv_creacio_grafics.html                <- Visualitzacions finals.
    │ 
    ├── Àrea de Literatura           
    │   ├── dades.zip                                <- Dades intermèdies i finals.
    │   ├── select_subv_lite.sql                     <- Script per a l'extracció de dades.
    │   ├── subv_lite.ipynb                          <- Neteja de les dades i creació de les gràfiques.
    │   ├── subv_lite.html                           <- Neteja de les dades i creació de les gràfiques - EXECUTAT (per a la directa visualització).
    │   └── subv_lite_grafics.html                   <- Visualitzacions finals.
    │ 
    └── Àrea de Llengua i Universitats                
        ├── Subvencions
        │   ├── dades.zip                            <- Dades intermèdies i finals.
        │   ├── select_subv_llengua.sql              <- Script per a l'extracció de dades.
        │   ├── select_subv_evolucioUnis.sql         <- Script per a una segona extracció de dades.
        │   ├── subv_llengua.ipynb                   <- Neteja de les dades i creació de les gràfiques.
        │   ├── subv_llengua.html                    <- Neteja de les dades i creació de les gràfiques - EXECUTAT (per a la directa visualització).
        │   └── subv_llengua_grafics.html            <- Visualitzacions finals.
        │ 
        ├── Inscripcions (campus i estades)
        │   ├── dades.zip                            <- Dades intermèdies i finals.
        │   ├── select_inscripcions.sql              <- Script per a l'extracció de dades.
        │   ├── inscripcio.ipynb                     <- Neteja de les dades i creació de les gràfiques.
        │   ├── inscripcio.html                      <- Neteja de les dades i creació de les gràfiques - EXECUTAT (per a la directa visualització).
        │   └── inscripcio_grafics.html              <- Visualitzacions finals.
        │ 
        ├── Certificació
        │   ├── dades.zip                            <- Dades intermèdies i finals.
        │   ├── select_certificacio.sql              <- Script per a l'extracció de dades.
        │   ├── certificacio.ipynb                   <- Neteja de les dades.
        │   ├── certificacio.html                    <- Neteja de les dades - EXECUTAT (per a la directa visualització).
        │   ├── certificacio_plots.ipynb             <- Creació de les gràfiques.
        │   ├── certificacio_plots.html              <- Creació de les gràfiques - EXECUTAT (per a la directa visualització).
        │   └── certificacio_plots_grafics.html      <- Visualitzacions finals.
        │ 
        ├── Selecció de professorat
        │   ├── dades.zip                            <- Dades intermèdies i finals.
        │   ├── select_seleccio.sql                  <- Script per a l'extracció de dades.
        │   ├── seleccio.ipynb                       <- Neteja de les dades i creació de les gràfiques.
        │   ├── seleccio.html                        <- Neteja de les dades i creació de les gràfiques - EXECUTAT (per a la directa visualització).
        │   └── seleccio_grafics.html                <- Visualitzacions finals.
        │ 
        └── Memòries
            ├── dades.zip                            <- Dades intermèdies i finals.
            ├── select_memories.sql                  <- Script per a l'extracció de dades.
            ├── memories.ipynb                       <- Neteja de les dades i creació de les gràfiques.
            ├── memories.html                        <- Neteja de les dades i creació de les gràfiques - EXECUTAT (per a la directa visualització).
            └── memories_grafics.html                <- Visualitzacions finals.
          
          
Observacions
------------

Els fitxers HTML pesen bastant i, per tant, per a la seva correcta visualització cal posar el següent tros (1) d'URL davant l'URL original.

(1) https://htmlpreview.github.io/

Així doncs, l'URL completa per a visualitzar, per exemple, les gràfiques de les subvencions de l'Àrea de Llengua i Literatura seria:

https://htmlpreview.github.io/?https://github.com/AnnaPaty/Statistical-analysis-IRL/blob/main/%C3%80rea%20de%20Llengua%20i%20Universitats/Subvencions/subv_llengua_grafics.html
