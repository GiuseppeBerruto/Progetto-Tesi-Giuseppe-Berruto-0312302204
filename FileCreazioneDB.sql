/*
===============================================================================
  SCRIPT T-SQL PER CREARE IL DATABASE “euroexpress_transport”
  – INCLUDE: creazione database, tabelle, vincoli, indici e viste
  
===============================================================================
*/

--------------------------------------------------------------------------------
-- 1) Creazione del database (se non esiste) e selezione
--------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = N'euroexpress_transport')
BEGIN
    ALTER DATABASE [euroexpress_transport] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [euroexpress_transport];
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = N'euroexpress_transport')
  CREATE DATABASE [euroexpress_transport];
GO





USE [euroexpress_transport];
GO

--------------------------------------------------------------------------------
-- 2) Disabilita temporaneamente i vincoli FK per velocizzare la creazione
--------------------------------------------------------------------------------
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
GO

--------------------------------------------------------------------------------
-- 3) TABELLE ANAGRAFICHE E CONFIGURAZIONE
--------------------------------------------------------------------------------

-- Nazioni
CREATE TABLE dbo.nazioni (
  id_nazione        CHAR(2)     NOT NULL PRIMARY KEY,
  nome_nazione      VARCHAR(100)NOT NULL,
  codice_telefonico VARCHAR(5)  NULL,
  valuta_principale CHAR(3)     NULL,
  fuso_orario       VARCHAR(10) NULL,
  ue_schengen       BIT         NOT NULL DEFAULT(0),
  attiva            BIT         NOT NULL DEFAULT(1),
  created_at        DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at        DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

-- Regioni/Province
CREATE TABLE dbo.regioni (
  id_regione      INT         IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_nazione      CHAR(2)     NOT NULL,
  nome_regione    VARCHAR(100)NOT NULL,
  codice_regione  VARCHAR(10) NULL,
  created_at      DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_regioni_nazioni FOREIGN KEY(id_nazione)
    REFERENCES dbo.nazioni(id_nazione)
);
GO

-- Città
CREATE TABLE dbo.citta (
  id_citta      INT         IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_regione    INT         NOT NULL,
  nome_citta    VARCHAR(100)NOT NULL,
  codice_postale VARCHAR(20)NULL,
  latitudine    DECIMAL(10,8) NULL,
  longitudine   DECIMAL(11,8) NULL,
  popolazione   INT         NULL,
  attiva        BIT         NOT NULL DEFAULT(1),
  created_at    DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at    DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_citta_regioni FOREIGN KEY(id_regione)
    REFERENCES dbo.regioni(id_regione)
);
GO

-- Stazioni/Fermate
CREATE TABLE dbo.stazioni (
  id_stazione       INT           IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_citta          INT           NOT NULL,
  nome_stazione     VARCHAR(150)  NOT NULL,
  indirizzo         VARCHAR(255)  NULL,
  tipo_stazione     VARCHAR(12)   NOT NULL DEFAULT 'intermedia',
    CONSTRAINT CHK_stazioni_tipo CHECK(tipo_stazione IN('terminale','intermedia','capolinea')),
  servizi_disponibili NVARCHAR(MAX) NULL,
  latitudine        DECIMAL(10,8) NULL,
  longitudine       DECIMAL(11,8) NULL,
  telefono          VARCHAR(20)   NULL,
  email             VARCHAR(100)  NULL,
  accessibilita_disabili BIT      NOT NULL DEFAULT(0),
  parcheggio_disponibile    BIT      NOT NULL DEFAULT(0),
  numero_banchine   INT           NOT NULL DEFAULT(1),
  attiva            BIT           NOT NULL DEFAULT(1),
  created_at        DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at        DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_stazioni_citta FOREIGN KEY(id_citta)
    REFERENCES dbo.citta(id_citta)
);
GO

--------------------------------------------------------------------------------
-- 4) GESTIONE FLOTTA E VEICOLI
--------------------------------------------------------------------------------

