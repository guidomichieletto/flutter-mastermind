# Mastermind
Un must da scrivere per ogni linguaggio nuovo che abbiamo imparato a scuola
By Guido e nessun'altro

### 🌟 Scelte progettuali principali
- **Separation of concerns**: è stata creata una classe apposita (Game) che consente di separare la logica di business dell'applicazione con l'intefaccia grafica
- **Event listener**: per gestire la renderizzazione automatica dei widget, oltre agli StatefulWidget, la classe Game è stata resa anche un notifier che avvisa gli "ascoltatori" quando l'utente ha inserito una nuova sequenza che deve essere renderizzata