-- Tipologie Veicoli
CREATE TABLE dbo.tipologie_veicoli (
  id_tipologia    INT         IDENTITY(1,1) NOT NULL PRIMARY KEY,
  nome_tipologia  VARCHAR(50) NOT NULL,
  descrizione     TEXT        NULL,
  capacita_min    INT         NULL,
  capacita_max    INT         NULL,
  lunghezza_media DECIMAL(5,2)NULL,
  altezza_media   DECIMAL(4,2)NULL,
  peso_medio      INT         NULL,
  consumo_medio_litri_100km DECIMAL(4,2) NULL,
  emissioni_co2_km INT        NULL,
  created_at      DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

-- Veicoli
CREATE TABLE dbo.veicoli (
  id_veicolo       INT         IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_tipologia     INT         NOT NULL,
  numero_veicolo   VARCHAR(20) NOT NULL UNIQUE,
  targa            VARCHAR(20) NOT NULL UNIQUE,
  marca            VARCHAR(50) NULL,
  modello          VARCHAR(50) NULL,
  anno_immatricolazione CHAR(4) NULL,
  capacita_passeggeri INT      NOT NULL,
  posti_disabili   INT         NOT NULL DEFAULT(2),
  aria_condizionata BIT        NOT NULL DEFAULT(1),
  wifi             BIT        NOT NULL DEFAULT(1),
  bagagliaio_volume INT       NULL,
  toilette         BIT        NOT NULL DEFAULT(1),
  schermo_tv       BIT        NOT NULL DEFAULT(0),
  prese_elettriche BIT        NOT NULL DEFAULT(0),
  km_percorsi      INT        NOT NULL DEFAULT(0),
  ultimo_tagliando DATE       NULL,
  prossimo_tagliando DATE     NULL,
  assicurazione_scadenza DATE NULL,
  revisione_scadenza DATE     NULL,
  stato_veicolo    VARCHAR(20)NOT NULL DEFAULT 'attivo',
    CONSTRAINT CHK_veicoli_stato CHECK(stato_veicolo 
      IN('attivo','manutenzione','fuori_servizio','venduto')),
  note_tecniche    TEXT       NULL,
  created_at       DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at       DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_veicoli_tipologie FOREIGN KEY(id_tipologia)
    REFERENCES dbo.tipologie_veicoli(id_tipologia)
);
GO

-- Autisti
CREATE TABLE dbo.autisti (
  id_autista       INT         IDENTITY(1,1) NOT NULL PRIMARY KEY,
  codice_autista   VARCHAR(20) NOT NULL UNIQUE,
  nome             VARCHAR(50) NOT NULL,
  cognome          VARCHAR(50) NOT NULL,
  data_nascita     DATE        NULL,
  codice_fiscale   VARCHAR(20) NULL UNIQUE,
  patente_numero   VARCHAR(20) NOT NULL UNIQUE,
  patente_categoria VARCHAR(10) NOT NULL,
  patente_scadenza DATE       NOT NULL,
  cqc_numero       VARCHAR(30) NULL,
  cqc_scadenza     DATE        NULL,
  telefono         VARCHAR(20) NULL,
  email            VARCHAR(100)NULL,
  indirizzo        VARCHAR(255)NULL,
  data_assunzione  DATE        NULL,
  stipendio_base   DECIMAL(8,2)NULL,
  ore_guida_max_giornaliere INT NOT NULL DEFAULT(9),
  ore_guida_max_settimanali INT NOT NULL DEFAULT(56),
  lingue_parlate   NVARCHAR(MAX) NULL,
  certificazioni   NVARCHAR(MAX) NULL,
  stato_autista    VARCHAR(20) NOT NULL DEFAULT 'attivo',
    CONSTRAINT CHK_autisti_stato CHECK(stato_autista 
      IN('attivo','riposo','malattia','ferie','licenziato')),
  valutazione_media DECIMAL(3,2)NOT NULL DEFAULT(5.00),
  created_at       DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at       DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

--------------------------------------------------------------------------------
-- 5) GESTIONE CLIENTI E PASSEGGERI
--------------------------------------------------------------------------------

-- Clienti
CREATE TABLE dbo.clienti (
  id_cliente        INT         IDENTITY(1,1) NOT NULL PRIMARY KEY,
  tipo_cliente      VARCHAR(10) NOT NULL DEFAULT 'privato',
    CONSTRAINT CHK_clienti_tipo CHECK(tipo_cliente 
      IN('privato','business','agenzia')),
  codice_cliente    VARCHAR(20) NULL UNIQUE,
  nome              VARCHAR(100)NOT NULL,
  cognome           VARCHAR(100)NULL,
  ragione_sociale   VARCHAR(200)NULL,
  codice_fiscale    VARCHAR(20) NULL,
  partita_iva       VARCHAR(20) NULL,
  data_nascita      DATE        NULL,
  sesso             VARCHAR(10) NULL,
    CONSTRAINT CHK_clienti_sesso CHECK(sesso IN('M','F','altro')),
  id_nazione_nascita CHAR(2)    NULL,
  telefono          VARCHAR(20) NULL,
  email             VARCHAR(100)NULL,
  indirizzo         VARCHAR(255)NULL,
  id_citta          INT         NULL,
  documento_tipo    VARCHAR(20) NOT NULL,
    CONSTRAINT CHK_clienti_doc CHECK(documento_tipo 
      IN('carta_identita','patente','passaporto')),
  documento_numero  VARCHAR(50) NOT NULL,
  documento_scadenza DATE      NULL,
  id_nazione_rilascio CHAR(2)  NULL,
  newsletter_consenso BIT      NOT NULL DEFAULT(0),
  marketing_consenso BIT       NOT NULL DEFAULT(0),
  privacy_consenso   BIT       NOT NULL DEFAULT(1),
  data_registrazione DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  ultimo_accesso     DATETIME2 NULL,
  stato_cliente      VARCHAR(20)NOT NULL DEFAULT 'attivo',
    CONSTRAINT CHK_clienti_stato CHECK(stato_cliente 
      IN('attivo','sospeso','blacklist')),
  note_cliente       TEXT       NULL,
  sconto_fedelta     DECIMAL(5,2)NOT NULL DEFAULT(0.00),
  punti_fedelta      INT        NOT NULL DEFAULT(0),
  created_at         DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at         DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_clienti_naz_nasc FOREIGN KEY(id_nazione_nascita)
    REFERENCES dbo.nazioni(id_nazione),
  CONSTRAINT FK_clienti_naz_rila FOREIGN KEY(id_nazione_rilascio)
    REFERENCES dbo.nazioni(id_nazione),
  CONSTRAINT FK_clienti_citta FOREIGN KEY(id_citta)
    REFERENCES dbo.citta(id_citta)
);
GO

-- Passeggeri
CREATE TABLE dbo.passeggeri (
  id_passeggero    INT         IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_cliente       INT         NOT NULL,
  nome             VARCHAR(100)NOT NULL,
  cognome          VARCHAR(100)NOT NULL,
  data_nascita     DATE        NULL,
  codice_fiscale   VARCHAR(20) NULL,
  documento_tipo   VARCHAR(20) NULL,
  documento_numero VARCHAR(50) NULL,
  documento_scadenza DATE     NULL,
  id_nazione_rilascio CHAR(2) NULL,
  sesso            VARCHAR(10) NULL,
  note_mediche     TEXT        NULL,
  esigenze_speciali TEXT       NULL,
  accompagnatore   BIT         NOT NULL DEFAULT(0),
  minore           BIT         NOT NULL DEFAULT(0),
  created_at       DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at       DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_pass_clienti FOREIGN KEY(id_cliente)
    REFERENCES dbo.clienti(id_cliente) ON DELETE CASCADE,
  CONSTRAINT FK_pass_nazioni FOREIGN KEY(id_nazione_rilascio)
    REFERENCES dbo.nazioni(id_nazione)
);
GO

--------------------------------------------------------------------------------
-- 6) GESTIONE TRATTE E LINEE
--------------------------------------------------------------------------------

-- Linee
CREATE TABLE dbo.linee (
  id_linea              INT       IDENTITY(1,1) NOT NULL PRIMARY KEY,
  codice_linea          VARCHAR(20)NOT NULL UNIQUE,
  nome_linea            VARCHAR(150)NOT NULL,
  descrizione           TEXT       NULL,
  tipo_linea            VARCHAR(15)NOT NULL DEFAULT 'nazionale',
    CONSTRAINT CHK_linee_tipo CHECK(tipo_linea 
      IN('nazionale','internazionale','urbana','charter')),
  id_stazione_partenza  INT       NOT NULL,
  id_stazione_arrivo    INT       NOT NULL,
  distanza_km           INT       NULL,
  durata_stimata_minuti INT       NULL,
  frequenza_settimanale INT       NOT NULL DEFAULT(7),
  attiva                BIT       NOT NULL DEFAULT(1),
  stagionale            BIT       NOT NULL DEFAULT(0),
  data_inizio_validita  DATE      NULL,
  data_fine_validita    DATE      NULL,
  categoria_servizio    VARCHAR(10)NOT NULL DEFAULT 'economico',
    CONSTRAINT CHK_linee_cat CHECK(categoria_servizio 
      IN('economico','comfort','business','premium')),
  created_at            DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at            DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_linee_partenza FOREIGN KEY(id_stazione_partenza)
    REFERENCES dbo.stazioni(id_stazione),
  CONSTRAINT FK_linee_arrivo   FOREIGN KEY(id_stazione_arrivo)
    REFERENCES dbo.stazioni(id_stazione)
);
GO

-- Fermate Intermedie
CREATE TABLE dbo.fermate_linea (
  id_fermata_linea  INT       IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_linea          INT       NOT NULL,
  id_stazione       INT       NOT NULL,
  ordine_fermata    INT       NOT NULL,
  km_progressivi    INT       NOT NULL DEFAULT(0),
  tempo_sosta_minuti INT      NOT NULL DEFAULT(10),
  solo_discesa      BIT       NOT NULL DEFAULT(0),
  solo_salita       BIT       NOT NULL DEFAULT(0),
  obbligatoria      BIT       NOT NULL DEFAULT(1),
  note_fermata      TEXT      NULL,
  created_at        DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_fermate_linee FOREIGN KEY(id_linea)
    REFERENCES dbo.linee(id_linea) ON DELETE CASCADE,
  CONSTRAINT FK_fermate_stazioni FOREIGN KEY(id_stazione)
    REFERENCES dbo.stazioni(id_stazione),
  CONSTRAINT UQ_fermate_ordine UNIQUE(id_linea, ordine_fermata)
);
GO

-- Tariffe
CREATE TABLE dbo.tariffe (
  id_tariffa           INT       IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_linea             INT       NOT NULL,
  id_stazione_partenza INT       NOT NULL,
  id_stazione_arrivo   INT       NOT NULL,
  tipo_passeggero      VARCHAR(10)NOT NULL DEFAULT 'adulto',
    CONSTRAINT CHK_tariffe_tipo CHECK(tipo_passeggero 
      IN('adulto','bambino','anziano','studente','disabile')),
  prezzo_base          DECIMAL(8,2)NOT NULL,
  prezzo_weekend       DECIMAL(8,2) NULL,
  prezzo_festivo       DECIMAL(8,2) NULL,
  sconto_andata_ritorno DECIMAL(5,2)NOT NULL DEFAULT(0.00),
  validita_giorni      INT       NOT NULL DEFAULT(1),
  rimborsabile         BIT       NOT NULL DEFAULT(1),
  modificabile         BIT       NOT NULL DEFAULT(1),
  penale_modifica      DECIMAL(8,2)NOT NULL DEFAULT(0.00),
  penale_rimborso      DECIMAL(8,2)NOT NULL DEFAULT(0.00),
  data_inizio_validita DATE      NOT NULL,
  data_fine_validita   DATE      NULL,
  created_at           DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at           DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_tariffe_linee FOREIGN KEY(id_linea)
    REFERENCES dbo.linee(id_linea),
  CONSTRAINT FK_tariffe_partenza FOREIGN KEY(id_stazione_partenza)
    REFERENCES dbo.stazioni(id_stazione),
  CONSTRAINT FK_tariffe_arrivo FOREIGN KEY(id_stazione_arrivo)
    REFERENCES dbo.stazioni(id_stazione)
);
GO

--------------------------------------------------------------------------------
-- 7) GESTIONE CORSE E PROGRAMMAZIONE
--------------------------------------------------------------------------------

-- Corse
CREATE TABLE dbo.corse (
  id_corsa                 INT       IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_linea                 INT       NOT NULL,
  id_veicolo               INT       NULL,
  id_autista_principale    INT       NULL,
  id_autista_secondo       INT       NULL,
  numero_corsa             VARCHAR(30)NOT NULL UNIQUE,
  data_partenza            DATE      NOT NULL,
  ora_partenza_programmata TIME      NOT NULL,
  ora_arrivo_programmata   TIME      NOT NULL,
  ora_partenza_effettiva   TIME      NULL,
  ora_arrivo_effettiva     TIME      NULL,
  stato_corsa              VARCHAR(15)NOT NULL DEFAULT 'programmata',
    CONSTRAINT CHK_corse_stato CHECK(stato_corsa 
      IN('programmata','in_corso','completata','cancellata','rimandata')),
  posti_disponibili        INT       NULL,
  posti_prenotati          INT       NOT NULL DEFAULT(0),
  posti_occupati           INT       NOT NULL DEFAULT(0),
  prezzo_medio             DECIMAL(8,2)NULL,
  km_effettivi             INT       NULL,
  consumo_carburante       DECIMAL(6,2)NULL,
  costo_carburante         DECIMAL(8,2)NOT NULL DEFAULT(0.00),
  pedaggio                 DECIMAL(8,2)NOT NULL DEFAULT(0.00),
  incasso_totale           DECIMAL(10,2)NOT NULL DEFAULT(0.00),
  note_corsa               TEXT      NULL,
  meteo_partenza           VARCHAR(50)NULL,
  meteo_arrivo             VARCHAR(50)NULL,
  ritardo_minuti           INT       NOT NULL DEFAULT(0),
  motivo_ritardo           TEXT      NULL,
  created_at               DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at               DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_corse_linee FOREIGN KEY(id_linea)
    REFERENCES dbo.linee(id_linea),
  CONSTRAINT FK_corse_veicoli FOREIGN KEY(id_veicolo)
    REFERENCES dbo.veicoli(id_veicolo),
  CONSTRAINT FK_corse_aut1 FOREIGN KEY(id_autista_principale)
    REFERENCES dbo.autisti(id_autista),
  CONSTRAINT FK_corse_aut2 FOREIGN KEY(id_autista_secondo)
    REFERENCES dbo.autisti(id_autista)
);
GO

-- Orari Fermate per Corsa
CREATE TABLE dbo.orari_fermate_corsa (
  id_orario_fermata        INT       IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_corsa                 INT       NOT NULL,
  id_stazione              INT       NOT NULL,
  ordine_fermata           INT       NOT NULL,
  ora_arrivo_programmata   TIME      NULL,
  ora_partenza_programmata TIME      NULL,
  ora_arrivo_effettiva     TIME      NULL,
  ora_partenza_effettiva   TIME      NULL,
  passeggeri_saliti        INT       NOT NULL DEFAULT(0),
  passeggeri_scesi         INT       NOT NULL DEFAULT(0),
  note_fermata             TEXT      NULL,
  created_at               DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at               DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_ofc_corse FOREIGN KEY(id_corsa)
    REFERENCES dbo.corse(id_corsa) ON DELETE CASCADE,
  CONSTRAINT FK_ofc_stazioni FOREIGN KEY(id_stazione)
    REFERENCES dbo.stazioni(id_stazione),
  CONSTRAINT UQ_ofc_corsastaz UNIQUE(id_corsa, id_stazione)
);
GO

--------------------------------------------------------------------------------
-- 8) GESTIONE PRENOTAZIONI E BIGLIETTI
--------------------------------------------------------------------------------

-- Prenotazioni
CREATE TABLE dbo.prenotazioni (
  id_prenotazione       INT       IDENTITY(1,1) NOT NULL PRIMARY KEY,
  codice_prenotazione   VARCHAR(20)NOT NULL UNIQUE,
  id_cliente            INT       NOT NULL,
  data_prenotazione     DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  canale_prenotazione   VARCHAR(20)NOT NULL DEFAULT 'online',
    CONSTRAINT CHK_canale_preno CHECK(canale_prenotazione 
      IN('online','telefono','agenzia','sportello')),
  stato_prenotazione    VARCHAR(20)NOT NULL DEFAULT 'confermata',
    CONSTRAINT CHK_stato_preno CHECK(stato_prenotazione 
      IN('confermata','pagata','cancellata','scaduta','utilizzata')),
  numero_passeggeri     INT       NOT NULL,
  importo_totale        DECIMAL(10,2)NOT NULL,
  importo_pagato        DECIMAL(10,2)NOT NULL DEFAULT(0.00),
  metodo_pagamento      VARCHAR(20)NOT NULL DEFAULT 'carta_credito',
    CONSTRAINT CHK_met_pag CHECK(metodo_pagamento 
      IN('contanti','carta_credito','bonifico','paypal','voucher')),
  transazione_id        VARCHAR(100)NULL,
  data_scadenza_pagamento DATETIME2 NULL,
  data_pagamento        DATETIME2 NULL,
  email_cliente         VARCHAR(100)NULL,
  telefono_cliente      VARCHAR(20) NULL,
  sconto_applied        DECIMAL(8,2)NOT NULL DEFAULT(0.00),
  created_at            DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at            DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_preno_clienti FOREIGN KEY(id_cliente)
    REFERENCES dbo.clienti(id_cliente)
);
GO

-- Biglietti
CREATE TABLE dbo.biglietti (
  id_biglietto          INT       IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_prenotazione       INT       NOT NULL,
  id_corsa              INT       NOT NULL,
  id_passeggero         INT       NULL,
  codice_biglietto      VARCHAR(30)NOT NULL UNIQUE,
  tipo_biglietto        VARCHAR(20)NOT NULL DEFAULT 'andata',
    CONSTRAINT CHK_tipo_biglietto CHECK(tipo_biglietto 
      IN('andata','ritorno','andata_ritorno')),
  numero_posto          VARCHAR(10)NULL,
  id_stazione_partenza  INT       NOT NULL,
  id_stazione_arrivo    INT       NOT NULL,
  data_viaggio          DATE      NOT NULL,
  ora_partenza          TIME      NOT NULL,
  prezzo_biglietto      DECIMAL(8,2)NOT NULL,
  tasse                  DECIMAL(6,2)NOT NULL DEFAULT(0.00),
  stato_biglietto       VARCHAR(20)NOT NULL DEFAULT 'valido',
    CONSTRAINT CHK_stato_biglietto CHECK(stato_biglietto 
      IN('valido','utilizzato','scaduto','cancellato','rimborsato')),
  data_emissione        DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  check_in              BIT       NOT NULL DEFAULT(0),
  created_at            DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at            DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_big_prenotazioni FOREIGN KEY(id_prenotazione)
    REFERENCES dbo.prenotazioni(id_prenotazione) ON DELETE CASCADE,
  CONSTRAINT FK_big_corse FOREIGN KEY(id_corsa)
    REFERENCES dbo.corse(id_corsa),
  CONSTRAINT FK_big_passeggeri FOREIGN KEY(id_passeggero)
    REFERENCES dbo.passeggeri(id_passeggero),
  CONSTRAINT FK_big_partenza FOREIGN KEY(id_stazione_partenza)
    REFERENCES dbo.stazioni(id_stazione),
  CONSTRAINT FK_big_arrivo FOREIGN KEY(id_stazione_arrivo)
    REFERENCES dbo.stazioni(id_stazione)
);
GO

--------------------------------------------------------------------------------
-- 9) GESTIONE OPERATIVA E MONITORAGGIO
--------------------------------------------------------------------------------

-- Tracking Veicoli (GPS)
CREATE TABLE dbo.tracking_veicoli (
  id_tracking          BIGINT     IDENTITY(1,1) NOT NULL PRIMARY KEY,
  id_veicolo           INT        NOT NULL,
  id_corsa             INT        NULL,
  latitudine           DECIMAL(10,8) NOT NULL,
  longitudine          DECIMAL(11,8) NOT NULL,
  velocita_kmh         INT        NOT NULL DEFAULT(0),
  direzione_gradi      INT        NOT NULL DEFAULT(0),
  altitudine           INT        NOT NULL DEFAULT(0),
  timestamp_rilevazione DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_track_veico FOREIGN KEY(id_veicolo)
    REFERENCES dbo.veicoli(id_veicolo),
  CONSTRAINT FK_track_corse FOREIGN KEY(id_corsa)
    REFERENCES dbo.corse(id_corsa)
);
GO

--------------------------------------------------------------------------------
-- Tabella Manutenzioni
--------------------------------------------------------------------------------
CREATE TABLE dbo.manutenzioni (
  id_manutenzione            INT           IDENTITY(1,1) PRIMARY KEY,
  id_veicolo                 INT           NOT NULL,
  tipo_manutenzione          VARCHAR(15)   NOT NULL,
    CONSTRAINT CHK_manut_tipo CHECK(tipo_manutenzione 
      IN('ordinaria','straordinaria','riparazione','revisione')),
  descrizione                TEXT          NOT NULL,
  data_inizio                DATE          NOT NULL,
  data_fine                  DATE          NULL,
  km_veicolo                 INT           NULL,
  costo                      DECIMAL(8,2)  NULL,
  fornitore                  VARCHAR(100)  NULL,
  fattura_numero             VARCHAR(50)   NULL,
  parti_sostituite           NVARCHAR(MAX) NULL,
  note_tecniche              TEXT          NULL,
  prossima_manutenzione_km   INT           NULL,
  prossima_manutenzione_data DATE          NULL,
  stato_manutenzione         VARCHAR(15)   NOT NULL DEFAULT 'programmata',
    CONSTRAINT CHK_manut_stato CHECK(stato_manutenzione 
      IN('programmata','in_corso','completata','annullata')),
  created_at                 DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at                 DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_manut_veicolo FOREIGN KEY(id_veicolo)
    REFERENCES dbo.veicoli(id_veicolo)
);
GO

--------------------------------------------------------------------------------
-- Tabella Incidenti/Sinistri
--------------------------------------------------------------------------------
CREATE TABLE dbo.incidenti (
  id_incidente           INT           IDENTITY(1,1) PRIMARY KEY,
  id_veicolo             INT           NOT NULL,
  id_corsa               INT           NULL,
  id_autista             INT           NULL,
  data_incidente         DATETIME2     NOT NULL,
  luogo_incidente        VARCHAR(255)  NULL,
  latitudine             DECIMAL(10,8) NULL,
  longitudine            DECIMAL(11,8) NULL,
  tipo_incidente         VARCHAR(15)   NOT NULL,
    CONSTRAINT CHK_inc_tipo CHECK(tipo_incidente 
      IN('stradale','tecnico','vandalismo','furto','altro')),
  gravita                VARCHAR(12)   NOT NULL DEFAULT 'lieve',
    CONSTRAINT CHK_inc_grav CHECK(gravita 
      IN('lieve','moderata','grave','molto_grave')),
  descrizione            TEXT          NOT NULL,
  feriti_numero          INT           NOT NULL DEFAULT(0),
  danni_stimati          DECIMAL(10,2) NULL,
  compagnia_assicurazione VARCHAR(100) NULL,
  numero_sinistro        VARCHAR(50)   NULL,
  autorita_competenti    TEXT          NULL,
  testimoni              TEXT          NULL,
  documentazione         NVARCHAR(MAX) NULL,
  stato_pratica          VARCHAR(15)   NOT NULL DEFAULT 'aperta',
    CONSTRAINT CHK_inc_prat CHECK(stato_pratica 
      IN('aperta','in_corso','chiusa','respinta')),
  note_incidente         TEXT          NULL,
  created_at             DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at             DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_inc_veicolo FOREIGN KEY(id_veicolo)
    REFERENCES dbo.veicoli(id_veicolo),
  CONSTRAINT FK_inc_corsa   FOREIGN KEY(id_corsa)
    REFERENCES dbo.corse(id_corsa),
  CONSTRAINT FK_inc_autista FOREIGN KEY(id_autista)
    REFERENCES dbo.autisti(id_autista)
);
GO

--------------------------------------------------------------------------------
-- Tabella Recensioni/Feedback
--------------------------------------------------------------------------------
CREATE TABLE dbo.recensioni (
  id_recensione         INT         IDENTITY(1,1) PRIMARY KEY,
  id_cliente            INT         NOT NULL,
  id_corsa              INT         NULL,
  id_biglietto          INT         NULL,
  id_autista            INT         NULL,
  valutazione_generale  INT         NOT NULL,
    CONSTRAINT CHK_rec_gen CHECK(valutazione_generale BETWEEN 1 AND 5),
  valutazione_puntualita INT        NOT NULL,
    CONSTRAINT CHK_rec_pun CHECK(valutazione_puntualita BETWEEN 1 AND 5),
  valutazione_pulizia   INT         NOT NULL,
    CONSTRAINT CHK_rec_pul CHECK(valutazione_pulizia BETWEEN 1 AND 5),
  valutazione_comfort   INT         NOT NULL,
    CONSTRAINT CHK_rec_comf CHECK(valutazione_comfort BETWEEN 1 AND 5),
  valutazione_autista   INT         NOT NULL,
    CONSTRAINT CHK_rec_aut CHECK(valutazione_autista BETWEEN 1 AND 5),
  titolo_recensione     VARCHAR(200)NULL,
  testo_recensione      TEXT        NULL,
  data_recensione       DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  anonima               BIT         NOT NULL DEFAULT(0),
  verificata            BIT         NOT NULL DEFAULT(0),
  risposta_aziendale    TEXT        NULL,
  data_risposta         DATETIME2   NULL,
  moderata              BIT         NOT NULL DEFAULT(0),
  pubblicata            BIT         NOT NULL DEFAULT(1),
  created_at            DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_rec_clienti FOREIGN KEY(id_cliente)
    REFERENCES dbo.clienti(id_cliente),
  CONSTRAINT FK_rec_corse   FOREIGN KEY(id_corsa)
    REFERENCES dbo.corse(id_corsa),
  CONSTRAINT FK_rec_biglietti FOREIGN KEY(id_biglietto)
    REFERENCES dbo.biglietti(id_biglietto),
  CONSTRAINT FK_rec_autisti FOREIGN KEY(id_autista)
    REFERENCES dbo.autisti(id_autista)
);
GO

--------------------------------------------------------------------------------
-- Tabella Promozioni
--------------------------------------------------------------------------------
CREATE TABLE dbo.promozioni (
  id_promozione      INT         IDENTITY(1,1) PRIMARY KEY,
  codice_promozione  VARCHAR(20) NOT NULL UNIQUE,
  nome_promozione    VARCHAR(150)NOT NULL,
  descrizione        TEXT        NULL,
  tipo_sconto        VARCHAR(20) NOT NULL,
    CONSTRAINT CHK_promo_tipo CHECK(tipo_sconto 
      IN('percentuale','fisso','seconda_corsa_gratis')),
  valore_sconto      DECIMAL(8,2)NOT NULL,
  sconto_massimo     DECIMAL(8,2)NULL,
  utilizzi_massimi   INT         NOT NULL DEFAULT(1),
  utilizzi_per_cliente INT       NOT NULL DEFAULT(1),
  importo_minimo     DECIMAL(8,2)NOT NULL DEFAULT(0.00),
  data_inizio        DATE        NOT NULL,
  data_fine          DATE        NOT NULL,
  linee_incluse      NVARCHAR(MAX) NULL,
  linee_escluse      NVARCHAR(MAX) NULL,
  giorni_settimana   NVARCHAR(MAX) NULL,
  clienti_target     VARCHAR(10) NOT NULL DEFAULT 'tutti',
    CONSTRAINT CHK_promo_target CHECK(clienti_target 
      IN('tutti','nuovi','fedeli','business')),
  attiva             BIT         NOT NULL DEFAULT(1),
  utilizzi_totali    INT         NOT NULL DEFAULT(0),
  fatturato_generato DECIMAL(12,2)NOT NULL DEFAULT(0.00),
  created_at         DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at         DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

--------------------------------------------------------------------------------
-- Tabella Utilizzi Promozioni
--------------------------------------------------------------------------------
CREATE TABLE dbo.utilizzi_promozioni (
  id_utilizzo_promozione INT       IDENTITY(1,1) PRIMARY KEY,
  id_promozione          INT       NOT NULL,
  id_cliente             INT       NOT NULL,
  id_prenotazione        INT       NOT NULL,
  data_utilizzo          DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  sconto_applicato       DECIMAL(8,2) NOT NULL,
  importo_originale      DECIMAL(8,2) NOT NULL,
  importo_finale         DECIMAL(8,2) NOT NULL,
  created_at             DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_up_promo FOREIGN KEY(id_promozione)
    REFERENCES dbo.promozioni(id_promozione),
  CONSTRAINT FK_up_clienti FOREIGN KEY(id_cliente)
    REFERENCES dbo.clienti(id_cliente),
  CONSTRAINT FK_up_preno FOREIGN KEY(id_prenotazione)
    REFERENCES dbo.prenotazioni(id_prenotazione)
);
GO

--------------------------------------------------------------------------------
-- Tabella Pagamenti
--------------------------------------------------------------------------------
CREATE TABLE dbo.pagamenti (
  id_pagamento        INT         IDENTITY(1,1) PRIMARY KEY,
  id_prenotazione     INT         NOT NULL,
  codice_transazione  VARCHAR(100)NOT NULL UNIQUE,
  metodo_pagamento    VARCHAR(20) NOT NULL,
    CONSTRAINT CHK_pay_met CHECK(metodo_pagamento 
      IN('carta_credito','carta_debito','paypal','bonifico','contanti','voucher')),
  provider_pagamento  VARCHAR(50) NULL,
  importo             DECIMAL(10,2)NOT NULL,
  valuta              CHAR(3)     NOT NULL DEFAULT 'EUR',
  commissioni         DECIMAL(6,2)NOT NULL DEFAULT(0.00),
  data_pagamento      DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  stato_pagamento     VARCHAR(20) NOT NULL DEFAULT 'pending',
    CONSTRAINT CHK_pay_stat CHECK(stato_pagamento 
      IN('pending','completed','failed','refunded','cancelled')),
  codice_autorizzazione VARCHAR(50)NULL,
  dettagli_carta      NVARCHAR(MAX) NULL,
  ip_cliente          VARCHAR(45) NULL,
  user_agent          TEXT        NULL,
  created_at          DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at          DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_pay_preno FOREIGN KEY(id_prenotazione)
    REFERENCES dbo.prenotazioni(id_prenotazione)
);
GO

--------------------------------------------------------------------------------
-- Tabella Fatture
--------------------------------------------------------------------------------
CREATE TABLE dbo.fatture (
  id_fattura           INT         IDENTITY(1,1) PRIMARY KEY,
  numero_fattura       VARCHAR(30) NOT NULL UNIQUE,
  id_cliente           INT         NOT NULL,
  id_prenotazione      INT         NULL,
  tipo_fattura         VARCHAR(20) NOT NULL DEFAULT 'ricevuta',
    CONSTRAINT CHK_fat_tipo CHECK(tipo_fattura 
      IN('ricevuta','fattura_semplice','fattura_elettronica')),
  data_emissione       DATE        NOT NULL,
  data_scadenza        DATE        NULL,
  importo_netto        DECIMAL(10,2)NOT NULL,
  importo_iva          DECIMAL(8,2) NOT NULL DEFAULT(0.00),
  importo_totale       DECIMAL(10,2)NOT NULL,
  aliquota_iva         DECIMAL(4,2) NOT NULL DEFAULT(22.00),
  codice_fiscale_cliente VARCHAR(20)NULL,
  partita_iva_cliente  VARCHAR(20) NULL,
  ragione_sociale_cliente VARCHAR(200)NULL,
  indirizzo_fatturazione TEXT      NULL,
  stato_fattura        VARCHAR(20) NOT NULL DEFAULT 'bozza',
    CONSTRAINT CHK_fat_stat CHECK(stato_fattura 
      IN('bozza','emessa','inviata','pagata','stornata')),
  created_at           DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  updated_at           DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_fat_clienti FOREIGN KEY(id_cliente)
    REFERENCES dbo.clienti(id_cliente),
  CONSTRAINT FK_fat_preno FOREIGN KEY(id_prenotazione)
    REFERENCES dbo.prenotazioni(id_prenotazione)
);
GO

--------------------------------------------------------------------------------
-- Tabella Costi Operativi
--------------------------------------------------------------------------------
CREATE TABLE dbo.costi_operativi (
  id_costo         INT          IDENTITY(1,1) PRIMARY KEY,
  id_corsa         INT          NULL,
  id_veicolo       INT          NULL,
  id_linea         INT          NULL,
  tipo_costo       VARCHAR(15)  NOT NULL,
    CONSTRAINT CHK_costo_tipo CHECK(tipo_costo 
      IN('carburante','pedaggio','manutenzione','assicurazione','personale','altro')),
  descrizione      VARCHAR(200) NULL,
  importo          DECIMAL(8,2) NOT NULL,
  data_costo       DATE         NOT NULL,
  fornitore        VARCHAR(100) NULL,
  numero_fattura   VARCHAR(50)  NULL,
  km_riferimento   INT          NULL,
  note_costo       TEXT         NULL,
  categoria_contabile VARCHAR(50)NULL,
  deducibile_iva   BIT          NOT NULL DEFAULT(1),
  created_at       DATETIME2    NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_costi_corse FOREIGN KEY(id_corsa)
    REFERENCES dbo.corse(id_corsa),
  CONSTRAINT FK_costi_veicoli FOREIGN KEY(id_veicolo)
    REFERENCES dbo.veicoli(id_veicolo),
  CONSTRAINT FK_costi_linee FOREIGN KEY(id_linea)
    REFERENCES dbo.linee(id_linea)
);
GO

--------------------------------------------------------------------------------
-- Tabella Comunicazioni
--------------------------------------------------------------------------------
CREATE TABLE dbo.comunicazioni (
  id_comunicazione INT           IDENTITY(1,1) PRIMARY KEY,
  tipo_comunicazione VARCHAR(10) NOT NULL,
    CONSTRAINT CHK_com_tipo CHECK(tipo_comunicazione 
      IN('email','sms','push','whatsapp')),
  destinatario      VARCHAR(200) NOT NULL,
  mittente          VARCHAR(100) NULL,
  oggetto           VARCHAR(200) NULL,
  corpo_messaggio   TEXT         NOT NULL,
  template_utilizzato VARCHAR(100)NULL,
  id_cliente        INT          NULL,
  id_prenotazione   INT          NULL,
  id_corsa          INT          NULL,
  data_invio        DATETIME2    NOT NULL DEFAULT SYSUTCDATETIME(),
  data_consegna     DATETIME2    NULL,
  data_lettura      DATETIME2    NULL,
  stato_invio       VARCHAR(10)  NOT NULL DEFAULT 'pending',
    CONSTRAINT CHK_com_stato CHECK(stato_invio 
      IN('pending','sent','delivered','read','failed')),
  provider_servizio VARCHAR(50)  NULL,
  costo_invio       DECIMAL(6,4) NOT NULL DEFAULT(0.0000),
  codice_errore     VARCHAR(50)  NULL,
  tentativi_invio   INT          NOT NULL DEFAULT(1),
  priorita          VARCHAR(10)  NOT NULL DEFAULT 'normale',
    CONSTRAINT CHK_com_prio CHECK(priorita 
      IN('bassa','normale','alta','urgente')),
  created_at        DATETIME2    NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_com_clienti FOREIGN KEY(id_cliente)
    REFERENCES dbo.clienti(id_cliente),
  CONSTRAINT FK_com_preno FOREIGN KEY(id_prenotazione)
    REFERENCES dbo.prenotazioni(id_prenotazione),
  CONSTRAINT FK_com_corse FOREIGN KEY(id_corsa)
    REFERENCES dbo.corse(id_corsa)
);
GO

--------------------------------------------------------------------------------
-- Tabella Log Attività
--------------------------------------------------------------------------------
CREATE TABLE dbo.log_attivita (
  id_log               BIGINT     IDENTITY(1,1) PRIMARY KEY,
  tabella_interessata  VARCHAR(50)NULL,
  id_record            INT        NULL,
  operazione           VARCHAR(10)NOT NULL,
    CONSTRAINT CHK_log_op CHECK(operazione 
      IN('INSERT','UPDATE','DELETE','SELECT')),
  utente_sistema       VARCHAR(100)NULL,
  ip_address           VARCHAR(45) NULL,
  user_agent           TEXT        NULL,
  valori_precedenti    NVARCHAR(MAX)NULL,
  valori_nuovi         NVARCHAR(MAX)NULL,
  timestamp_operazione DATETIME2   NOT NULL DEFAULT SYSUTCDATETIME(),
  durata_ms            INT         NULL,
  note_log             TEXT        NULL
);
GO

--------------------------------------------------------------------------------
-- Tabella Configurazioni Sistema
--------------------------------------------------------------------------------
CREATE TABLE dbo.configurazioni_sistema (
  id_configurazione     INT        IDENTITY(1,1) PRIMARY KEY,
  chiave_configurazione VARCHAR(100)NOT NULL UNIQUE,
  valore_configurazione TEXT       NULL,
  tipo_valore           VARCHAR(10)NOT NULL DEFAULT 'string',
    CONSTRAINT CHK_cfg_tipo CHECK(tipo_valore 
      IN('string','integer','decimal','boolean','json')),
  descrizione           TEXT       NULL,
  categoria             VARCHAR(50)NULL,
  modificabile          BIT        NOT NULL DEFAULT(1),
  valore_default        TEXT       NULL,
  data_modifica         DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
  utente_modifica       VARCHAR(100)NULL,
  created_at            DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

--------------------------------------------------------------------------------
-- VISTE PER REPORTING
--------------------------------------------------------------------------------

-- Occupazione corse
CREATE VIEW dbo.v_occupazione_corse AS
 SELECT
   c.id_corsa,
   c.numero_corsa,
   c.data_partenza,
   l.nome_linea,
   v.numero_veicolo,
   v.capacita_passeggeri,
   c.posti_prenotati,
   c.posti_occupati,
   CASE 
     WHEN v.capacita_passeggeri>0 
     THEN ROUND(100.0 * c.posti_occupati / v.capacita_passeggeri,2)
     ELSE 0 END AS percentuale_occupazione,
   c.incasso_totale,
   c.stato_corsa
 FROM dbo.corse c
 JOIN dbo.linee l ON c.id_linea = l.id_linea
 LEFT JOIN dbo.veicoli v ON c.id_veicolo = v.id_veicolo;
GO

-- Statistiche clienti
CREATE VIEW dbo.v_statistiche_clienti AS
 SELECT
   cl.id_cliente,
   cl.nome,
   cl.cognome,
   cl.email,
   COUNT(DISTINCT p.id_prenotazione) AS numero_prenotazioni,
   COUNT(DISTINCT b.id_biglietto)     AS numero_biglietti,
   SUM(p.importo_totale)              AS spesa_totale,
   AVG(p.importo_totale)              AS spesa_media,
   MAX(p.data_prenotazione)           AS ultima_prenotazione,
   MIN(p.data_prenotazione)           AS prima_prenotazione,
   AVG(r.valutazione_generale)        AS valutazione_media
 FROM dbo.clienti cl
 LEFT JOIN dbo.prenotazioni p ON cl.id_cliente = p.id_cliente
 LEFT JOIN dbo.biglietti b ON p.id_prenotazione = b.id_prenotazione
 LEFT JOIN dbo.recensioni r ON cl.id_cliente = r.id_cliente
 GROUP BY cl.id_cliente, cl.nome, cl.cognome, cl.email;
GO

-- Performance linee
CREATE VIEW dbo.v_performance_linee AS
 SELECT
   l.id_linea,
   l.codice_linea,
   l.nome_linea,
   l.tipo_linea,
   COUNT(c.id_corsa)           AS numero_corse,
   AVG(c.posti_occupati)       AS media_passeggeri,
   SUM(c.incasso_totale)       AS incasso_totale,
   AVG(c.ritardo_minuti)       AS ritardo_medio,
   SUM(CASE WHEN c.stato_corsa='cancellata' THEN 1 ELSE 0 END)
     AS corse_cancellate
 FROM dbo.linee l
 LEFT JOIN dbo.corse c ON l.id_linea = c.id_linea
 GROUP BY l.id_linea, l.codice_linea, l.nome_linea, l.tipo_linea;
GO

-- Analisi nuove tratte
CREATE VIEW [dbo].[v_analisi_nuove_tratte] 
AS 
SELECT TOP 100 percent 
	sp.id_citta AS id_citta_partenza, 
	cp.nome_citta AS citta_partenza,
	sa.id_citta AS id_citta_arrivo,
	ca.nome_citta AS citta_arrivo,
	COUNT(b.id_biglietto) AS numero_biglietti_venduti,
	COUNT(DISTINCT b.id_passeggero) AS numero_clienti_unici,
	SUM(b.prezzo_biglietto) AS ricavo_totale 
FROM 
	biglietti b 
	JOIN stazioni sp ON b.id_stazione_partenza = sp.id_stazione 
	JOIN stazioni sa ON b.id_stazione_arrivo = sa.id_stazione 
	JOIN citta cp ON sp.id_citta = cp.id_citta 
	JOIN citta ca ON sa.id_citta = ca.id_citta 
GROUP BY 
	sp.id_citta, 
	cp.nome_citta, 
	sa.id_citta, 
	ca.nome_citta 
ORDER BY numero_biglietti_venduti DESC;
GO


--------------------------------------------------------------------------------
-- STORE PROCEDEURE PER REPORTING
--------------------------------------------------------------------------------

--Ultimi 5 viaggi dato id cliente
CREATE PROCEDURE 
[dbo].[sp_get_ultimi_5_viaggi_cliente] (@id_cliente INT) AS 
BEGIN 
SELECT TOP 5 
	COUNT(DISTINCT b.codice_biglietto) as biglietti,
	b.data_viaggio,
	b.ora_partenza,
	sp.nome_stazione AS stazione_partenza,
	sa.nome_stazione AS stazione_arrivo,
	l.nome_linea,
	c.numero_corsa,
	b.prezzo_biglietto 
FROM 
	biglietti b JOIN corse c ON b.id_corsa = c.id_corsa 
	JOIN linee l ON c.id_linea = l.id_linea 
	JOIN stazioni sp ON b.id_stazione_partenza = sp.id_stazione 
	JOIN stazioni sa ON b.id_stazione_arrivo = sa.id_stazione 
WHERE b.id_prenotazione 
	IN (SELECT id_prenotazione FROM prenotazioni WHERE id_cliente = @id_cliente) 
GROUP BY 
	b.data_viaggio,
	b.ora_partenza,
	sp.nome_stazione,
	sa.nome_stazione,
	l.nome_linea,
	c.numero_corsa,
	b.prezzo_biglietto 
ORDER BY 
	b.data_viaggio DESC, b.ora_partenza DESC
END;
GO
--------------------------------------------------------------------------------
-- FUNCTION OPERATIVA
--------------------------------------------------------------------------------

--Funzione che genera un codice tessera dati in input Id cliente, nome e cogome
CREATE FUNCTION [dbo].[fn_genera_codice_tessera_premium] (@id_cliente INT, @nome VARCHAR(100), @cognome VARCHAR(100)) 
RETURNS 
	VARCHAR(50) AS BEGIN DECLARE @anno_corrente VARCHAR(4);
DECLARE @codice_hash VARCHAR(10);
DECLARE @codice_tessera VARCHAR(50);
SET @anno_corrente = CAST(YEAR(GETDATE()) AS VARCHAR(4)); 
SET @codice_hash = UPPER(SUBSTRING(@nome, 1, 2) + SUBSTRING(@cognome, 1, 2));
SET @codice_tessera = CONCAT('PREMIUM-', @id_cliente, '-', @anno_corrente, '-', @codice_hash);
RETURN @codice_tessera;
END;
GO
/*
===============================================================================
  10) INDICI AGGIUNTIVI PER PERFORMANCE
  
===============================================================================
*/



-- Indice composto su biglietti per data di viaggio e stato
CREATE INDEX IX_biglietti_data_stato 
  ON dbo.biglietti (data_viaggio, stato_biglietto);
GO

-- Indice composto su corse per data e linea
CREATE INDEX IX_corse_data_linea 
  ON dbo.corse (data_partenza, id_linea);
GO

-- Indice composto su prenotazioni per cliente e data prenotazione
CREATE INDEX IX_prenotazioni_cliente_data 
  ON dbo.prenotazioni (id_cliente, data_prenotazione);
GO

-- Indice composto su tracking_veicoli per veicolo e timestamp
CREATE INDEX IX_tracking_veicolo_timestamp 
  ON dbo.tracking_veicoli (id_veicolo, timestamp_rilevazione);
GO

-- Indice composto su comunicazioni per cliente e tipo
CREATE INDEX IX_comunicazioni_cliente_tipo 
  ON dbo.comunicazioni (id_cliente, tipo_comunicazione);
GO



--------------------------------------------------------------------------------
-- 12) RIATTIVA TUTTI I VINCOLI E CONSTRAINTS
--------------------------------------------------------------------------------

-- Verifica e riattiva i vincoli FK in tutte le tabelle
EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';
GO



PRINT 'Database euroexpress_transport creato con successo.';
