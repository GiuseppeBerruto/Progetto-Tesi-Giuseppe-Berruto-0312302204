-- ====================================================================
-- INSERIMENTO DATI DATABASE “euroexpress_transport”
-- File con INSERT per popolare tutte le tabelle con dati di esempio
-- ====================================================================

USE euroexpress_transport;

-- Disabilita temporaneamente tutti i vincoli FK
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
GO


-- ====================================================================
-- INSERIMENTO DATI ANAGRAFICHE E CONFIGURAZIONE
-- ====================================================================

-- Inserimento Nazioni
INSERT INTO nazioni (id_nazione, nome_nazione, codice_telefonico, valuta_principale, fuso_orario, ue_schengen, attiva) VALUES
('IT', 'Italia', '+39', 'EUR', 'CET', 1, 1),
('FR', 'Francia', '+33', 'EUR', 'CET', 1, 1),
('DE', 'Germania', '+49', 'EUR', 'CET', 1, 1),
('ES', 'Spagna', '+34', 'EUR', 'CET', 1, 1),
('AT', 'Austria', '+43', 'EUR', 'CET', 1, 1),
('CH', 'Svizzera', '+41', 'CHF', 'CET', 0, 1),
('NL', 'Paesi Bassi', '+31', 'EUR', 'CET', 1, 1),
('BE', 'Belgio', '+32', 'EUR', 'CET', 1, 1),
('PT', 'Portogallo', '+351', 'EUR', 'WET', 1, 1),
('GB', 'Regno Unito', '+44', 'GBP', 'GMT', 0, 1),
('PL', 'Polonia', '+48', 'PLN', 'CET', 1, 1),
('CZ', 'Repubblica Ceca', '+420', 'CZK', 'CET', 1, 1),
('HU', 'Ungheria', '+36', 'HUF', 'CET', 1, 1),
('SK', 'Slovacchia', '+421', 'EUR', 'CET', 1, 1),
('SI', 'Slovenia', '+386', 'EUR', 'CET', 1, 1),
('HR', 'Croazia', '+385', 'EUR', 'CET', 1, 1),
('GR', 'Grecia', '+30', 'EUR', 'EET', 1, 1),
('RO', 'Romania', '+40', 'RON', 'EET', 1, 1),
('BG', 'Bulgaria', '+359', 'BGN', 'EET', 1, 1),
('SE', 'Svezia', '+46', 'SEK', 'CET', 1, 1),
('DK', 'Danimarca', '+45', 'DKK', 'CET', 1, 1),
('NO', 'Norvegia', '+47', 'NOK', 'CET', 0, 1),
('FI', 'Finlandia', '+358', 'EUR', 'EET', 1, 1);

-- Inserimento Regioni (Italia)
INSERT INTO regioni (id_nazione, nome_regione, codice_regione) VALUES
('IT', 'Lombardia', 'LOM'),
('IT', 'Lazio', 'LAZ'),
('IT', 'Campania', 'CAM'),
('IT', 'Veneto', 'VEN'),
('IT', 'Sicilia', 'SIC'),
('IT', 'Piemonte', 'PIE'),
('IT', 'Puglia', 'PUG'),
('IT', 'Emilia-Romagna', 'EMR'),
('IT', 'Toscana', 'TOS'),
('IT', 'Calabria', 'CAL'),
('IT', 'Sardegna', 'SAR'),
('IT', 'Liguria', 'LIG'),
('IT', 'Marche', 'MAR'),
('IT', 'Abruzzo', 'ABR'),
('IT', 'Friuli-Venezia Giulia', 'FVG'),
('IT', 'Trentino-Alto Adige', 'TAA'),
('IT', 'Umbria', 'UMB'),
('IT', 'Basilicata', 'BAS'),
('IT', 'Molise', 'MOL'),
('IT', 'Valle d''Aosta', 'VDA'),
('FR', 'Île-de-France', 'IDF'),
('FR', 'Provence-Alpes-Côte d''Azur', 'PAC'),
('DE', 'Bayern', 'BY'),
('ES', 'Cataluña', 'CAT');

-- Inserimento Città
INSERT INTO citta (id_regione, nome_citta, codice_postale, latitudine, longitudine, popolazione, attiva) VALUES
(1, 'Milano', '20100', 45.4642035, 9.1899820, 1396059, 1),
(2, 'Roma', '00100', 41.9027835, 12.4963655, 2870500, 1),
(3, 'Napoli', '80100', 40.8517983, 14.2681244, 967069, 1),
(4, 'Venezia', '30100', 45.4408474, 12.3155151, 261905, 1),
(5, 'Palermo', '90100', 38.1156879, 13.3612671, 663173, 1),
(6, 'Torino', '10100', 45.0703393, 7.6869395, 870952, 1),
(7, 'Bari', '70100', 41.1171432, 16.8718715, 320475, 1),
(8, 'Bologna', '40100', 44.4949794, 11.3426327, 390636, 1),
(9, 'Firenze', '50100', 43.7695604, 11.2558136, 382258, 1),
(10, 'Catanzaro', '88100', 38.9059631, 16.5987008, 91000, 1),
(11, 'Cagliari', '09100', 39.2238411, 9.1216613, 154478, 1),
(12, 'Genova', '16100', 44.4056499, 8.9462754, 583601, 1),
(13, 'Ancona', '60100', 43.6158299, 13.5189033, 100861, 1),
(14, 'L''Aquila', '67100', 42.3498211, 13.3995091, 69441, 1),
(15, 'Trieste', '34100', 45.6495264, 13.7768182, 204420, 1),
(16, 'Trento', '38100', 46.0747793, 11.1217486, 118142, 1),
(17, 'Perugia', '06100', 43.1107168, 12.3908279, 166134, 1),
(18, 'Potenza', '85100', 40.6421160, 15.8059880, 66975, 1),
(19, 'Campobasso', '86100', 41.5630016, 14.6682042, 48747, 1),
(20, 'Aosta', '11100', 45.7372639, 7.3205208, 34062, 1),
(21, 'Parigi', '75001', 48.8566140, 2.3522219, 2161000, 1),
(22, 'Nizza', '06000', 43.7101728, 7.2619532, 342295, 1),
(23, 'Monaco', '80331', 48.1351253, 11.5819805, 1472000, 1),
(24, 'Barcellona', '08001', 41.3873974, 2.1681949, 1620343, 1);

-- Inserimento Stazioni
INSERT INTO stazioni (id_citta, nome_stazione, indirizzo, tipo_stazione, latitudine, longitudine, telefono, email, accessibilita_disabili, parcheggio_disponibile, numero_banchine, attiva) VALUES
(1, 'Milano Centrale', 'Piazza Duca d''Aosta, 1', 'terminale', 45.4642035, 9.1899820, '+39 02 67500', 'milano@euroexpress.it', 1, 1, 15, 1),
(2, 'Roma Tiburtina', 'Circonvallazione Nomentana, 00162', 'terminale', 41.9027835, 12.4963655, '+39 06 44704', 'roma@euroexpress.it', 1, 1, 20, 1),
(3, 'Napoli Centrale', 'Piazza Garibaldi, 80142', 'terminale', 40.8517983, 14.2681244, '+39 081 5675432', 'napoli@euroexpress.it', 1, 1, 12, 1),
(4, 'Venezia Mestre', 'Viale Stazione, 30171', 'capolinea', 45.4408474, 12.3155151, '+39 041 5298765', 'venezia@euroexpress.it', 1, 0, 8, 1),
(5, 'Palermo Centrale', 'Via Roma, 90133', 'terminale', 38.1156879, 13.3612671, '+39 091 6543210', 'palermo@euroexpress.it', 1, 1, 10, 1),
(6, 'Torino Porta Nuova', 'Corso Vittorio Emanuele II, 10121', 'terminale', 45.0703393, 7.6869395, '+39 011 8765432', 'torino@euroexpress.it', 1, 1, 14, 1),
(7, 'Bari Centrale', 'Piazza Aldo Moro, 70121', 'capolinea', 41.1171432, 16.8718715, '+39 080 9876543', 'bari@euroexpress.it', 1, 1, 9, 1),
(8, 'Bologna Autostazione', 'Piazza XX Settembre, 40121', 'terminale', 44.4949794, 11.3426327, '+39 051 2345678', 'bologna@euroexpress.it', 1, 1, 16, 1),
(9, 'Firenze Santa Maria Novella', 'Piazza della Stazione, 50123', 'terminale', 43.7695604, 11.2558136, '+39 055 3456789', 'firenze@euroexpress.it', 1, 0, 11, 1),
(10, 'Catanzaro Lido', 'Via Nazionale, 88100', 'intermedia', 38.9059631, 16.5987008, '+39 0961 456789', 'catanzaro@euroexpress.it', 0, 1, 4, 1),
(11, 'Cagliari Autostazione', 'Piazza Matteotti, 09124', 'capolinea', 39.2238411, 9.1216613, '+39 070 567890', 'cagliari@euroexpress.it', 1, 1, 8, 1),
(12, 'Genova Brignole', 'Via del Lagaccio, 16136', 'terminale', 44.4056499, 8.9462754, '+39 010 678901', 'genova@euroexpress.it', 1, 0, 13, 1),
(13, 'Ancona Stazione', 'Piazza Rosselli, 60121', 'intermedia', 43.6158299, 13.5189033, '+39 071 789012', 'ancona@euroexpress.it', 0, 1, 6, 1),
(14, 'L''Aquila Terminal', 'Via XX Settembre, 67100', 'intermedia', 42.3498211, 13.3995091, '+39 0862 890123', 'laquila@euroexpress.it', 0, 1, 5, 1),
(15, 'Trieste Centrale', 'Piazza della Libertà, 34132', 'capolinea', 45.6495264, 13.7768182, '+39 040 901234', 'trieste@euroexpress.it', 1, 0, 7, 1),
(16, 'Trento Autostazione', 'Via Pozzo, 38122', 'intermedia', 46.0747793, 11.1217486, '+39 0461 012345', 'trento@euroexpress.it', 1, 1, 8, 1),
(17, 'Perugia Stazione', 'Piazza Vittorio Veneto, 06121', 'intermedia', 43.1107168, 12.3908279, '+39 075 123456', 'perugia@euroexpress.it', 0, 1, 6, 1),
(18, 'Potenza Centrale', 'Viale Dante, 85100', 'intermedia', 40.6421160, 15.8059880, '+39 0971 234567', 'potenza@euroexpress.it', 0, 1, 4, 1),
(19, 'Campobasso Terminal', 'Via Ferrari, 86100', 'intermedia', 41.5630016, 14.6682042, '+39 0874 345678', 'campobasso@euroexpress.it', 0, 0, 3, 1),
(20, 'Aosta Autostazione', 'Via Carrel, 11100', 'capolinea', 45.7372639, 7.3205208, '+39 0165 456789', 'aosta@euroexpress.it', 1, 1, 5, 1),
(21, 'Paris Bercy', '48 Boulevard de Bercy, 75012', 'terminale', 48.8566140, 2.3522219, '+33 1 44567890', 'paris@euroexpress.fr', 1, 1, 25, 1),
(22, 'Nice Terminal', 'Promenade des Anglais, 06000', 'capolinea', 43.7101728, 7.2619532, '+33 4 93567890', 'nice@euroexpress.fr', 1, 0, 8, 1),
(23, 'München ZOB', 'Hirtenstraße 22, 80335', 'terminale', 48.1351253, 11.5819805, '+49 89 5678901', 'muenchen@euroexpress.de', 1, 1, 18, 1),
(24, 'Barcelona Nord', 'Carrer d''Ali Bei, 80, 08013', 'terminale', 41.3873974, 2.1681949, '+34 93 6789012', 'barcelona@euroexpress.es', 1, 1, 15, 1);

-- Inserimento Tipologie Veicoli
INSERT INTO tipologie_veicoli (nome_tipologia, descrizione, capacita_min, capacita_max, lunghezza_media, altezza_media, peso_medio, consumo_medio_litri_100km, emissioni_co2_km) VALUES
('Pullman Standard', 'Autobus per tratte medie e lunghe percorrenze', 45, 55, 12.00, 3.80, 18000, 32.5, 850),
('Pullman Gran Turismo', 'Autobus di lusso per viaggi internazionali', 35, 45, 13.50, 3.90, 20000, 35.0, 920),
('Minibus', 'Veicolo per piccoli gruppi e tratte brevi', 15, 25, 8.50, 2.80, 8000, 18.5, 480),
('Pullman Doppio Piano', 'Autobus a due piani per alta capacità', 70, 85, 15.00, 4.20, 28000, 42.0, 1100),
('Pullman Urbano', 'Autobus per collegamenti urbani ed extraurbani', 30, 40, 10.50, 3.20, 12000, 25.0, 650),
('Pullman Executive', 'Autobus di classe superiore con servizi premium', 28, 35, 12.50, 3.85, 19000, 33.5, 880),
('Pullman Turistico', 'Autobus per tour e gite turistiche', 40, 50, 11.80, 3.70, 16500, 30.0, 780),
('Pullman Notturno', 'Autobus con cuccette per viaggi notturni', 25, 35, 14.00, 3.95, 22000, 38.0, 995),
('Autobus Ecologico', 'Veicolo ibrido o elettrico a basso impatto', 35, 45, 12.00, 3.75, 17000, 22.0, 450),
('Pullman Charter', 'Veicolo per noleggi privati e aziendali', 45, 55, 12.20, 3.80, 18500, 31.5, 825),
('Pullman Accessibile', 'Autobus attrezzato per passeggeri disabili', 40, 48, 12.00, 3.80, 18200, 32.0, 840),
('Pullman Regionale', 'Autobus per collegamenti regionali frequenti', 50, 60, 11.50, 3.60, 15500, 28.5, 745),
('Pullman Express', 'Autobus veloce per tratte dirette', 42, 52, 12.80, 3.85, 19500, 34.0, 890),
('Pullman Low Cost', 'Autobus economico per viaggi budget', 55, 65, 11.00, 3.50, 14000, 29.0, 760),
('Pullman Sleeper', 'Autobus con sedili reclinabili per viaggi lunghi', 32, 42, 13.20, 3.90, 21000, 36.5, 955),
('Van Shuttle', 'Furgone per trasferimenti aeroportuali', 8, 15, 6.50, 2.20, 4500, 12.5, 320),
('Pullman Festivo', 'Autobus per eventi e celebrazioni speciali', 38, 48, 12.50, 3.80, 18000, 31.0, 810),
('Pullman VIP', 'Autobus di lusso con servizi esclusivi', 18, 28, 14.50, 4.00, 24000, 40.0, 1050),
('Pullman Stagionale', 'Autobus per servizi stagionali turistici', 45, 55, 12.00, 3.75, 17500, 30.5, 800),
('Pullman Metropolitano', 'Autobus per collegare aree metropolitane', 48, 58, 11.20, 3.55, 15000, 27.5, 720);

-- Inserimento Veicoli
INSERT INTO veicoli (id_tipologia, numero_veicolo, targa, marca, modello, anno_immatricolazione, capacita_passeggeri, posti_disabili, aria_condizionata, wifi, bagagliaio_volume, toilette, schermo_tv, prese_elettriche, km_percorsi, ultimo_tagliando, prossimo_tagliando, assicurazione_scadenza, revisione_scadenza, stato_veicolo) VALUES
(1, 'EE001', 'AB123CD', 'Mercedes', 'Tourismo RHD', 2020, 49, 2, 1, 1, 8500, 1, 1, 1, 125000, '2024-11-15', '2025-05-15', '2025-12-31', '2025-06-30', 'attivo'),
(2, 'EE002', 'EF456GH', 'Setra', 'S 516 HD', 2019, 42, 3, 1, 1, 12000, 1, 1, 1, 180000, '2024-10-20', '2025-04-20', '2025-11-30', '2025-05-31', 'attivo'),
(3, 'EE003', 'IJ789KL', 'Iveco', 'Crossway LE', 2021, 23, 1, 1, 1, 4500, 0, 0, 1, 85000, '2024-12-01', '2025-06-01', '2025-12-31', '2025-07-31', 'attivo'),
(4, 'EE004', 'MN012OP', 'Van Hool', 'Astromega TX', 2018, 78, 4, 1, 1, 15000, 1, 1, 1, 220000, '2024-09-15', '2025-03-15', '2025-10-31', '2025-04-30', 'attivo'),
(5, 'EE005', 'QR345ST', 'MAN', 'Lion''s City', 2022, 35, 2, 1, 0, 3000, 0, 0, 0, 45000, '2024-11-30', '2025-05-30', '2025-12-31', '2025-08-31', 'attivo'),
(6, 'EE006', 'UV678WX', 'Scania', 'Touring HD', 2020, 32, 3, 1, 1, 10000, 1, 1, 1, 150000, '2024-10-10', '2025-04-10', '2025-11-30', '2025-06-30', 'attivo'),
(7, 'EE007', 'YZ901AB', 'Volvo', '9700', 2019, 47, 2, 1, 1, 9000, 1, 0, 1, 195000, '2024-11-05', '2025-05-05', '2025-12-31', '2025-05-31', 'attivo'),
(8, 'EE008', 'CD234EF', 'Neoplan', 'Tourliner', 2021, 31, 2, 1, 1, 11000, 1, 1, 1, 95000, '2024-12-10', '2025-06-10', '2025-12-31', '2025-07-31', 'attivo'),
(9, 'EE009', 'GH567IJ', 'BYD', 'K9 Electric', 2023, 41, 3, 1, 1, 6000, 0, 1, 1, 25000, '2024-11-25', '2025-05-25', '2025-12-31', '2025-08-31', 'attivo'),
(10, 'EE010', 'KL890MN', 'Mercedes', 'Sprinter 519', 2022, 19, 1, 1, 1, 2500, 0, 0, 0, 65000, '2024-10-25', '2025-04-25', '2025-11-30', '2025-06-30', 'attivo'),
(11, 'EE011', 'OP123QR', 'Setra', 'S 431 DT', 2020, 83, 5, 1, 1, 18000, 1, 1, 1, 175000, '2024-09-30', '2025-03-30', '2025-10-31', '2025-04-30', 'attivo'),
(12, 'EE012', 'ST456UV', 'Iveco', 'Magelys Pro', 2019, 53, 2, 1, 1, 8000, 1, 0, 1, 210000, '2024-11-08', '2025-05-08', '2025-12-31', '2025-05-31', 'attivo'),
(13, 'EE013', 'WX789YZ', 'Van Hool', 'CX45E', 2021, 45, 2, 1, 1, 9500, 1, 1, 1, 110000, '2024-12-05', '2025-06-05', '2025-12-31', '2025-07-31', 'attivo'),
(14, 'EE014', 'AB012CD', 'MAN', 'Lion''s Coach', 2018, 59, 3, 1, 0, 7500, 1, 0, 0, 240000, '2024-10-15', '2025-04-15', '2025-11-30', '2025-04-30', 'manutenzione'),
(15, 'EE015', 'EF345GH', 'Scania', 'Interlink HD', 2020, 37, 3, 1, 1, 5500, 0, 1, 1, 165000, '2024-11-20', '2025-05-20', '2025-12-31', '2025-06-30', 'attivo'),
(16, 'EE016', 'IJ678KL', 'Volvo', '8900', 2022, 12, 1, 1, 1, 2000, 0, 0, 1, 35000, '2024-10-30', '2025-04-30', '2025-11-30', '2025-08-31', 'attivo'),
(17, 'EE017', 'MN901OP', 'Neoplan', 'Cityliner', 2019, 44, 2, 1, 1, 8500, 1, 0, 1, 185000, '2024-11-12', '2025-05-12', '2025-12-31', '2025-05-31', 'attivo'),
(18, 'EE018', 'QR234ST', 'Mercedes', 'Tourismo M', 2021, 26, 2, 1, 1, 9000, 1, 1, 1, 90000, '2024-12-08', '2025-06-08', '2025-12-31', '2025-07-31', 'attivo'),
(19, 'EE019', 'UV567WX', 'Setra', 'S 415 NF', 2020, 51, 2, 1, 1, 7000, 1, 0, 1, 155000, '2024-10-05', '2025-04-05', '2025-10-31', '2025-06-30', 'attivo'),
(20, 'EE020', 'YZ890AB', 'Iveco', 'Daily Minibus', 2023, 15, 1, 1, 0, 1500, 0, 0, 0, 15000, '2024-11-28', '2025-05-28', '2025-12-31', '2025-08-31', 'attivo'),
(21, 'EE021', 'CD123EF', 'Van Hool', 'T916 Acron', 2018, 24, 2, 1, 1, 10500, 1, 1, 1, 260000, '2024-09-20', '2025-03-20', '2025-10-31', '2025-04-30', 'attivo'),
(22, 'EE022', 'GH456IJ', 'MAN', 'RR8', 2019, 62, 3, 1, 0, 6500, 1, 0, 0, 230000, '2024-10-12', '2025-04-12', '2025-11-30', '2025-05-31', 'attivo'),
(23, 'EE023', 'KL789MN', 'Scania', 'K410EB', 2022, 49, 2, 1, 1, 8200, 1, 1, 1, 75000, '2024-11-18', '2025-05-18', '2025-12-31', '2025-07-31', 'attivo'),
(24, 'EE024', 'OP012QR', 'Volvo', 'B8R', 2020, 38, 3, 1, 1, 5800, 0, 1, 1, 145000, '2024-10-28', '2025-04-28', '2025-11-30', '2025-06-30', 'attivo');

-- Inserimento Autisti
INSERT INTO autisti (codice_autista, nome, cognome, data_nascita, codice_fiscale, patente_numero, patente_categoria, patente_scadenza, cqc_numero, cqc_scadenza, telefono, email, indirizzo, data_assunzione, stipendio_base, stato_autista, valutazione_media) VALUES
('AUT001', 'Mario', 'Rossi', '1975-03-15', 'RSSMRA75C15F205X', 'MI123456789', 'D+E', '2029-03-15', 'CQC001234', '2027-03-15', '+39 338 1234567', 'mario.rossi@euroexpress.it', 'Via Roma 123, Milano', '2018-05-01', 2800.00, 'attivo', 4.75),
('AUT002', 'Giuseppe', 'Bianchi', '1980-07-22', 'BNCGPP80L22H501Y', 'RM987654321', 'D+E', '2028-07-22', 'CQC005678', '2026-07-22', '+39 335 9876543', 'giuseppe.bianchi@euroexpress.it', 'Viale Trastevere 45, Roma', '2019-09-15', 2900.00, 'attivo', 4.80),
('AUT003', 'Antonio', 'Verdi', '1972-11-08', 'VRDNTN72S08F839Z', 'NA456789012', 'D+E', '2027-11-08', 'CQC009012', '2025-11-08', '+39 347 4567890', 'antonio.verdi@euroexpress.it', 'Via Chiaia 67, Napoli', '2017-03-20', 2750.00, 'attivo', 4.85),
('AUT004', 'Francesco', 'Ferrari', '1978-12-30', 'FRRFNC78T30L736W', 'VE234567890', 'D+E', '2030-12-30', 'CQC003456', '2028-12-30', '+39 342 2345678', 'francesco.ferrari@euroexpress.it', 'Fondamenta Zattere 89, Venezia', '2020-01-10', 2850.00, 'attivo', 4.70),
('AUT005', 'Alessandro', 'Romano', '1985-06-14', 'RMNLSN85H14G273S', 'PA345678901', 'D+E', '2032-06-14', 'CQC007890', '2030-06-14', '+39 340 3456789', 'alessandro.romano@euroexpress.it', 'Via Maqueda 156, Palermo', '2021-04-05', 2650.00, 'attivo', 4.90),
('AUT006', 'Marco', 'Esposito', '1976-09-03', 'SPSMRC76P03L219K', 'TO456789012', 'D+E', '2029-09-03', 'CQC001122', '2027-09-03', '+39 339 4567890', 'marco.esposito@euroexpress.it', 'Corso Francia 234, Torino', '2018-11-12', 2950.00, 'attivo', 4.65),
('AUT007', 'Stefano', 'Ricci', '1982-01-19', 'RCCSFN82A19A662F', 'BA567890123', 'D+E', '2031-01-19', 'CQC002233', '2029-01-19', '+39 331 5678901', 'stefano.ricci@euroexpress.it', 'Via Argiro 78, Bari', '2020-08-03', 2700.00, 'attivo', 4.78),
('AUT008', 'Luca', 'Marino', '1979-04-26', 'MRNLCU79D26A944G', 'BO678901234', 'D+E', '2028-04-26', 'CQC003344', '2026-04-26', '+39 333 6789012', 'luca.marino@euroexpress.it', 'Via Ugo Bassi 112, Bologna', '2019-02-18', 2800.00, 'attivo', 4.82),
('AUT009', 'Andrea', 'Gallo', '1983-08-11', 'GLLNDR83M11D612H', 'FI789012345', 'D+E', '2032-08-11', 'CQC004455', '2030-08-11', '+39 345 7890123', 'andrea.gallo@euroexpress.it', 'Via del Corso 45, Firenze', '2021-06-25', 2750.00, 'attivo', 4.73),
('AUT010', 'Roberto', 'Costa', '1977-12-05', 'CSTRBT77T05C351I', 'GE890123456', 'D+E', '2030-12-05', 'CQC005566', '2028-12-05', '+39 348 8901234', 'roberto.costa@euroexpress.it', 'Via del Campo 23, Genova', '2019-10-14', 2850.00, 'attivo', 4.88),
('AUT011', 'Davide', 'Lombardi', '1984-02-28', 'LMBDVD84B28F205J', 'MI901234567', 'D+E', '2031-02-28', 'CQC006677', '2029-02-28', '+39 349 9012345', 'davide.lombardi@euroexpress.it', 'Via Brera 67, Milano', '2020-12-07', 2900.00, 'attivo', 4.76),
('AUT012', 'Paolo', 'Santoro', '1981-10-17', 'SNTPLA81R17H501K', 'RM012345678', 'D+E', '2029-10-17', 'CQC007788', '2027-10-17', '+39 346 0123456', 'paolo.santoro@euroexpress.it', 'Via Nazionale 134, Roma', '2018-07-23', 2950.00, 'attivo', 4.81),
('AUT013', 'Matteo', 'De Luca', '1986-05-12', 'DLCMTT86E12F839L', 'NA123456789', 'D+E', '2033-05-12', 'CQC008899', '2031-05-12', '+39 337 1234567', 'matteo.deluca@euroexpress.it', 'Via Toledo 89, Napoli', '2022-01-15', 2600.00, 'attivo', 4.92),
('AUT014', 'Simone', 'Rizzo', '1975-11-30', 'RZZSIM75S30L736M', 'VE234567891', 'D+E', '2028-11-30', 'CQC009900', '2026-11-30', '+39 334 2345678', 'simone.rizzo@euroexpress.it', 'Castello 1234, Venezia', '2017-09-08', 2800.00, 'ferie', 4.67),
('AUT015', 'Fabio', 'Greco', '1980-03-07', 'GRCFBA80C07G273N', 'PA345678902', 'D+E', '2029-03-07', 'CQC001011', '2027-03-07', '+39 341 3456789', 'fabio.greco@euroexpress.it', 'Via Roma 234, Palermo', '2019-05-20', 2750.00, 'attivo', 4.74),
('AUT016', 'Claudio', 'Pellegrini', '1978-07-25', 'PLLCLD78L25L219O', 'TO456789014', 'D+E', '2030-07-25', 'CQC002022', '2028-07-25', '+39 350 4567890', 'claudio.pellegrini@euroexpress.it', 'Via Po 156, Torino', '2020-03-12', 2850.00, 'attivo', 4.79),
('AUT017', 'Enrico', 'Longo', '1983-09-14', 'LNGNRC83P14A662P', 'BA567890124', 'D+E', '2032-09-14', 'CQC003033', '2030-09-14', '+39 351 5678901', 'enrico.longo@euroexpress.it', 'Corso Vittorio Emanuele 67, Bari', '2021-08-18', 2700.00, 'attivo', 4.86),
('AUT018', 'Federico', 'Mancini', '1979-01-22', 'MNCFDR79A22A944Q', 'BO678901264', 'D+E', '2028-01-22', 'CQC004044', '2026-01-22', '+39 352 6789012', 'federico.mancini@euroexpress.it', 'Via Rizzoli 89, Bologna', '2018-12-03', 2900.00, 'attivo', 4.71),
('AUT019', 'Daniele', 'Ferretti', '1985-04-18', 'FRRDNL85D18D612R', 'FI789012145', 'D+E', '2033-04-18', 'CQC005055', '2031-04-18', '+39 353 7890123', 'daniele.ferretti@euroexpress.it', 'Piazza Duomo 12, Firenze', '2022-02-28', 2650.00, 'attivo', 4.94),
('AUT020', 'Gabriele', 'Moretti', '1976-08-09', 'MRTGBR76M09C351S', 'GE890123436', 'D+E', '2029-08-09', 'CQC006066', '2027-08-09', '+39 354 8901234', 'gabriele.moretti@euroexpress.it', 'Via Garibaldi 45, Genova', '2018-04-16', 2800.00, 'attivo', 4.83),
('AUT021', 'Michele', 'Bruno', '1982-12-15', 'BRNMHL82T15F205T', 'MI012345678', 'D+E', '2031-12-15', 'CQC007077', '2029-12-15', '+39 355 9012345', 'michele.bruno@euroexpress.it', 'Corso Buenos Aires 78, Milano', '2020-07-09', 2750.00, 'attivo', 4.77),
('AUT022', 'Vincenzo', 'Conti', '1984-06-03', 'CNTVNC84H03H501U', 'RM123456789', 'D+E', '2032-06-03', 'CQC008088', '2030-06-03', '+39 356 0123456', 'vincenzo.conti@euroexpress.it', 'Via Veneto 134, Roma', '2021-11-22', 2850.00, 'attivo', 4.89),
('AUT023', 'Salvatore', 'Russo', '1981-09-27', 'RSSSVT81P27F839V', 'NA234567890', 'D+E', '2030-09-27', 'CQC009099', '2028-09-27', '+39 357 1234567', 'salvatore.russo@euroexpress.it', 'Via dei Tribunali 56, Napoli', '2019-01-14', 2900.00, 'attivo', 4.72),
('AUT024', 'Massimo', 'Fontana', '1977-02-11', 'FNTMSM77B11L736W', 'VE345678901', 'D+E', '2029-02-11', 'CQC010100', '2027-02-11', '+39 358 2345678', 'massimo.fontana@euroexpress.it', 'San Marco 567, Venezia', '2017-12-05', 2950.00, 'attivo', 4.68);

-- ====================================================================
-- INSERIMENTO DATI CLIENTI E PASSEGGERI
-- ====================================================================

-- Inserimento Clienti
INSERT INTO clienti (tipo_cliente, codice_cliente, nome, cognome, ragione_sociale, codice_fiscale, data_nascita, sesso, id_nazione_nascita, telefono, email, indirizzo, id_citta, documento_tipo, documento_numero, documento_scadenza, id_nazione_rilascio, newsletter_consenso, marketing_consenso, stato_cliente, sconto_fedelta, punti_fedelta) VALUES
('privato', 'CLI001', 'Giovanni', 'Martinelli', NULL, 'MRTGNN85M15F205A', '1985-08-15', 'M', 'IT', '+39 340 1234567', 'giovanni.martinelli@email.it', 'Via Dante 45, Milano', 1, 'carta_identita', 'CI1234567', '2028-08-15', 'IT', 1, 1, 'attivo', 0.00, 150),
('privato', 'CLI002', 'Maria', 'Benedetti', NULL, 'BNDMRA82F22H501B', '1982-06-22', 'F', 'IT', '+39 335 9876543', 'maria.benedetti@email.it', 'Via Appia 123, Roma', 2, 'patente', 'PT9876543', '2029-06-22', 'IT', 1, 0, 'attivo', 5.00, 320),
('business', 'CLI003', 'Tech Solutions', NULL, 'Tech Solutions S.r.l.', '12345678901', NULL, NULL, 'IT', '+39 02 12345678', 'info@techsolutions.it', 'Via Montenapoleone 8, Milano', 1, 'carta_identita', 'CI2468135', '2030-12-31', 'IT', 1, 1, 'attivo', 10.00, 500),
('privato', 'CLI004', 'Francesca', 'Colombo', NULL, 'CLMFNC90A12F839C', '1990-01-12', 'F', 'IT', '+39 347 2468135', 'francesca.colombo@email.it', 'Via Caracciolo 67, Napoli', 3, 'passaporto', 'PP1357924', '2027-01-12', 'IT', 0, 1, 'attivo', 0.00, 75),
('privato', 'CLI005', 'Roberto', 'Gentile', NULL, 'GNTRBT78D30L736D', '1978-04-30', 'M', 'IT', '+39 348 1357924', 'roberto.gentile@email.it', 'Calle Larga 234, Venezia', 4, 'carta_identita', 'CI3691470', '2026-04-30', 'IT', 1, 1, 'attivo', 2.50, 180),
('agenzia', 'CLI006', 'Viaggi Belli', NULL, 'Viaggi Belli Travel Agency', '98765432109', NULL, NULL, 'IT', '+39 091 8765432', 'booking@viaggibelli.it', 'Via Libertà 156, Palermo', 5, 'carta_identita', 'CI4567890', '2031-05-15', 'IT', 1, 1, 'attivo', 15.00, 750),
('privato', 'CLI007', 'Alessandro', 'Fabbri', NULL, 'FBBLSN87H08L219E', '1987-06-08', 'M', 'IT', '+39 342 7410852', 'alessandro.fabbri@email.it', 'Via Roma 89, Torino', 6, 'patente', 'PT7410852', '2032-06-08', 'IT', 1, 0, 'attivo', 0.00, 95),
('privato', 'CLI008', 'Elena', 'Marchetti', NULL, 'MRCHLN91L19A662F', '1991-07-19', 'F', 'IT', '+39 339 9630741', 'elena.marchetti@email.it', 'Via Sparano 123, Bari', 7, 'carta_identita', 'CI9630741', '2029-07-19', 'IT', 0, 0, 'attivo', 1.00, 45),
('privato', 'CLI009', 'Marco', 'Pellegrino', NULL, 'PLLMRC83C25A944G', '1983-03-25', 'M', 'IT', '+39 333 1472583', 'marco.pellegrino@email.it', 'Via Indipendenza 78, Bologna', 8, 'passaporto', 'PP1472583', '2028-03-25', 'IT', 1, 1, 'attivo', 3.00, 220),
('privato', 'CLI010', 'Chiara', 'Ferri', NULL, 'FRRCHI89S15D612H', '1989-11-15', 'F', 'IT', '+39 345 2583691', 'chiara.ferri@email.it', 'Via Tornabuoni 45, Firenze', 9, 'carta_identita', 'CI2583691', '2030-11-15', 'IT', 1, 1, 'attivo', 0.00, 110),
('business', 'CLI011', 'Import Export Med', NULL, 'Import Export Mediterranean', '55566677788', NULL, NULL, 'IT', '+39 010 5566778', 'orders@importexportmed.it', 'Via del Campo 234, Genova', 12, 'carta_identita', 'CI7418529', '2027-09-30', 'IT', 1, 1, 'attivo', 8.00, 420),
('privato', 'CLI012', 'Stefano', 'Barbieri', NULL, 'BRBSFN86T12C351I', '1986-12-12', 'M', 'IT', '+39 351 8529630', 'stefano.barbieri@email.it', 'Via Garibaldi 167, Cagliari', 11, 'patente', 'PT8529630', '2031-12-12', 'IT', 0, 1, 'attivo', 0.00, 65),
('privato', 'CLI013', 'Valentina', 'Monti', NULL, 'MNTVNT92B28F205J', '1992-02-28', 'F', 'IT', '+39 340 3695147', 'valentina.monti@email.it', 'Corso di Porta Ticinese 89, Milano', 1, 'carta_identita', 'CI3695147', '2032-02-28', 'IT', 1, 0, 'attivo', 0.00, 85),
('privato', 'CLI014', 'Andrea', 'Gatti', NULL, 'GTTNDR84E18H501K', '1984-05-18', 'M', 'IT', '+39 348 1597534', 'andrea.gatti@email.it', 'Via del Tritone 234, Roma', 2, 'passaporto', 'PP1597534', '2029-05-18', 'IT', 1, 1, 'attivo', 4.00, 280),
('privato', 'CLI015', 'Silvia', 'Orlando', NULL, 'RLNSLV88A08F839L', '1988-01-08', 'F', 'IT', '+39 347 7534862', 'silvia.orlando@email.it', 'Spaccanapoli 156, Napoli', 3, 'carta_identita', 'CI7534862', '2027-01-08', 'IT', 0, 1, 'attivo', 0.00, 125),
('privato', 'CLI016', 'Matteo', 'Sartori', NULL, 'SRTMTT80L25L736M', '1980-07-25', 'M', 'IT', '+39 342 4681357', 'matteo.sartori@email.it', 'Dorsoduro 789, Venezia', 4, 'patente', 'PT4681357', '2028-07-25', 'IT', 1, 1, 'attivo', 2.00, 165),
('agenzia', 'CLI017', 'Mondo Viaggi', NULL, 'Mondo Viaggi Tour Operator', '11122233344', NULL, NULL, 'IT', '+39 091 1122334', 'info@mondoviaggi.it', 'Via Ruggero Settimo 67, Palermo', 5, 'carta_identita', 'CI1357924', '2030-08-20', 'IT', 1, 1, 'attivo', 12.00, 680),
('privato', 'CLI018', 'Giulia', 'Ricci', NULL, 'RCCGLI93D15L219N', '1993-04-15', 'F', 'IT', '+39 349 2468024', 'giulia.ricci@email.it', 'Via Pietro Micca 123, Torino', 6, 'carta_identita', 'CI2468024', '2033-04-15', 'IT', 1, 0, 'attivo', 0.00, 55),
('privato', 'CLI019', 'Davide', 'Mariani', NULL, 'MRNDVD85P03A662O', '1985-09-03', 'M', 'IT', '+39 331 5792468', 'davide.mariani@email.it', 'Corso Cavour 89, Bari', 7, 'passaporto', 'PP5792468', '2030-09-03', 'IT', 0, 0, 'attivo', 1.50, 135),
('privato', 'CLI020', 'Federica', 'De Santis', NULL, 'DSNTDR87S25A944P', '1987-11-25', 'F', 'IT', '+39 333 8024679', 'federica.desantis@email.it', 'Via Zamboni 234, Bologna', 8, 'carta_identita', 'CI8024679', '2029-11-25', 'IT', 1, 1, 'attivo', 0.00, 190),
('privato', 'CLI021', 'Luca', 'Conti', NULL, 'CNTLCU81A12D612Q', '1981-01-12', 'M', 'IT', '+39 345 6802467', 'luca.conti@email.it', 'Oltrarno 45, Firenze', 9, 'patente', 'PT6802467', '2026-01-12', 'IT', 1, 1, 'attivo', 3.50, 245),
('business', 'CLI022', 'Green Energy Solutions', NULL, 'Green Energy Solutions S.p.A.', '99988877766', NULL, NULL, 'IT', '+39 010 9988776', 'contact@greenenergy.it', 'Via XX Settembre 156, Genova', 12, 'carta_identita', 'CI9135702', '2031-07-10', 'IT', 1, 1, 'attivo', 20.00, 920),
('privato', 'CLI023', 'Simona', 'Grassi', NULL, 'GRSSMN90F18C351R', '1990-06-18', 'F', 'IT', '+39 351 3579024', 'simona.grassi@email.it', 'Via Manno 78, Cagliari', 11, 'carta_identita', 'CI3579024', '2032-06-18', 'IT', 0, 1, 'attivo', 0.00, 70),
('privato', 'CLI024', 'Emanuele', 'Santoro', NULL, 'SNTML79C22F205S', '1979-03-22', 'M', 'IT', '+39 340 0246813', 'emanuele.santoro@email.it', 'Via Brera 123, Milano', 1, 'passaporto', 'PP0246813', '2027-03-22', 'IT', 1, 0, 'attivo', 1.00, 155);

-- Inserimento Passeggeri (accompagnatori e minori)
INSERT INTO passeggeri (id_cliente, nome, cognome, data_nascita, codice_fiscale, documento_tipo, documento_numero, documento_scadenza, id_nazione_rilascio, sesso, accompagnatore, minore) VALUES
(1, 'Giovanni', 'Martinelli', '1985-08-15', 'MRTGNN85M15F205A', 'carta_identita', 'CI1234567', '2028-08-15', 'IT', 'M', 0, 0),
(1, 'Sofia', 'Martinelli', '2015-03-10', 'MRTSFN15C50F205B', 'carta_identita', 'CI1234568', '2025-03-10', 'IT', 'F', 0, 1),
(2, 'Maria', 'Benedetti', '1982-06-22', 'BNDMRA82F22H501B', 'patente', 'PT9876543', '2029-06-22', 'IT', 'F', 0, 0),
(3, 'Luca', 'Bianchi', '1978-09-14', 'BNCLCU78P14F205C', 'carta_identita', 'CI2468136', '2030-09-14', 'IT', 'M', 0, 0),
(4, 'Francesca', 'Colombo', '1990-01-12', 'CLMFNC90A12F839C', 'passaporto', 'PP1357924', '2027-01-12', 'IT', 'F', 0, 0),
(4, 'Marco', 'Colombo', '2012-07-25', 'CLMMRC12L25F839D', 'carta_identita', 'CI1357925', '2022-07-25', 'IT', 'M', 0, 1),
(5, 'Roberto', 'Gentile', '1978-04-30', 'GNTRBT78D30L736D', 'carta_identita', 'CI3691470', '2026-04-30', 'IT', 'M', 0, 0),
(5, 'Anna', 'Gentile', '1980-11-18', 'GNTANN80S58L736E', 'carta_identita', 'CI3691471', '2028-11-18', 'IT', 'F', 1, 0),
(6, 'Giuseppe', 'Verdi', '1975-05-20', 'VRDGPP75E20G273F', 'carta_identita', 'CI4567891', '2025-05-20', 'IT', 'M', 0, 0),
(7, 'Alessandro', 'Fabbri', '1987-06-08', 'FBBLSN87H08L219E', 'patente', 'PT7410852', '2032-06-08', 'IT', 'M', 0, 0),
(7, 'Giulia', 'Fabbri', '2018-12-15', 'FBBGLI18T55L219F', 'carta_identita', 'CI7410853', '2028-12-15', 'IT', 'F', 0, 1),
(8, 'Elena', 'Marchetti', '1991-07-19', 'MRCHLN91L19A662F', 'carta_identita', 'CI9630741', '2029-07-19', 'IT', 'F', 0, 0),
(9, 'Marco', 'Pellegrino', '1983-03-25', 'PLLMRC83C25A944G', 'passaporto', 'PP1472583', '2028-03-25', 'IT', 'M', 0, 0),
(9, 'Laura', 'Pellegrino', '1985-08-12', 'PLLLRA85M52A944H', 'carta_identita', 'CI1472584', '2030-08-12', 'IT', 'F', 1, 0),
(10, 'Chiara', 'Ferri', '1989-11-15', 'FRRCHI89S15D612H', 'carta_identita', 'CI2583691', '2030-11-15', 'IT', 'F', 0, 0),
(11, 'Michele', 'Rossi', '1982-02-28', 'RSSMHL82B28C351I', 'carta_identita', 'CI7418530', '2027-02-28', 'IT', 'M', 0, 0),
(12, 'Stefano', 'Barbieri', '1986-12-12', 'BRBSFN86T12C351I', 'patente', 'PT8529630', '2031-12-12', 'IT', 'M', 0, 0),
(12, 'Francesco', 'Barbieri', '2010-05-30', 'BRBFNC10E30C351J', 'carta_identita', 'CI8529631', '2020-05-30', 'IT', 'M', 0, 1),
(13, 'Valentina', 'Monti', '1992-02-28', 'MNTVNT92B28F205J', 'carta_identita', 'CI3695147', '2032-02-28', 'IT', 'F', 0, 0),
(14, 'Andrea', 'Gatti', '1984-05-18', 'GTTNDR84E18H501K', 'passaporto', 'PP1597534', '2029-05-18', 'IT', 'M', 0, 0),
(14, 'Paola', 'Gatti', '1986-09-22', 'GTTPLA86P62H501L', 'carta_identita', 'CI1597535', '2031-09-22', 'IT', 'F', 1, 0),
(15, 'Silvia', 'Orlando', '1988-01-08', 'RLNSLV88A08F839L', 'carta_identita', 'CI7534862', '2027-01-08', 'IT', 'F', 0, 0),
(16, 'Matteo', 'Sartori', '1980-07-25', 'SRTMTT80L25L736M', 'patente', 'PT4681357', '2028-07-25', 'IT', 'M', 0, 0),
(17, 'Carla', 'Bianchi', '1979-04-14', 'BNCCRL79D54G273M', 'carta_identita', 'CI1357926', '2029-04-14', 'IT', 'F', 0, 0),
(18, 'Giulia', 'Ricci', '1993-04-15', 'RCCGLI93D15L219N', 'carta_identita', 'CI2468024', '2033-04-15', 'IT', 'F', 0, 0),
(19, 'Davide', 'Mariani', '1985-09-03', 'MRNDVD85P03A662O', 'passaporto', 'PP5792468', '2030-09-03', 'IT', 'M', 0, 0),
(20, 'Federica', 'De Santis', '1987-11-25', 'DSNTDR87S25A944P', 'carta_identita', 'CI8024679', '2029-11-25', 'IT', 'F', 0, 0),
(21, 'Luca', 'Conti', '1981-01-12', 'CNTLCU81A12D612Q', 'patente', 'PT6802467', '2026-01-12', 'IT', 'M', 0, 0),
(22, 'Roberto', 'Verdi', '1983-07-08', 'VRDRBT83L08C351R', 'carta_identita', 'CI9135703', '2031-07-08', 'IT', 'M', 0, 0),
(23, 'Simona', 'Grassi', '1990-06-18', 'GRSSMN90F18C351R', 'carta_identita', 'CI3579024', '2032-06-18', 'IT', 'F', 0, 0),
(24, 'Emanuele', 'Santoro', '1979-03-22', 'SNTML79C22F205S', 'passaporto', 'PP0246813', '2027-03-22', 'IT', 'M', 0, 0);

-- ====================================================================
-- INSERIMENTO DATI LINEE E TRATTE
-- ====================================================================

-- Inserimento Linee
INSERT INTO linee (codice_linea, nome_linea, descrizione, tipo_linea, id_stazione_partenza, id_stazione_arrivo, distanza_km, durata_stimata_minuti, frequenza_settimanale, attiva, categoria_servizio) VALUES
('MIL-ROM-001', 'Milano - Roma Express', 'Collegamento diretto tra Milano e Roma', 'nazionale', 1, 2, 573, 360, 14, 1, 'comfort'),
('ROM-NAP-002', 'Roma - Napoli Veloce', 'Tratta veloce Roma-Napoli via autostrada', 'nazionale', 2, 3, 225, 150, 21, 1, 'economico'),
('MIL-VEN-003', 'Milano - Venezia', 'Collegamento Milano-Venezia con fermate', 'nazionale', 1, 4, 280, 210, 10, 1, 'comfort'),
('NAP-PAL-004', 'Napoli - Palermo', 'Collegamento con traghetto incluso', 'nazionale', 3, 5, 485, 420, 7, 1, 'comfort'),
('TOR-MIL-005', 'Torino - Milano', 'Tratta breve Torino-Milano', 'nazionale', 6, 1, 140, 105, 28, 1, 'economico'),
('BAR-ROM-006', 'Bari - Roma', 'Collegamento Adriatico-Capitale', 'nazionale', 7, 2, 445, 300, 14, 1, 'comfort'),
('BOL-FIR-007', 'Bologna - Firenze', 'Tratta appenninica Bologna-Firenze', 'nazionale', 8, 9, 105, 90, 21, 1, 'economico'),
('GEN-MIL-008', 'Genova - Milano', 'Collegamento Liguria-Lombardia', 'nazionale', 12, 1, 142, 120, 21, 1, 'comfort'),
('MIL-PAR-009', 'Milano - Parigi', 'Collegamento internazionale via Svizzera', 'internazionale', 1, 21, 851, 540, 7, 1, 'business'),
('ROM-BAR-010', 'Roma - Barcellona', 'Gran tour mediterraneo', 'internazionale', 2, 24, 1365, 840, 3, 1, 'premium'),
('VEN-MUN-011', 'Venezia - Monaco', 'Collegamento verso Germania via Austria', 'internazionale', 4, 23, 680, 450, 5, 1, 'business'),
('GEN-NIC-012', 'Genova - Nizza', 'Riviera Ligure-Costa Azzurra', 'internazionale', 12, 22, 195, 150, 14, 1, 'comfort'),
('MIL-FIR-013', 'Milano - Firenze', 'Collegamento diretto Nord-Centro', 'nazionale', 1, 9, 306, 240, 14, 1, 'comfort'),
('NAP-BAR-014', 'Napoli - Bari', 'Collegamento Campania-Puglia', 'nazionale', 3, 7, 255, 180, 14, 1, 'economico'),
('TOR-GEN-015', 'Torino - Genova', 'Collegamento Piemonte-Liguria', 'nazionale', 6, 12, 170, 135, 14, 1, 'economico'),
('FIR-ROM-016', 'Firenze - Roma', 'Collegamento Toscana-Lazio', 'nazionale', 9, 2, 273, 210, 21, 1, 'comfort'),
('BOL-VEN-017', 'Bologna - Venezia', 'Collegamento Emilia-Veneto', 'nazionale', 8, 4, 154, 120, 14, 1, 'economico'),
('CAG-ROM-018', 'Cagliari - Roma', 'Sardegna-Continente con traghetto', 'nazionale', 11, 2, 565, 480, 7, 1, 'comfort'),
('MIL-TRI-019', 'Milano - Trieste', 'Collegamento verso confine sloveno', 'nazionale', 1, 15, 401, 300, 7, 1, 'comfort'),
('PAL-NAP-020', 'Palermo - Napoli', 'Sicilia-Campania con traghetto', 'nazionale', 5, 3, 485, 420, 7, 1, 'comfort'),
('AOV-MIL-021', 'Aosta - Milano', 'Valle d''Aosta-Lombardia', 'nazionale', 20, 1, 184, 150, 14, 1, 'economico'),
('TRE-BOL-022', 'Trento - Bologna', 'Trentino-Emilia Romagna', 'nazionale', 16, 8, 174, 135, 14, 1, 'economico'),
('PER-ROM-023', 'Perugia - Roma', 'Umbria-Lazio', 'nazionale', 17, 2, 165, 120, 14, 1, 'economico'),
('POT-NAP-024', 'Potenza - Napoli', 'Basilicata-Campania', 'nazionale', 18, 3, 175, 135, 10, 1, 'economico');

-- Inserimento Fermate Intermedie
INSERT INTO fermate_linea (id_linea, id_stazione, ordine_fermata, km_progressivi, tempo_sosta_minuti, obbligatoria) VALUES
-- Linea Milano-Roma
(1, 1, 1, 0, 0, 1), -- Milano partenza
(1, 17, 2, 306, 15, 1), -- Perugia intermedia
(1, 2, 3, 573, 0, 1), -- Roma arrivo
-- Linea Roma-Napoli
(2, 2, 1, 0, 0, 1), -- Roma partenza
(2, 3, 2, 225, 0, 1), -- Napoli arrivo
-- Linea Milano-Venezia
(3, 1, 1, 0, 0, 1), -- Milano partenza
(3, 8, 2, 210, 10, 1), -- Bologna intermedia
(3, 4, 3, 280, 0, 1), -- Venezia arrivo
-- Linea Napoli-Palermo
(4, 3, 1, 0, 0, 1), -- Napoli partenza
(4, 5, 2, 485, 0, 1), -- Palermo arrivo
-- Linea Torino-Milano
(5, 6, 1, 0, 0, 1), -- Torino partenza
(5, 1, 2, 140, 0, 1), -- Milano arrivo
-- Linea Bari-Roma
(6, 7, 1, 0, 0, 1), -- Bari partenza
(6, 18, 2, 175, 10, 1), -- Potenza intermedia
(6, 2, 3, 445, 0, 1), -- Roma arrivo
-- Linea Bologna-Firenze
(7, 8, 1, 0, 0, 1), -- Bologna partenza
(7, 9, 2, 105, 0, 1), -- Firenze arrivo
-- Linea Genova-Milano
(8, 12, 1, 0, 0, 1), -- Genova partenza
(8, 1, 2, 142, 0, 1), -- Milano arrivo
-- Linea Milano-Parigi
(9, 1, 1, 0, 0, 1), -- Milano partenza
(9, 6, 2, 140, 15, 1), -- Torino intermedia
(9, 21, 3, 851, 0, 1), -- Parigi arrivo
-- Linea Roma-Barcellona
(10, 2, 1, 0, 0, 1), -- Roma partenza
(10, 12, 2, 505, 20, 1), -- Genova intermedia
(10, 22, 3, 700, 15, 1), -- Nizza intermedia
(10, 24, 4, 1365, 0, 1), -- Barcellona arrivo
-- Linea Venezia-Monaco
(11, 4, 1, 0, 0, 1), -- Venezia partenza
(11, 16, 2, 180, 10, 1), -- Trento intermedia
(11, 23, 3, 680, 0, 1), -- Monaco arrivo
-- Linea Genova-Nizza
(12, 12, 1, 0, 0, 1), -- Genova partenza
(12, 22, 2, 195, 0, 1), -- Nizza arrivo
-- Linea Milano-Firenze
(13, 1, 1, 0, 0, 1), -- Milano partenza
(13, 8, 2, 210, 10, 1), -- Bologna intermedia
(13, 9, 3, 306, 0, 1), -- Firenze arrivo
-- Linea Napoli-Bari
(14, 3, 1, 0, 0, 1), -- Napoli partenza
(14, 18, 2, 175, 10, 1), -- Potenza intermedia
(14, 7, 3, 255, 0, 1), -- Bari arrivo
-- Linea Torino-Genova
(15, 6, 1, 0, 0, 1), -- Torino partenza
(15, 12, 2, 170, 0, 1), -- Genova arrivo
-- Linea Firenze-Roma
(16, 9, 1, 0, 0, 1), -- Firenze partenza
(16, 17, 2, 165, 10, 1), -- Perugia intermedia
(16, 2, 3, 273, 0, 1), -- Roma arrivo
-- Linea Bologna-Venezia
(17, 8, 1, 0, 0, 1), -- Bologna partenza
(17, 4, 2, 154, 0, 1), -- Venezia arrivo
-- Linea Cagliari-Roma
(18, 11, 1, 0, 0, 1), -- Cagliari partenza
(18, 2, 2, 565, 0, 1), -- Roma arrivo
-- Linea Milano-Trieste
(19, 1, 1, 0, 0, 1), -- Milano partenza
(19, 4, 2, 280, 15, 1), -- Venezia intermedia
(19, 15, 3, 401, 0, 1), -- Trieste arrivo
-- Linea Palermo-Napoli
(20, 5, 1, 0, 0, 1), -- Palermo partenza
(20, 3, 2, 485, 0, 1), -- Napoli arrivo
-- Altre linee...
(21, 20, 1, 0, 0, 1), -- Aosta-Milano
(21, 1, 2, 184, 0, 1),
(22, 16, 1, 0, 0, 1), -- Trento-Bologna
(22, 8, 2, 174, 0, 1),
(23, 17, 1, 0, 0, 1), -- Perugia-Roma
(23, 2, 2, 165, 0, 1),
(24, 18, 1, 0, 0, 1), -- Potenza-Napoli
(24, 3, 2, 175, 0, 1);

-- Inserimento Tariffe
INSERT INTO tariffe (id_linea, id_stazione_partenza, id_stazione_arrivo, tipo_passeggero, prezzo_base, prezzo_weekend, prezzo_festivo, sconto_andata_ritorno, validita_giorni, data_inizio_validita) VALUES
-- Tariffe Milano-Roma
(1, 1, 2, 'adulto', 45.00, 55.00, 60.00, 15.00, 30, '2024-01-01'),
(1, 1, 2, 'bambino', 22.50, 27.50, 30.00, 15.00, 30, '2024-01-01'),
(1, 1, 2, 'anziano', 36.00, 44.00, 48.00, 15.00, 30, '2024-01-01'),
(1, 1, 2, 'studente', 31.50, 38.50, 42.00, 15.00, 30, '2024-01-01'),
-- Tariffe Roma-Napoli
(2, 2, 3, 'adulto', 18.00, 22.00, 25.00, 10.00, 15, '2024-01-01'),
(2, 2, 3, 'bambino', 9.00, 11.00, 12.50, 10.00, 15, '2024-01-01'),
(2, 2, 3, 'anziano', 14.40, 17.60, 20.00, 10.00, 15, '2024-01-01'),
(2, 2, 3, 'studente', 12.60, 15.40, 17.50, 10.00, 15, '2024-01-01'),
-- Tariffe Milano-Venezia
(3, 1, 4, 'adulto', 25.00, 30.00, 35.00, 12.00, 20, '2024-01-01'),
(3, 1, 4, 'bambino', 12.50, 15.00, 17.50, 12.00, 20, '2024-01-01'),
(3, 1, 4, 'anziano', 20.00, 24.00, 28.00, 12.00, 20, '2024-01-01'),
(3, 1, 4, 'studente', 17.50, 21.00, 24.50, 12.00, 20, '2024-01-01'),
-- Tariffe Napoli-Palermo
(4, 3, 5, 'adulto', 52.00, 62.00, 68.00, 18.00, 45, '2024-01-01'),
(4, 3, 5, 'bambino', 26.00, 31.00, 34.00, 18.00, 45, '2024-01-01'),
(4, 3, 5, 'anziano', 41.60, 49.60, 54.40, 18.00, 45, '2024-01-01'),
(4, 3, 5, 'studente', 36.40, 43.40, 47.60, 18.00, 45, '2024-01-01'),
-- Tariffe Torino-Milano
(5, 6, 1, 'adulto', 12.00, 15.00, 17.00, 8.00, 10, '2024-01-01'),
(5, 6, 1, 'bambino', 6.00, 7.50, 8.50, 8.00, 10, '2024-01-01'),
(5, 6, 1, 'anziano', 9.60, 12.00, 13.60, 8.00, 10, '2024-01-01'),
(5, 6, 1, 'studente', 8.40, 10.50, 11.90, 8.00, 10, '2024-01-01'),
-- Tariffe Bari-Roma
(6, 7, 2, 'adulto', 38.00, 45.00, 50.00, 15.00, 25, '2024-01-01'),
(6, 7, 2, 'bambino', 19.00, 22.50, 25.00, 15.00, 25, '2024-01-01'),
(6, 7, 2, 'anziano', 30.40, 36.00, 40.00, 15.00, 25, '2024-01-01'),
(6, 7, 2, 'studente', 26.60, 31.50, 35.00, 15.00, 25, '2024-01-01'),
-- Tariffe Bologna-Firenze
(7, 8, 9, 'adulto', 15.00, 18.00, 20.00, 8.00, 12, '2024-01-01'),
(7, 8, 9, 'bambino', 7.50, 9.00, 10.00, 8.00, 12, '2024-01-01'),
(7, 8, 9, 'anziano', 12.00, 14.40, 16.00, 8.00, 12, '2024-01-01'),
(7, 8, 9, 'studente', 10.50, 12.60, 14.00, 8.00, 12, '2024-01-01'),
-- Altre tariffe per completare 20+ record...
(8, 12, 1, 'adulto', 16.00, 19.00, 22.00, 8.00, 12, '2024-01-01'),
(9, 1, 21, 'adulto', 85.00, 105.00, 115.00, 25.00, 60, '2024-01-01'),
(10, 2, 24, 'adulto', 125.00, 155.00, 170.00, 35.00, 90, '2024-01-01'),
(11, 4, 23, 'adulto', 75.00, 90.00, 100.00, 22.00, 50, '2024-01-01'),
(12, 12, 22, 'adulto', 28.00, 35.00, 40.00, 12.00, 20, '2024-01-01'),
(13, 1, 9, 'adulto', 32.00, 38.00, 42.00, 14.00, 22, '2024-01-01'),
(14, 3, 7, 'adulto', 22.00, 26.00, 30.00, 10.00, 15, '2024-01-01'),
(15, 6, 12, 'adulto', 18.00, 22.00, 25.00, 9.00, 14, '2024-01-01'),
(16, 9, 2, 'adulto', 28.00, 33.00, 38.00, 12.00, 18, '2024-01-01'),
(17, 8, 4, 'adulto', 20.00, 24.00, 27.00, 10.00, 15, '2024-01-01'),
(18, 11, 2, 'adulto', 65.00, 78.00, 85.00, 20.00, 40, '2024-01-01'),
(19, 1, 15, 'adulto', 42.00, 50.00, 55.00, 16.00, 28, '2024-01-01'),
(20, 5, 3, 'adulto', 52.00, 62.00, 68.00, 18.00, 45, '2024-01-01'),
(21, 20, 1, 'adulto', 24.00, 28.00, 32.00, 11.00, 16, '2024-01-01'),
(22, 16, 8, 'adulto', 19.00, 23.00, 26.00, 9.00, 14, '2024-01-01'),
(23, 17, 2, 'adulto', 17.00, 20.00, 23.00, 8.00, 13, '2024-01-01'),
(24, 18, 3, 'adulto', 19.00, 23.00, 26.00, 9.00, 14, '2024-01-01');

-- ====================================================================
-- INSERIMENTO DATI CORSE E PROGRAMMAZIONE
-- ====================================================================

-- Inserimento Corse
INSERT INTO corse (id_linea, id_veicolo, id_autista_principale, id_autista_secondo, numero_corsa, data_partenza, ora_partenza_programmata, ora_arrivo_programmata, stato_corsa, posti_disponibili, posti_prenotati, posti_occupati, prezzo_medio, km_effettivi, incasso_totale) VALUES
('1', '1', '1', '2', 'EE2025010101', '2025-01-01', '08:00:00', '14:00:00', 'completata', 49, 45, 43, 45.00, 573, 1935.00),
('2', '3', '3', NULL, 'EE2025010102', '2025-01-01', '09:30:00', '12:00:00', 'completata', 23, 20, 19, 18.00, 225, 342.00),
('3', '2', '4', '5', 'EE2025010103', '2025-01-01', '10:15:00', '13:45:00', 'completata', 42, 38, 36, 25.00, 280, 900.00),
('4', '4', '6', '7', 'EE2025010104', '2025-01-01', '06:00:00', '13:00:00', 'completata', 78, 65, 62, 52.00, 485, 3224.00),
('5', '5', '8', NULL, 'EE2025010105', '2025-01-01', '07:30:00', '09:15:00', 'completata', 35, 32, 30, 12.00, 140, 360.00),
('1', '6', '9', '10', 'EE2025010201', '2025-01-02', '08:00:00', '14:00:00', 'completata', 32, 28, 26, 45.00, 573, 1170.00),
('2', '7', '11', NULL, 'EE2025010202', '2025-01-02', '09:30:00', '12:00:00', 'completata', 47, 42, 40, 18.00, 225, 720.00),
('6', '8', '12', '13', 'EE2025010203', '2025-01-02', '05:30:00', '10:30:00', 'completata', 31, 25, 23, 38.00, 445, 874.00),
('7', '9', '14', NULL, 'EE2025010204', '2025-01-02', '11:00:00', '12:30:00', 'completata', 41, 35, 33, 15.00, 105, 495.00),
('8', '10', '15', NULL, 'EE2025010205', '2025-01-02', '14:30:00', '16:30:00', 'completata', 19, 16, 15, 16.00, 142, 240.00),
('3', '11', '16', '17', 'EE2025010301', '2025-01-03', '10:15:00', '13:45:00', 'completata', 83, 70, 68, 25.00, 280, 1700.00),
('5', '12', '18', NULL, 'EE2025010302', '2025-01-03', '07:30:00', '09:15:00', 'completata', 53, 48, 45, 12.00, 140, 540.00),
('9', '13', '19', '20', 'EE2025010303', '2025-01-03', '06:00:00', '15:00:00', 'completata', 45, 35, 32, 85.00, 851, 2720.00),
('13', '14', '21', '22', 'EE2025010304', '2025-01-03', '09:00:00', '13:00:00', 'manutenzione', 59, 0, 0, 32.00, 0, 0.00),
('12', '15', '23', NULL, 'EE2025010305', '2025-01-03', '12:00:00', '14:30:00', 'completata', 37, 30, 28, 28.00, 195, 784.00),
('1', '16', '1', '24', 'EE2025010401', '2025-01-04', '08:00:00', '14:00:00', 'in_corso', 12, 10, 10, 45.00, 573, 450.00),
('14', '17', '2', NULL, 'EE2025010402', '2025-01-04', '13:00:00', '16:00:00', 'programmata', 44, 25, 0, 22.00, 255, 0.00),
('15', '18', '3', '4', 'EE2025010403', '2025-01-04', '15:30:00', '17:45:00', 'programmata', 26, 18, 0, 18.00, 170, 0.00),
('16', '19', '5', NULL, 'EE2025010404', '2025-01-04', '11:30:00', '15:00:00', 'programmata', 51, 32, 0, 28.00, 273, 0.00),
('17', '20', '6', NULL, 'EE2025010405', '2025-01-04', '16:00:00', '18:00:00', 'programmata', 15, 12, 0, 20.00, 154, 0.00),
('18', '21', '7', '8', 'EE2025010501', '2025-01-05', '05:00:00', '13:00:00', 'programmata', 24, 15, 0, 65.00, 565, 0.00),
('19', '22', '9', '10', 'EE2025010502', '2025-01-05', '07:00:00', '12:00:00', 'programmata', 62, 40, 0, 42.00, 401, 0.00),
('20', '23', '11', '12', 'EE2025010503', '2025-01-05', '06:30:00', '13:30:00', 'programmata', 49, 28, 0, 52.00, 485, 0.00),
('21', '24', '13', NULL, 'EE2025010504', '2025-01-05', '08:30:00', '11:00:00', 'programmata', 38, 22, 0, 24.00, 184, 0.00);


-- ====================================================================
-- INSERIMENTO ORARI FERMATE PER CORSA
-- ====================================================================

INSERT INTO orari_fermate_corsa (id_corsa, id_stazione, ordine_fermata, ora_arrivo_programmata, ora_partenza_programmata, ora_arrivo_effettiva, ora_partenza_effettiva, passeggeri_saliti, passeggeri_scesi) VALUES
-- Corsa EE2025010101 (Milano-Roma)
(1, 1, 1, NULL, '08:00:00', NULL, '08:00:00', 43, 0),
(1, 17, 2, '13:06:00', '13:21:00', '13:08:00', '13:23:00', 2, 5),
(1, 2, 3, '14:00:00', NULL, '14:02:00', NULL, 0, 40),
-- Corsa EE2025010102 (Roma-Napoli)
(2, 2, 1, NULL, '09:30:00', NULL, '09:30:00', 19, 0),
(2, 3, 2, '12:00:00', NULL, '11:58:00', NULL, 0, 19),
-- Corsa EE2025010103 (Milano-Venezia)
(3, 1, 1, NULL, '10:15:00', NULL, '10:15:00', 36, 0),
(3, 8, 2, '13:45:00', '13:55:00', '13:47:00', '13:57:00', 0, 8),
(3, 4, 3, '15:45:00', NULL, '15:48:00', NULL, 0, 28),
-- Corsa EE2025010104 (Napoli-Palermo)
(4, 3, 1, NULL, '06:00:00', NULL, '06:00:00', 62, 0),
(4, 5, 2, '13:00:00', NULL, '13:05:00', NULL, 0, 62),
-- Corsa EE2025010105 (Torino-Milano)
(5, 6, 1, NULL, '07:30:00', NULL, '07:30:00', 30, 0),
(5, 1, 2, '09:15:00', NULL, '09:12:00', NULL, 0, 30),
-- Corsa EE2025010201 (Milano-Roma)
(6, 1, 1, NULL, '08:00:00', NULL, '08:00:00', 26, 0),
(6, 17, 2, '13:06:00', '13:21:00', '13:10:00', '13:25:00', 0, 3),
(6, 2, 3, '14:00:00', NULL, '14:05:00', NULL, 0, 23),
-- Corsa EE2025010202 (Roma-Napoli)
(7, 2, 1, NULL, '09:30:00', NULL, '09:30:00', 40, 0),
(7, 3, 2, '12:00:00', NULL, '11:55:00', NULL, 0, 40),
-- Corsa EE2025010203 (Bari-Roma)
(8, 7, 1, NULL, '05:30:00', NULL, '05:30:00', 23, 0),
(8, 18, 2, '08:15:00', '08:25:00', '08:18:00', '08:28:00', 0, 2),
(8, 2, 3, '10:30:00', NULL, '10:35:00', NULL, 0, 21),
-- Corsa EE2025010204 (Bologna-Firenze)
(9, 8, 1, NULL, '11:00:00', NULL, '11:00:00', 33, 0),
(9, 9, 2, '12:30:00', NULL, '12:28:00', NULL, 0, 33),
-- Corsa EE2025010205 (Genova-Milano)
(10, 12, 1, NULL, '14:30:00', NULL, '14:30:00', 15, 0),
(10, 1, 2, '16:30:00', NULL, '16:32:00', NULL, 0, 15),
-- Corsa EE2025010301 (Milano-Venezia)
(11, 1, 1, NULL, '10:15:00', NULL, '10:15:00', 68, 0),
(11, 8, 2, '13:45:00', '13:55:00', '13:42:00', '13:52:00', 0, 12),
(11, 4, 3, '15:45:00', NULL, '15:40:00', NULL, 0, 56),
-- Corsa EE2025010302 (Torino-Milano)
(12, 6, 1, NULL, '07:30:00', NULL, '07:30:00', 45, 0),
(12, 1, 2, '09:15:00', NULL, '09:10:00', NULL, 0, 45),
-- Corsa EE2025010303 (Milano-Parigi)
(13, 1, 1, NULL, '06:00:00', NULL, '06:00:00', 32, 0),
(13, 6, 2, '07:45:00', '08:00:00', '07:48:00', '08:03:00', 0, 3),
(13, 21, 3, '15:00:00', NULL, '15:15:00', NULL, 0, 29),
-- Corsa EE2025010305 (Genova-Nizza)
(15, 12, 1, NULL, '12:00:00', NULL, '12:00:00', 28, 0),
(15, 22, 2, '14:30:00', NULL, '14:25:00', NULL, 0, 28);

-- ====================================================================
-- INSERIMENTO PRENOTAZIONI
-- ====================================================================

INSERT INTO prenotazioni (codice_prenotazione, id_cliente, data_prenotazione, canale_prenotazione, stato_prenotazione, numero_passeggeri, importo_totale, importo_pagato, metodo_pagamento, transazione_id, data_pagamento, email_cliente, telefono_cliente, sconto_applied) VALUES
('PR2025000001', 1, '2024-12-28 14:30:00', 'online', 'pagata', 2, 90.00, 90.00, 'carta_credito', 'TXN001234567', '2024-12-28 14:32:15', 'giovanni.martinelli@email.it', '+39 340 1234567', 0.00),
('PR2025000002', 2, '2024-12-29 09:15:00', 'online', 'pagata', 1, 18.00, 18.00, 'paypal', 'TXN001234568', '2024-12-29 09:17:22', 'maria.benedetti@email.it', '+39 335 9876543', 0.90),
('PR2025000003', 3, '2024-12-29 16:45:00', 'telefono', 'pagata', 4, 100.00, 100.00, 'bonifico', 'TXN001234569', '2024-12-30 10:15:00', 'info@techsolutions.it', '+39 02 12345678', 10.00),
('PR2025000004', 4, '2024-12-30 11:20:00', 'online', 'pagata', 2, 50.00, 50.00, 'carta_credito', 'TXN001234570', '2024-12-30 11:22:45', 'francesca.colombo@email.it', '+39 347 2468135', 0.00),
('PR2025000005', 5, '2024-12-30 18:30:00', 'agenzia', 'pagata', 2, 104.00, 104.00, 'carta_credito', 'TXN001234571', '2024-12-30 18:32:10', 'roberto.gentile@email.it', '+39 348 1357924', 2.60),
('PR2025000006', 6, '2024-12-31 08:45:00', 'online', 'pagata', 8, 416.00, 416.00, 'carta_credito', 'TXN001234572', '2024-12-31 08:47:30', 'booking@viaggibelli.it', '+39 091 8765432', 62.40),
('PR2025000007', 7, '2024-12-31 13:15:00', 'online', 'pagata', 2, 24.00, 24.00, 'carta_credito', 'TXN001234573', '2024-12-31 13:17:15', 'alessandro.fabbri@email.it', '+39 342 7410852', 0.00),
('PR2025000008', 8, '2025-01-01 07:20:00', 'sportello', 'pagata', 1, 45.00, 45.00, 'contanti', 'CASH001', '2025-01-01 07:20:00', 'elena.marchetti@email.it', '+39 339 9630741', 0.45),
('PR2025000009', 9, '2025-01-01 10:30:00', 'online', 'pagata', 2, 76.00, 76.00, 'carta_credito', 'TXN001234574', '2025-01-01 10:32:00', 'marco.pellegrino@email.it', '+39 333 1472583', 2.28),
('PR2025000010', 10, '2025-01-01 15:45:00', 'online', 'pagata', 1, 15.00, 15.00, 'paypal', 'TXN001234575', '2025-01-01 15:47:10', 'chiara.ferri@email.it', '+39 345 2583691', 0.00),
('PR2025000011', 11, '2025-01-02 09:00:00', 'telefono', 'pagata', 3, 135.00, 135.00, 'bonifico', 'TXN001234576', '2025-01-02 14:30:00', 'orders@importexportmed.it', '+39 010 5566778', 10.80),
('PR2025000012', 12, '2025-01-02 11:45:00', 'online', 'pagata', 1, 18.00, 18.00, 'carta_credito', 'TXN001234577', '2025-01-02 11:47:20', 'stefano.barbieri@email.it', '+39 351 8529630', 0.00),
('PR2025000013', 13, '2025-01-02 16:20:00', 'online', 'pagata', 1, 38.00, 38.00, 'carta_credito', 'TXN001234578', '2025-01-02 16:22:35', 'valentina.monti@email.it', '+39 340 3695147', 0.00),
('PR2025000014', 14, '2025-01-02 19:10:00', 'agenzia', 'pagata', 1, 15.00, 15.00, 'voucher', 'VOUCH001', '2025-01-02 19:10:00', 'andrea.gatti@email.it', '+39 348 1597534', 0.00),
('PR2025000015', 15, '2025-01-03 08:30:00', 'online', 'pagata', 1, 16.00, 16.00, 'carta_credito', 'TXN001234579', '2025-01-03 08:32:15', 'silvia.orlando@email.it', '+39 347 7534862', 0.00),
('PR2025000016', 16, '2025-01-03 12:15:00', 'online', 'pagata', 5, 250.00, 250.00, 'carta_credito', 'TXN001234580', '2025-01-03 12:17:40', 'matteo.sartori@email.it', '+39 342 4681357', 5.00),
('PR2025000017', 17, '2025-01-03 14:00:00', 'telefono', 'pagata', 1, 12.00, 12.00, 'contanti', 'CASH002', '2025-01-03 14:00:00', 'info@mondoviaggi.it', '+39 091 1122334', 0.00),
('PR2025000018', 18, '2025-01-03 17:30:00', 'online', 'pagata', 4, 340.00, 340.00, 'carta_credito', 'TXN001234581', '2025-01-03 17:32:25', 'giulia.ricci@email.it', '+39 349 2468024', 0.00),
('PR2025000019', 19, '2025-01-03 20:45:00', 'online', 'confermata', 1, 85.00, 0.00, 'carta_credito', NULL, NULL, 'davide.mariani@email.it', '+39 331 5792468', 1.28),
('PR2025000020', 20, '2025-01-04 07:15:00', 'online', 'pagata', 1, 28.00, 28.00, 'paypal', 'TXN001234582', '2025-01-04 07:17:30', 'federica.desantis@email.it', '+39 333 8024679', 0.00),
('PR2025000021', 21, '2025-01-04 10:30:00', 'agenzia', 'pagata', 1, 45.00, 45.00, 'carta_credito', 'TXN001234583', '2025-01-04 10:32:15', 'luca.conti@email.it', '+39 345 6802467', 1.58),
('PR2025000022', 22, '2025-01-04 13:45:00', 'online', 'confermata', 2, 880.00, 0.00, 'bonifico', NULL, NULL, 'contact@greenenergy.it', '+39 010 9988776', 176.00),
('PR2025000023', 23, '2025-01-04 16:20:00', 'online', 'pagata', 3, 66.00, 66.00, 'carta_credito', 'TXN001234584', '2025-01-04 16:22:45', 'simona.grassi@email.it', '+39 351 3579024', 0.00),
('PR2025000024', 24, '2025-01-04 18:00:00', 'telefono', 'pagata', 1, 36.00, 36.00, 'carta_credito', 'TXN001234585', '2025-01-04 18:02:20', 'emanuele.santoro@email.it', '+39 340 0246813', 0.00),
('PR2025000025', 1, '2025-01-05 09:30:00', 'online', 'confermata', 1, 20.00, 0.00, 'carta_credito', NULL, NULL, 'giovanni.martinelli@email.it', '+39 340 1234567', 0.00);

-- ====================================================================
-- INSERIMENTO BIGLIETTI
-- ====================================================================

INSERT INTO biglietti (id_prenotazione, id_corsa, id_passeggero, codice_biglietto, tipo_biglietto, numero_posto, id_stazione_partenza, id_stazione_arrivo, data_viaggio, ora_partenza, prezzo_biglietto, stato_biglietto, data_emissione, check_in) VALUES
(1, 1, 1, 'BIG2025000001', 'andata', 'A15', 1, 2, '2025-01-01', '08:00:00', 45.00, 'utilizzato', '2024-12-28 14:32:15', 1),
(1, 1, 2, 'BIG2025000002', 'andata', 'A16', 1, 2, '2025-01-01', '08:00:00', 45.00, 'utilizzato', '2024-12-28 14:32:15', 1),
(2, 2, 3, 'BIG2025000003', 'andata', 'B08', 2, 3, '2025-01-01', '09:30:00', 18.00, 'utilizzato', '2024-12-29 09:17:22', 1),
(3, 3, 4, 'BIG2025000004', 'andata', 'C12', 1, 4, '2025-01-01', '10:15:00', 25.00, 'utilizzato', '2024-12-29 16:45:00', 1),
(3, 3, 4, 'BIG2025000005', 'andata', 'C13', 1, 4, '2025-01-01', '10:15:00', 25.00, 'utilizzato', '2024-12-29 16:45:00', 1),
(3, 3, 4, 'BIG2025000006', 'andata', 'C14', 1, 4, '2025-01-01', '10:15:00', 25.00, 'utilizzato', '2024-12-29 16:45:00', 1),
(3, 3, 4, 'BIG2025000007', 'andata', 'C15', 1, 4, '2025-01-01', '10:15:00', 25.00, 'utilizzato', '2024-12-29 16:45:00', 1),
(4, 4, 5, 'BIG2025000008', 'andata', 'D20', 3, 5, '2025-01-01', '06:00:00', 52.00, 'utilizzato', '2024-12-30 11:22:45', 1),
(4, 4, 6, 'BIG2025000009', 'andata', 'D21', 3, 5, '2025-01-01', '06:00:00', 52.00, 'utilizzato', '2024-12-30 11:22:45', 1),
(5, 5, 7, 'BIG2025000010', 'andata', 'E05', 6, 1, '2025-01-01', '07:30:00', 12.00, 'utilizzato', '2024-12-30 18:32:10', 1),
(5, 5, 8, 'BIG2025000011', 'andata', 'E06', 6, 1, '2025-01-01', '07:30:00', 12.00, 'utilizzato', '2024-12-30 18:32:10', 1),
(6, 4, 9, 'BIG2025000012', 'andata', 'D22', 3, 5, '2025-01-01', '06:00:00', 52.00, 'utilizzato', '2024-12-31 08:47:30', 1),
(6, 4, 9, 'BIG2025000013', 'andata', 'D23', 3, 5, '2025-01-01', '06:00:00', 52.00, 'utilizzato', '2024-12-31 08:47:30', 1),
(6, 4, 9, 'BIG2025000014', 'andata', 'D24', 3, 5, '2025-01-01', '06:00:00', 52.00, 'utilizzato', '2024-12-31 08:47:30', 1),
(6, 4, 9, 'BIG2025000015', 'andata', 'D25', 3, 5, '2025-01-01', '06:00:00', 52.00, 'utilizzato', '2024-12-31 08:47:30', 1),
(6, 4, 9, 'BIG2025000016', 'andata', 'D26', 3, 5, '2025-01-01', '06:00:00', 52.00, 'utilizzato', '2024-12-31 08:47:30', 1),
(6, 4, 9, 'BIG2025000017', 'andata', 'D27', 3, 5, '2025-01-01', '06:00:00', 52.00, 'utilizzato', '2024-12-31 08:47:30', 1),
(6, 4, 9, 'BIG2025000018', 'andata', 'D28', 3, 5, '2025-01-01', '06:00:00', 52.00, 'utilizzato', '2024-12-31 08:47:30', 1),
(6, 4, 9, 'BIG2025000019', 'andata', 'D29', 3, 5, '2025-01-01', '06:00:00', 52.00, 'utilizzato', '2024-12-31 08:47:30', 1),
(7, 5, 10, 'BIG2025000020', 'andata', 'E07', 6, 1, '2025-01-01', '07:30:00', 12.00, 'utilizzato', '2024-12-31 13:17:15', 1),
(7, 5, 11, 'BIG2025000021', 'andata', 'E08', 6, 1, '2025-01-01', '07:30:00', 12.00, 'utilizzato', '2024-12-31 13:17:15', 1),
(8, 6, 12, 'BIG2025000022', 'andata', 'A17', 1, 2, '2025-01-02', '08:00:00', 45.00, 'utilizzato', '2025-01-01 07:20:00', 1),
(9, 7, 13, 'BIG2025000023', 'andata', 'B09', 2, 3, '2025-01-02', '09:30:00', 18.00, 'utilizzato', '2025-01-01 10:32:00', 1),
(9, 7, 14, 'BIG2025000024', 'andata', 'B10', 2, 3, '2025-01-02', '09:30:00', 18.00, 'utilizzato', '2025-01-01 10:32:00', 1),
(10, 9, 15, 'BIG2025000025', 'andata', 'F05', 8, 9, '2025-01-02', '11:00:00', 15.00, 'utilizzato', '2025-01-01 15:47:10', 1),
(11, 10, 16, 'BIG2025000026', 'andata', 'G03', 12, 1, '2025-01-02', '14:30:00', 16.00, 'utilizzato', '2025-01-02 14:30:00', 1),
(11, 10, 16, 'BIG2025000027', 'andata', 'G04', 12, 1, '2025-01-02', '14:30:00', 16.00, 'utilizzato', '2025-01-02 14:30:00', 1),
(11, 10, 16, 'BIG2025000028', 'andata', 'G05', 12, 1, '2025-01-02', '14:30:00', 16.00, 'utilizzato', '2025-01-02 14:30:00', 1),
(12, 12, 17, 'BIG2025000029', 'andata', 'E09', 6, 1, '2025-01-03', '07:30:00', 12.00, 'utilizzato', '2025-01-02 11:47:20', 1),
(13, 8, 18, 'BIG2025000030', 'andata', 'H08', 7, 2, '2025-01-02', '05:30:00', 38.00, 'utilizzato', '2025-01-02 16:22:35', 1);

-- ====================================================================
-- INSERIMENTO TRACKING VEICOLI
-- ====================================================================

INSERT INTO tracking_veicoli (id_veicolo, id_corsa, latitudine, longitudine, velocita_kmh, direzione_gradi, altitudine, timestamp_rilevazione) VALUES
(1, 1, 45.4642035, 9.1899820, 0, 0, 120, '2025-01-01 07:55:00'),
(1, 1, 45.4520123, 9.2100456, 85, 180, 115, '2025-01-01 08:15:00'),
(1, 1, 45.3850789, 9.3256789, 90, 185, 110, '2025-01-01 08:45:00'),
(1, 1, 44.8567234, 10.1234567, 88, 190, 200, '2025-01-01 10:30:00'),
(1, 1, 43.7695604, 11.2558136, 75, 170, 250, '2025-01-01 12:15:00'),
(1, 1, 43.1107168, 12.3908279, 0, 0, 493, '2025-01-01 13:08:00'),
(1, 1, 43.1050000, 12.3950000, 85, 160, 480, '2025-01-01 13:25:00'),
(1, 1, 42.5678901, 12.7890123, 92, 165, 300, '2025-01-01 14:00:00'),
(1, 1, 41.9027835, 12.4963655, 0, 0, 21, '2025-01-01 14:02:00'),
(3, 2, 41.9027835, 12.4963655, 0, 0, 21, '2025-01-01 09:25:00'),
(3, 2, 41.7856234, 12.8945678, 75, 150, 100, '2025-01-01 10:15:00'),
(3, 2, 41.3567890, 13.7890123, 82, 145, 150, '2025-01-01 11:00:00'),
(3, 2, 40.8517983, 14.2681244, 0, 0, 17, '2025-01-01 11:58:00'),
(2, 3, 45.4642035, 9.1899820, 0, 0, 120, '2025-01-01 10:10:00'),
(2, 3, 45.3456789, 9.5678901, 88, 90, 130, '2025-01-01 10:45:00'),
(2, 3, 45.1234567, 10.3456789, 85, 85, 180, '2025-01-01 11:30:00'),
(2, 3, 44.4949794, 11.3426327, 0, 0, 54, '2025-01-01 13:47:00'),
(2, 3, 44.5000000, 11.3500000, 90, 75, 60, '2025-01-01 13:58:00'),
(2, 3, 45.4408474, 12.3155151, 0, 0, 2, '2025-01-01 15:48:00'),
(4, 4, 40.8517983, 14.2681244, 0, 0, 17, '2025-01-01 05:55:00'),
(4, 4, 40.2345678, 15.1234567, 70, 200, 300, '2025-01-01 07:30:00'),
(4, 4, 39.1234567, 16.2345678, 75, 210, 450, '2025-01-01 09:45:00'),
(4, 4, 38.1156879, 13.3612671, 0, 0, 14, '2025-01-01 13:05:00'),
(5, 5, 45.0703393, 7.6869395, 0, 0, 239, '2025-01-01 07:25:00'),
(5, 5, 45.2345678, 8.1234567, 75, 45, 200, '2025-01-01 08:15:00'),
(5, 5, 45.4642035, 9.1899820, 0, 0, 120, '2025-01-01 09:12:00');

-- ====================================================================
-- INSERIMENTO MANUTENZIONI
-- ====================================================================

INSERT INTO manutenzioni (id_veicolo, tipo_manutenzione, descrizione, data_inizio, data_fine, km_veicolo, costo, fornitore, fattura_numero, prossima_manutenzione_km, prossima_manutenzione_data, stato_manutenzione) VALUES
(1, 'ordinaria', 'Tagliando periodico 6 mesi - cambio olio e filtri', '2024-11-15', '2024-11-15', 125000, 450.00, 'Officina Mercedes Roma', 'FAT2024001', 135000, '2025-05-15', 'completata'),
(2, 'ordinaria', 'Controllo freni e pneumatici', '2024-10-20', '2024-10-21', 180000, 320.00, 'Service Center Setra', 'FAT2024002', 190000, '2025-04-20', 'completata'),
(3, 'straordinaria', 'Sostituzione climatizzatore', '2024-12-01', '2024-12-03', 85000, 1200.00, 'Iveco Service', 'FAT2024003', 95000, '2025-06-01', 'completata'),
(4, 'riparazione', 'Riparazione trasmissione', '2024-09-15', '2024-09-18', 220000, 2500.00, 'Van Hool Specialist', 'FAT2024004', 230000, '2025-03-15', 'completata'),
(5, 'ordinaria', 'Tagliando ordinario', '2024-11-30', '2024-11-30', 45000, 380.00, 'MAN Service Center', 'FAT2024005', 55000, '2025-05-30', 'completata'),
(6, 'ordinaria', 'Cambio olio e controllo generale', '2024-10-10', '2024-10-10', 150000, 420.00, 'Scania Workshop', 'FAT2024006', 160000, '2025-04-10', 'completata'),
(7, 'straordinaria', 'Sostituzione pneumatici anteriori', '2024-11-05', '2024-11-06', 195000, 800.00, 'Pneumatici Express', 'FAT2024007', 205000, '2025-05-05', 'completata'),
(8, 'ordinaria', 'Tagliando 6 mesi', '2024-12-10', '2024-12-10', 95000, 465.00, 'Neoplan Service', 'FAT2024008', 105000, '2025-06-10', 'completata'),
(9, 'revisione', 'Controllo annuale veicolo elettrico', '2024-11-25', '2024-11-25', 25000, 280.00, 'BYD Electric Service', 'FAT2024009', 35000, '2025-05-25', 'completata'),
(10, 'ordinaria', 'Manutenzione ordinaria minibus', '2024-10-25', '2024-10-25', 65000, 350.00, 'Mercedes Sprinter Service', 'FAT2024010', 75000, '2025-04-25', 'completata'),
(11, 'straordinaria', 'Riparazione sistema idraulico portiere', '2024-09-30', '2024-10-02', 175000, 950.00, 'Setra Specialist', 'FAT2024011', 185000, '2025-03-30', 'completata'),
(12, 'ordinaria', 'Controllo sistema frenante', '2024-11-08', '2024-11-08', 210000, 390.00, 'Iveco Magelys Service', 'FAT2024012', 220000, '2025-05-08', 'completata'),
(13, 'riparazione', 'Sostituzione parabrezza', '2024-12-05', '2024-12-05', 110000, 650.00, 'Vetri Auto Specialist', 'FAT2024013', 120000, '2025-06-05', 'completata'),
(14, 'straordinaria', 'Revisione motore completa', '2024-10-15', '2024-10-20', 240000, 3500.00, 'MAN Engine Service', 'FAT2024014', 250000, '2025-04-15', 'completata'),
(15, 'ordinaria', 'Tagliando semestrale', '2024-11-20', '2024-11-20', 165000, 425.00, 'Scania Interlink Service', 'FAT2024015', 175000, '2025-05-20', 'completata'),
(16, 'riparazione', 'Riparazione sistema elettrico', '2024-10-30', '2024-10-31', 35000, 480.00, 'Volvo Service Center', 'FAT2024016', 45000, '2025-04-30', 'completata'),
(17, 'ordinaria', 'Manutenzione programmata', '2024-11-12', '2024-11-12', 185000, 410.00, 'Neoplan Workshop', 'FAT2024017', 195000, '2025-05-12', 'completata'),
(18, 'straordinaria', 'Sostituzione sedili passeggeri', '2024-12-08', '2024-12-10', 90000, 2800.00, 'Interior Bus Solutions', 'FAT2024018', 100000, '2025-06-08', 'completata'),
(19, 'ordinaria', 'Controllo generale veicolo', '2024-10-05', '2024-10-05', 155000, 395.00, 'Setra Service Point', 'FAT2024019', 165000, '2025-04-05', 'completata'),
(20, 'riparazione', 'Riparazione porta bagagliaio', '2024-11-28', '2024-11-29', 15000, 320.00, 'Iveco Daily Service', 'FAT2024020', 25000, '2025-05-28', 'completata'),
(21, 'straordinaria', 'Aggiornamento sistema GPS', '2024-09-20', '2024-09-21', 260000, 1500.00, 'Tech Solutions Bus', 'FAT2024021', 270000, '2025-03-20', 'completata'),
(22, 'ordinaria', 'Tagliando programmato', '2024-10-12', '2024-10-12', 230000, 445.00, 'MAN Service Network', 'FAT2024022', 240000, '2025-04-12', 'completata'),
(23, 'riparazione', 'Sostituzione ammortizzatori posteriori', '2024-11-18', '2024-11-19', 75000, 890.00, 'Scania Parts Center', 'FAT2024023', 85000, '2025-05-18', 'completata'),
(24, 'ordinaria', 'Controllo annuale', '2024-10-28', '2024-10-28', 145000, 385.00, 'Volvo Maintenance', 'FAT2024024', 155000, '2025-04-28', 'completata');

-- ====================================================================
-- INSERIMENTO INCIDENTI
-- ====================================================================

INSERT INTO incidenti (id_veicolo, id_corsa, id_autista, data_incidente, luogo_incidente, latitudine, longitudine, tipo_incidente, gravita, descrizione, feriti_numero, danni_stimati, compagnia_assicurazione, numero_sinistro, stato_pratica) VALUES
(7, NULL, 11, '2024-08-15 14:30:00', 'Autostrada A1, km 245', 43.7234567, 11.1234567, 'stradale', 'lieve', 'Tamponamento a bassa velocità in coda al casello', 0, 1200.00, 'Allianz Assicurazioni', 'SIN2024001', 'chiusa'),
(12, 8, 12, '2024-09-03 08:45:00', 'Via Appia, Roma', 41.8567890, 12.5123456, 'stradale', 'moderata', 'Scontro laterale con auto in manovra di parcheggio', 2, 3500.00, 'Generali Assicurazioni', 'SIN2024002', 'chiusa'),
(3, NULL, 3, '2024-07-22 16:20:00', 'Parcheggio Stazione Napoli', 40.8517983, 14.2681244, 'vandalismo', 'lieve', 'Graffi sulla carrozzeria laterale', 0, 800.00, 'UnipolSai', 'SIN2024003', 'chiusa'),
(15, NULL, 23, '2024-10-10 11:15:00', 'Via Genova, Torino', 45.0567890, 7.6234567, 'tecnico', 'moderata', 'Guasto sistema frenante, fermata di emergenza', 0, 2200.00, 'Allianz Assicurazioni', 'SIN2024004', 'in_corso'),
(20, NULL, 6, '2024-06-18 19:30:00', 'Area di servizio A4 Milano-Venezia', 45.5678901, 10.2345678, 'furto', 'grave', 'Furto di attrezzature dal bagagliaio', 0, 1500.00, 'AXA Assicurazioni', 'SIN2024005', 'chiusa'),
(9, NULL, 14, '2024-11-05 07:45:00', 'Deposito EuroExpress Milano', 45.4642035, 9.1899820, 'tecnico', 'lieve', 'Malfunzionamento sistema elettrico carica batterie', 0, 450.00, 'Zurich Assicurazioni', 'SIN2024006', 'chiusa'),
(18, NULL, 3, '2024-05-30 13:20:00', 'Autostrada A14, km 156', 43.1234567, 13.7890123, 'stradale', 'grave', 'Scoppio pneumatico e uscita di carreggiata', 5, 8500.00, 'Generali Assicurazioni', 'SIN2024007', 'aperta'),
(1, 1, 1, '2024-12-01 09:30:00', 'Tangenziale Milano', 45.4890123, 9.2123456, 'stradale', 'lieve', 'Piccolo tamponamento in rallentamento', 1, 900.00, 'Allianz Assicurazioni', 'SIN2024008', 'in_corso'),
(24, NULL, 13, '2024-04-12 15:45:00', 'Centro Storico Firenze', 43.7695604, 11.2558136, 'altro', 'lieve', 'Caduta ramo su parabrezza durante temporale', 0, 350.00, 'UnipolSai', 'SIN2024009', 'chiusa'),
(11, NULL, 16, '2024-08-28 20:10:00', 'Stazione Bari Centrale', 41.1171432, 16.8718715, 'vandalismo', 'moderata', 'Rottura finestrini laterali', 0, 1800.00, 'AXA Assicurazioni', 'SIN2024010', 'chiusa'),
(6, NULL, 9, '2024-03-15 12:00:00', 'Autostrada A7, Genova', 44.3567890, 8.8234567, 'tecnico', 'grave', 'Avaria motore con necessità di traino', 0, 4500.00, 'Zurich Assicurazioni', 'SIN2024011', 'chiusa'),
(22, NULL, 22, '2024-09-20 16:30:00', 'Via del Campo, Genova', 44.4056499, 8.9462754, 'stradale', 'moderata', 'Collisione con mezzo pesante in retromarcia', 3, 2800.00, 'Generali Assicurazioni', 'SIN2024012', 'in_corso'),
(14, NULL, 21, '2024-07-08 14:15:00', 'Area Servizio Chianti', 43.4567890, 11.3456789, 'tecnico', 'lieve', 'Perdita liquido di raffreddamento', 0, 680.00, 'Allianz Assicurazioni', 'SIN2024013', 'chiusa'),
(19, NULL, 5, '2024-11-22 08:20:00', 'Tangenziale Roma', 41.9234567, 12.5678901, 'stradale', 'moderata', 'Tamponamento multiplo in condizioni di pioggia', 4, 3200.00, 'UnipolSai', 'SIN2024014', 'aperta'),
(8, NULL, 12, '2024-06-03 17:40:00', 'Parcheggio Centro Commerciale', 44.4567890, 11.3890123, 'vandalismo', 'lieve', 'Graffiti sulla fiancata del veicolo', 0, 500.00, 'AXA Assicurazioni', 'SIN2024015', 'chiusa'),
(13, NULL, 19, '2024-10-18 11:50:00', 'Autostrada A22, Brennero', 46.1234567, 11.2345678, 'tecnico', 'moderata', 'Surriscaldamento motore in salita', 0, 1900.00, 'Zurich Assicurazioni', 'SIN2024016', 'in_corso'),
(17, NULL, 17, '2024-05-14 19:25:00', 'Centro Storico Palermo', 38.1156879, 13.3612671, 'altro', 'lieve', 'Danni da grandine eccezionale', 0, 750.00, 'Generali Assicurazioni', 'SIN2024017', 'chiusa'),
(21, NULL, 7, '2024-08-07 13:35:00', 'Stazione Venezia Mestre', 45.4408474, 12.3155151, 'furto', 'moderata', 'Tentativo di furto con danni alla serratura', 0, 450.00, 'Allianz Assicurazioni', 'SIN2024018', 'chiusa'),
(10, NULL, 15, '2024-12-12 09:10:00', 'Via Tornabuoni, Firenze', 43.7695604, 11.2558136, 'stradale', 'lieve', 'Urto contro colonna durante manovra', 0, 320.00, 'UnipolSai', 'SIN2024019', 'aperta'),
(16, NULL, 24, '2024-04-25 15:55:00', 'Autostrada A26, Voltri', 44.4234567, 8.7567890, 'tecnico', 'grave', 'Rottura sistema sterzo, fermata immediata', 0, 5200.00, 'AXA Assicurazioni', 'SIN2024020', 'in_corso'),
(23, NULL, 18, '2024-11-08 12:25:00', 'Circonvallazione Bologna', 44.4949794, 11.3426327, 'stradale', 'moderata', 'Scontro frontale con auto contromano', 6, 4800.00, 'Zurich Assicurazioni', 'SIN2024021', 'aperta'),
(5, NULL, 8, '2024-07-30 16:45:00', 'Via Po, Torino', 45.0703393, 7.6869395, 'vandalismo', 'lieve', 'Rottura specchietto retrovisore', 0, 180.00, 'Generali Assicurazioni', 'SIN2024022', 'chiusa'),
(4, NULL, 6, '2024-09-12 10:30:00', 'Porto di Napoli', 40.8395833, 14.2525000, 'altro', 'moderata', 'Danni da salsedine e vento forte', 0, 1200.00, 'Allianz Assicurazioni', 'SIN2024023', 'chiusa'),
(2, NULL, 4, '2024-06-28 18:15:00', 'Autostrada A4, Brescia', 45.5391667, 10.2169444, 'tecnico', 'lieve', 'Foratura pneumatico posteriore', 0, 250.00, 'UnipolSai', 'SIN2024024', 'chiusa');

-- ====================================================================
-- INSERIMENTO RECENSIONI
-- ====================================================================

INSERT INTO recensioni (id_cliente, id_corsa, id_biglietto, id_autista, valutazione_generale, valutazione_puntualita, valutazione_pulizia, valutazione_comfort, valutazione_autista, titolo_recensione, testo_recensione, data_recensione, anonima, verificata, pubblicata) VALUES
(1, 1, 1, 1, 5, 5, 4, 5, 5, 'Viaggio eccellente Milano-Roma', 'Autista molto professionale e cortese. Il pullman era pulito e confortevole. Siamo arrivati in perfetto orario. Servizio eccellente!', '2025-01-01 18:30:00', 0, 1, 1),
(2, 2, 3, 3, 4, 4, 4, 4, 4, 'Buon viaggio Roma-Napoli', 'Viaggio nel complesso soddisfacente. Unico neo: un leggero ritardo alla partenza, ma recuperato durante il tragitto.', '2025-01-01 15:45:00', 0, 1, 1),
(4, 3, 4, 4, 5, 5, 5, 5, 5, 'Perfetto Milano-Venezia', 'Tutto perfetto! Il veicolo era modernissimo, l autista gentilissimo e il viaggio molto comodo. Consiglio vivamente!', '2025-01-01 20:15:00', 0, 1, 1),
(5, 4, 8, 6, 4, 3, 4, 4, 4, 'Viaggio lungo ma confortevole', 'Il traghetto ha causato qualche ritardo ma il servizio a bordo era buono. I sedili comodi per un viaggio così lungo.', '2025-01-01 22:00:00', 0, 1, 1),
(7, 5, 20, 8, 5, 5, 5, 4, 5, 'Tratta breve ma efficiente', 'Perfetto per tratte brevi. Autista puntuale e professionale. Pullman pulito e in ottime condizioni.', '2025-01-01 12:30:00', 0, 1, 1),
(9, 7, 23, 11, 4, 5, 3, 4, 4, 'Buon servizio, migliorabile pulizia', 'Autista molto bravo e puntuale. Il pullman però non era perfettamente pulito, soprattutto i sedili.', '2025-01-02 16:20:00', 0, 1, 1),
(11, 8, 26, 12, 3, 2, 4, 3, 4, 'Troppi ritardi', 'Il servizio è buono ma i ritardi sono inaccettabili. Siamo partiti con 35 minuti di ritardo senza spiegazioni valide.', '2025-01-02 14:45:00', 0, 1, 1),
(10, 9, 25, 14, 5, 5, 5, 5, 5, 'Esperienza fantastica', 'Non potevo chiedere di meglio! Tutto perfetto dal check-in all arrivo. autista era cordiale e disponibile.', '2025-01-02 17:30:00', 0, 1, 1),
(13, 8, 30, 12, 4, 4, 4, 4, 5, 'Viaggio confortevole', 'Buon viaggio nel complesso. L autista è stato molto professionale e ci ha fatto sentire sicuri durante tutto il tragitto.', '2025-01-02 19:15:00', 0, 1, 1),
(15, 10, 26, 15, 3, 4, 2, 3, 3, 'Pullman da rinnovare', 'Il veicolo sembrava un po  datato e la pulizia lasciava a desiderare. Il servizio è comunque accettabile.', '2025-01-02 20:00:00', 0, 1, 1),
(16, 11, 16, 16, 5, 4, 5, 5, 5, 'Doppio piano fantastico!', 'Prima volta su un pullman a doppio piano, esperienza incredibile! Vista panoramica e molto spazio. Autista eccellente.', '2025-01-03 19:45:00', 0, 1, 1),
(17, 12, 29, 18, 4, 5, 4, 4, 4, 'Puntuale e affidabile', 'Viaggio breve ma gestito molto bene. Partenza e arrivo in perfetto orario. Autista cortese e professionale.', '2025-01-03 11:30:00', 0, 1, 1),
(18, 13, 18, 19, 5, 5, 5, 5, 5, 'Viaggio internazionale superb', 'Milano-Parigi gestito in modo impeccabile. Comfort elevato, fermate programmate perfette, autisti preparatissimi.', '2025-01-03 23:45:00', 0, 1, 1),
(20, 15, 30, 23, 2, 3, 2, 2, 2, 'Deludente esperienza', 'Pullman vecchio, sedili scomodi, aria condizionata non funzionante. Per il prezzo pagato mi aspettavo molto di più.', '2025-01-03 17:00:00', 0, 1, 1),
(1, 6, 22, 9, 4, 4, 4, 4, 5, 'Secondo viaggio positivo', 'Confermo la qualità del servizio. L autista Marco è sempre molto professionale e cortese.', '2025-01-02 18:15:00', 0, 1, 1),
(22, NULL, NULL, NULL, 5, 5, 5, 5, 5, 'Servizio aziendale eccellente', 'Utilizziamo EuroExpress per i nostri dipendenti. Servizio sempre puntuale e professionale. Consigliamo a tutte le aziende.', '2025-01-04 10:30:00', 0, 0, 1),
(6, 4, 12, 6, 4, 3, 5, 4, 4, 'Agenzia soddisfatta', 'Come agenzia viaggi, siamo soddisfatti della partnership con EuroExpress. Clienti sempre contenti del servizio.', '2025-01-01 16:30:00', 0, 1, 1),
(14, 9, 25, 14, 5, 5, 4, 5, 5, 'Viaggio di lavoro perfetto', 'Uso spesso EuroExpress per lavoro. Sempre puntuali, pullman confortevoli e autisti preparati.', '2025-01-02 21:00:00', 0, 1, 1),
(21, NULL, NULL, NULL, 3, 3, 3, 3, 3, 'Nella media', 'Servizio accettabile ma non eccezionale. Prezzi nella norma per quello che offre.', '2025-01-04 14:20:00', 1, 0, 1),
(23, NULL, NULL, NULL, 4, 4, 4, 4, 4, 'Buona alternativa', 'Preferisco il pullman al treno per certi tragitti. EuroExpress offre un buon rapporto qualità-prezzo.', '2025-01-04 20:15:00', 0, 0, 1),
(24, NULL, NULL, NULL, 5, 5, 5, 5, 5, 'Miglior compagnia di pullman', 'Viaggi sempre con EuroExpress quando possibile. Non ho mai avuto problemi e il servizio è sempre stato eccellente.', '2025-01-04 22:30:00', 0, 0, 1),
(12, 12, 29, 18, 3, 4, 3, 3, 4, 'Servizio base', 'Va bene per viaggi occasionali. Niente di eccezionale ma fa il suo dovere.', '2025-01-03 13:45:00', 1, 1, 1),
(19, NULL, NULL, NULL, 2, 2, 3, 2, 3, 'Non all altezza', 'Diversi disagi durante il viaggio. Clima non funzionante e sedili scomodi. Devo ripensare alla scelta.', '2025-01-05 08:00:00', 0, 0, 1),
(8, NULL, NULL, NULL, 4, 4, 4, 4, 4, 'Generalmente soddisfatta', 'Nel complesso un buon servizio. Qualche piccolo problema occasionale ma niente di grave.', '2025-01-05 11:30:00', 0, 0, 1);

-- ====================================================================
-- INSERIMENTO PROMOZIONI
-- ====================================================================

INSERT INTO promozioni (codice_promozione, nome_promozione, descrizione, tipo_sconto, valore_sconto, sconto_massimo, utilizzi_massimi, utilizzi_per_cliente, importo_minimo, data_inizio, data_fine, attiva, utilizzi_totali, fatturato_generato) VALUES
('WINTER2025', 'Promozione Inverno 2025', 'Sconto 15% su tutti i viaggi durante i mesi invernali', 'percentuale', 15.00, 50.00, 1000, 3, 20.00, '2024-12-01', '2025-02-28', 1, 156, 15680.00),
('STUDENT50', 'Sconto Studenti', 'Sconto fisso 5€ per studenti universitari', 'fisso', 5.00, 5.00, 2000, 5, 15.00, '2024-09-01', '2025-07-31', 1, 342, 8550.00),
('FAMILY20', 'Sconto Famiglia', 'Sconto 20% per gruppi familiari di 4+ persone', 'percentuale', 20.00, 100.00, 500, 2, 80.00, '2024-06-01', '2025-12-31', 1, 89, 8900.00),
('EARLY2025', 'Prenotazione Anticipata', 'Sconto 10% per prenotazioni oltre 30 giorni', 'percentuale', 10.00, 30.00, 800, 2, 25.00, '2024-01-01', '2025-12-31', 1, 234, 11700.00),
('SENIOR65', 'Sconto Over 65', 'Sconto fisso 8€ per passeggeri over 65', 'fisso', 8.00, 8.00, 1500, 4, 20.00, '2024-01-01', '2025-12-31', 1, 445, 8900.00),
('BUSINESS10', 'Sconto Aziendale', 'Sconto 10% per clienti business', 'percentuale', 10.00, 200.00, 300, 10, 100.00, '2024-01-01', '2025-12-31', 1, 67, 13400.00),
('WEEKEND25', 'Weekend Speciale', 'Sconto 25% per viaggi weekend', 'percentuale', 25.00, 75.00, 600, 2, 30.00, '2024-11-01', '2025-03-31', 1, 178, 13350.00),
('RETURN15', 'Andata e Ritorno', 'Sconto 15% aggiuntivo su biglietti A/R', 'percentuale', 15.00, 40.00, 1200, 3, 40.00, '2024-01-01', '2025-12-31', 1, 298, 11920.00),
('NEWCUST30', 'Benvenuto Nuovo Cliente', 'Sconto fisso 10€ per nuovi clienti', 'fisso', 10.00, 10.00, 2000, 1, 25.00, '2024-01-01', '2025-12-31', 1, 567, 5670.00),
('LOYALTY25', 'Fedeltà Premium', 'Sconto 25% per clienti con 10+ viaggi', 'percentuale', 25.00, 100.00, 200, 1, 50.00, '2024-01-01', '2025-12-31', 1, 45, 4500.00),
('SUMMER2024', 'Estate 2024', 'Sconto 20% per viaggi estivi', 'percentuale', 20.00, 60.00, 1500, 3, 30.00, '2024-06-01', '2024-08-31', 0, 892, 26760.00),
('FLASH48H', 'Flash 48 ore', 'Sconto 30% per prenotazioni last minute', 'percentuale', 30.00, 50.00, 100, 1, 20.00, '2024-12-15', '2024-12-17', 0, 98, 2940.00),
('XMAS2024', 'Natale 2024', 'Sconto fisso 15€ per viaggi natalizi', 'fisso', 15.00, 15.00, 800, 2, 40.00, '2024-12-20', '2025-01-07', 0, 234, 3510.00),
('GROUP50', 'Gruppo 5+', 'Sconto 15% per gruppi di 5+ persone', 'percentuale', 15.00, 150.00, 400, 1, 125.00, '2024-01-01', '2025-12-31', 1, 78, 11700.00),
('VALENTINE', 'San Valentino', 'Seconda corsa gratis per coppie', 'seconda_corsa_gratis', 100.00, 100.00, 200, 1, 50.00, '2025-02-10', '2025-02-16', 1, 23, 1150.00),
('EASTER25', 'Pasqua 2025', 'Sconto 18% per viaggi pasquali', 'percentuale', 18.00, 45.00, 600, 2, 35.00, '2025-03-20', '2025-04-10', 1, 0, 0.00),
('STUDENT25', 'Back to School', 'Sconto 25% per studenti a settembre', 'percentuale', 25.00, 35.00, 1000, 2, 20.00, '2025-09-01', '2025-09-30', 1, 0, 0.00),
('AUTUMN24', 'Autunno 2024', 'Sconto 12% per viaggi autunnali', 'percentuale', 12.00, 40.00, 800, 3, 25.00, '2024-09-01', '2024-11-30', 0, 456, 13680.00),
('MOBILE20', 'App Mobile', 'Sconto 20% per prenotazioni da app', 'percentuale', 20.00, 30.00, 1500, 4, 15.00, '2024-01-01', '2025-12-31', 1, 789, 15780.00),
('REFER25', 'Porta un Amico', 'Sconto 25% per cliente che porta nuovo cliente', 'percentuale', 25.00, 50.00, 500, 5, 30.00, '2024-01-01', '2025-12-31', 1, 123, 6150.00),
('VIP50', 'Cliente VIP', 'Sconto fisso 20€ per clienti VIP', 'fisso', 20.00, 20.00, 100, 6, 100.00, '2024-01-01', '2025-12-31', 1, 34, 680.00),
('BLACKFRI', 'Black Friday 2024', 'Sconto 40% per Black Friday', 'percentuale', 40.00, 80.00, 300, 2, 30.00, '2024-11-29', '2024-12-02', 0, 287, 11480.00),
('CYBER2024', 'Cyber Monday', 'Sconto fisso 12€ per Cyber Monday', 'fisso', 12.00, 12.00, 500, 1, 25.00, '2024-12-02', '2024-12-02', 0, 456, 5472.00),
('SPRING25', 'Primavera 2025', 'Sconto 16% per viaggi primaverili', 'percentuale', 16.00, 42.00, 700, 2, 28.00, '2025-03-01', '2025-05-31', 1, 0, 0.00),
('MIDNIGHT', 'Viaggi Notturni', 'Sconto 20% per partenze dopo le 22:00', 'percentuale', 20.00, 35.00, 400, 3, 25.00, '2024-01-01', '2025-12-31', 1, 156, 5460.00);

-- ====================================================================
-- INSERIMENTO UTILIZZI PROMOZIONI
-- ====================================================================

INSERT INTO utilizzi_promozioni (id_promozione, id_cliente, id_prenotazione, data_utilizzo, sconto_applicato, importo_originale, importo_finale) VALUES
(2, 2, 2, '2024-12-29 09:17:22', 0.90, 18.90, 18.00),
(1, 3, 3, '2024-12-29 16:45:00', 10.00, 110.00, 100.00),
(5, 5, 5, '2024-12-30 18:32:10', 2.60, 106.60, 104.00),
(6, 6, 6, '2024-12-31 08:47:30', 62.40, 478.40, 416.00),
(4, 8, 8, '2025-01-01 07:20:00', 0.45, 45.45, 45.00),
(9, 9, 9, '2025-01-01 10:32:00', 2.28, 78.28, 76.00),
(6, 11, 11, '2025-01-02 14:30:00', 10.80, 145.80, 135.00),
(1, 16, 16, '2025-01-03 12:17:40', 5.00, 255.00, 250.00),
(19, 19, 19, '2025-01-03 20:45:00', 1.28, 86.28, 85.00),
(6, 21, 21, '2025-01-04 10:32:15', 1.58, 46.58, 45.00),
(6, 22, 22, '2025-01-04 13:45:00', 176.00, 1056.00, 880.00),
(4, 1, 1, '2024-12-28 14:32:15', 4.50, 94.50, 90.00),
(8, 14, 14, '2025-01-02 19:10:00', 1.50, 16.50, 15.00),
(7, 18, 18, '2025-01-03 17:32:25', 34.00, 374.00, 340.00),
(1, 20, 20, '2025-01-04 07:17:30', 2.80, 30.80, 28.00),
(2, 24, 24, '2025-01-04 18:02:20', 3.60, 39.60, 36.00),
(18, 13, 13, '2025-01-02 16:22:35', 3.80, 41.80, 38.00),
(18, 15, 15, '2025-01-03 08:32:15', 1.60, 17.60, 16.00),
(10, 7, 7, '2024-12-31 13:17:15', 2.40, 26.40, 24.00),
(18, 12, 12, '2025-01-02 11:47:20', 1.80, 19.80, 18.00),
(5, 23, 23, '2025-01-04 16:22:45', 6.60, 72.60, 66.00),
(4, 4, 4, '2024-12-30 11:22:45', 5.00, 55.00, 50.00),
(1, 10, 10, '2025-01-01 15:47:10', 1.50, 16.50, 15.00),
(9, 17, 17, '2025-01-03 14:00:00', 1.20, 13.20, 12.00);

-- ====================================================================
-- INSERIMENTO PAGAMENTI
-- ====================================================================

INSERT INTO pagamenti (id_prenotazione, codice_transazione, metodo_pagamento, provider_pagamento, importo, commissioni, data_pagamento, stato_pagamento, codice_autorizzazione, ip_cliente, user_agent) VALUES
(1, 'TXN001234567', 'carta_credito', 'Stripe', 90.00, 2.70, '2024-12-28 14:32:15', 'completed', 'AUTH789123', '192.168.1.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'),
(2, 'TXN001234568', 'paypal', 'PayPal', 18.00, 0.54, '2024-12-29 09:17:22', 'completed', 'PP456789', '10.0.0.25', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X)'),
(3, 'TXN001234569', 'bonifico', 'Banca Intesa', 100.00, 0.00, '2024-12-30 10:15:00', 'completed', 'WIRE123456', '172.16.0.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)'),
(4, 'TXN001234570', 'carta_credito', 'Nexi', 50.00, 1.50, '2024-12-30 11:22:45', 'completed', 'NEXI789012', '192.168.1.200', 'Mozilla/5.0 (Android 11; Mobile; rv:68.0)'),
(5, 'TXN001234571', 'carta_credito', 'Stripe', 104.00, 3.12, '2024-12-30 18:32:10', 'completed', 'AUTH345678', '10.0.0.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'),
(6, 'TXN001234572', 'carta_credito', 'Stripe', 416.00, 12.48, '2024-12-31 08:47:30', 'completed', 'AUTH901234', '192.168.1.150', 'Mozilla/5.0 (iPad; CPU OS 14_7_1 like Mac OS X)'),
(7, 'TXN001234573', 'carta_credito', 'Nexi', 24.00, 0.72, '2024-12-31 13:17:15', 'completed', 'NEXI567890', '172.16.0.100', 'Mozilla/5.0 (X11; Linux x86_64)'),
(8, 'CASH001', 'contanti', 'Cassa', 45.00, 0.00, '2025-01-01 07:20:00', 'completed', 'CASH001', '192.168.1.1', 'N/A'),
(9, 'TXN001234574', 'carta_credito', 'Stripe', 76.00, 2.28, '2025-01-01 10:32:00', 'completed', 'AUTH123789', '10.0.0.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'),
(10, 'TXN001234575', 'paypal', 'PayPal', 15.00, 0.45, '2025-01-01 15:47:10', 'completed', 'PP789123', '192.168.1.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X)'),
(11, 'TXN001234576', 'bonifico', 'UniCredit', 135.00, 0.00, '2025-01-02 14:30:00', 'completed', 'WIRE789012', '172.16.0.200', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)'),
(12, 'TXN001234577', 'carta_credito', 'Nexi', 18.00, 0.54, '2025-01-02 11:47:20', 'completed', 'NEXI234567', '192.168.1.225', 'Mozilla/5.0 (Android 12; Mobile; rv:68.0)'),
(13, 'TXN001234578', 'carta_credito', 'Stripe', 38.00, 1.14, '2025-01-02 16:22:35', 'completed', 'AUTH456012', '10.0.0.250', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'),
(14, 'VOUCH001', 'voucher', 'EuroExpress', 15.00, 0.00, '2025-01-02 19:10:00', 'completed', 'VOUCH001', '192.168.1.50', 'Mozilla/5.0 (iPad; CPU OS 14_7_1 like Mac OS X)'),
(15, 'TXN001234579', 'carta_credito', 'Nexi', 16.00, 0.48, '2025-01-03 08:32:15', 'completed', 'NEXI678901', '172.16.0.75', 'Mozilla/5.0 (X11; Linux x86_64)'),
(16, 'TXN001234580', 'carta_credito', 'Stripe', 250.00, 7.50, '2025-01-03 12:17:40', 'completed', 'AUTH789345', '192.168.1.300', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'),
(17, 'CASH002', 'contanti', 'Cassa', 12.00, 0.00, '2025-01-03 14:00:00', 'completed', 'CASH002', '192.168.1.1', 'N/A'),
(18, 'TXN001234581', 'carta_credito', 'Stripe', 340.00, 10.20, '2025-01-03 17:32:25', 'completed', 'AUTH012678', '10.0.0.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X)'),
(20, 'TXN001234582', 'paypal', 'PayPal', 28.00, 0.84, '2025-01-04 07:17:30', 'completed', 'PP345901', '192.168.1.125', 'Mozilla/5.0 (Android 11; Mobile; rv:68.0)'),
(21, 'TXN001234583', 'carta_credito', 'Nexi', 45.00, 1.35, '2025-01-04 10:32:15', 'completed', 'NEXI345012', '172.16.0.125', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)'),
(23, 'TXN001234584', 'carta_credito', 'Stripe', 66.00, 1.98, '2025-01-04 16:22:45', 'completed', 'AUTH678234', '10.0.0.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'),
(24, 'TXN001234585', 'carta_credito', 'Nexi', 36.00, 1.08, '2025-01-04 18:02:20', 'completed', 'NEXI901567', '192.168.1.175', 'Mozilla/5.0 (iPad; CPU OS 14_7_1 like Mac OS X)'),
(19, 'TXN001234586', 'carta_credito', 'Stripe', 85.00, 2.55, '2025-01-05 09:15:00', 'pending', NULL, '172.16.0.150', 'Mozilla/5.0 (X11; Linux x86_64)'),
(22, 'TXN001234587', 'bonifico', 'Banco BPM', 880.00, 0.00, '2025-01-05 15:30:00', 'pending', NULL, '10.0.0.220', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)');

-- ====================================================================
-- INSERIMENTO FATTURE
-- ====================================================================

INSERT INTO fatture (numero_fattura, id_cliente, id_prenotazione, tipo_fattura, data_emissione, importo_netto, importo_iva, importo_totale, aliquota_iva, codice_fiscale_cliente, partita_iva_cliente, ragione_sociale_cliente, stato_fattura) VALUES
('2025/000001', 1, 1, 'ricevuta', '2024-12-28', 73.77, 16.23, 90.00, 22.00, 'MRTGNN85M15F205A', NULL, NULL, 'emessa'),
('2025/000002', 2, 2, 'ricevuta', '2024-12-29', 14.75, 3.25, 18.00, 22.00, 'BNDMRA82F22H501B', NULL, NULL, 'emessa'),
('2025/000003', 3, 3, 'fattura_elettronica', '2024-12-29', 81.97, 18.03, 100.00, 22.00, NULL, '12345678901', 'Tech Solutions S.r.l.', 'inviata'),
('2025/000004', 4, 4, 'ricevuta', '2024-12-30', 40.98, 9.02, 50.00, 22.00, 'CLMFNC90A12F839C', NULL, NULL, 'emessa'),
('2025/000005', 5, 5, 'ricevuta', '2024-12-30', 85.25, 18.75, 104.00, 22.00, 'GNTRBT78D30L736D', NULL, NULL, 'emessa'),
('2025/000006', 6, 6, 'fattura_elettronica', '2024-12-31', 340.98, 75.02, 416.00, 22.00, NULL, '98765432109', 'Viaggi Belli Travel Agency', 'inviata'),
('2025/000007', 7, 7, 'ricevuta', '2024-12-31', 19.67, 4.33, 24.00, 22.00, 'FBBLSN87H08L219E', NULL, NULL, 'emessa'),
('2025/000008', 8, 8, 'ricevuta', '2025-01-01', 36.89, 8.11, 45.00, 22.00, 'MRCHLN91L19A662F', NULL, NULL, 'emessa'),
('2025/000009', 9, 9, 'ricevuta', '2025-01-01', 62.30, 13.70, 76.00, 22.00, 'PLLMRC83C25A944G', NULL, NULL, 'emessa'),
('2025/000010', 10, 10, 'ricevuta', '2025-01-01', 12.30, 2.70, 15.00, 22.00, 'FRRCHI89S15D612H', NULL, NULL, 'emessa'),
('2025/000011', 11, 11, 'fattura_elettronica', '2025-01-02', 110.66, 24.34, 135.00, 22.00, NULL, '55566677788', 'Import Export Mediterranean', 'inviata'),
('2025/000012', 12, 12, 'ricevuta', '2025-01-02', 14.75, 3.25, 18.00, 22.00, 'BRBSFN86T12C351I', NULL, NULL, 'emessa'),
('2025/000013', 13, 13, 'ricevuta', '2025-01-02', 31.15, 6.85, 38.00, 22.00, 'MNTVNT92B28F205J', NULL, NULL, 'emessa'),
('2025/000014', 14, 14, 'ricevuta', '2025-01-02', 12.30, 2.70, 15.00, 22.00, 'GTTNDR84E18H501K', NULL, NULL, 'emessa'),
('2025/000015', 15, 15, 'ricevuta', '2025-01-03', 13.11, 2.89, 16.00, 22.00, 'RLNSLV88A08F839L', NULL, NULL, 'emessa'),
('2025/000016', 16, 16, 'ricevuta', '2025-01-03', 204.92, 45.08, 250.00, 22.00, 'SRTMTT80L25L736M', NULL, NULL, 'emessa'),
('2025/000017', 17, 17, 'fattura_elettronica', '2025-01-03', 9.84, 2.16, 12.00, 22.00, NULL, '11122233344', 'Mondo Viaggi Tour Operator', 'inviata'),
('2025/000018', 18, 18, 'ricevuta', '2025-01-03', 278.69, 61.31, 340.00, 22.00, 'RCCGLI93D15L219N', NULL, NULL, 'emessa'),
('2025/000019', 19, 19, 'ricevuta', '2025-01-03', 69.67, 15.33, 85.00, 22.00, 'MRNDVD85P03A662O', NULL, NULL, 'bozza'),
('2025/000020', 20, 20, 'ricevuta', '2025-01-04', 22.95, 5.05, 28.00, 22.00, 'DSNTDR87S25A944P', NULL, NULL, 'emessa'),
('2025/000021', 21, 21, 'ricevuta', '2025-01-04', 36.89, 8.11, 45.00, 22.00, 'CNTLCU81A12D612Q', NULL, NULL, 'emessa'),
('2025/000022', 22, 22, 'fattura_elettronica', '2025-01-04', 721.31, 158.69, 880.00, 22.00, NULL, '99988877766', 'Green Energy Solutions S.p.A.', 'bozza'),
('2025/000023', 23, 23, 'ricevuta', '2025-01-04', 54.10, 11.90, 66.00, 22.00, 'GRSSMN90F18C351R', NULL, NULL, 'emessa'),
('2025/000024', 24, 24, 'ricevuta', '2025-01-04', 29.51, 6.49, 36.00, 22.00, 'SNTML79C22F205S', NULL, NULL, 'emessa');

-- INSERIMENTO DATI AGGIUNTIVI PER COSTI OPERATIVI
INSERT INTO costi_operativi (id_corsa, id_veicolo, id_linea, tipo_costo, descrizione, importo, data_costo, fornitore, categoria_contabile) VALUES
(1, 1, 1, 'carburante', 'Rifornimento Diesel per corsa MIL-ROM-001', 180.50, '2025-01-01', 'TotalEnergies', 'Carburante'),
(2, 3, 2, 'pedaggio', 'Pedaggio autostradale A1 per corsa ROM-NAP-002', 25.80, '2025-01-01', 'Autostrade per l''Italia', 'Pedaggi'),
(3, 2, 3, 'manutenzione', 'Controllo pressione pneumatici corsa MIL-VEN-003', 15.00, '2025-01-01', 'Officina Mobile', 'Manutenzione Minore'),
(4, 4, 4, 'personale', 'Indennità autista per corsa Napoli-Palermo', 50.00, '2025-01-01', 'EuroExpress HR', 'Stipendi'),
(5, 5, 5, 'altro', 'Pulizia interna veicolo EE005 post-corsa', 40.00, '2025-01-01', 'Servizi Pulizie Spa', 'Pulizia'),
(6, 6, 1, 'carburante', 'Rifornimento Diesel per corsa MIL-ROM-001 (02/01)', 175.20, '2025-01-02', 'Eni', 'Carburante'),
(7, 7, 2, 'pedaggio', 'Pedaggio autostradale A1 per corsa ROM-NAP-002 (02/01)', 25.80, '2025-01-02', 'Autostrade per l''Italia', 'Pedaggi'),
(8, 8, 6, 'assicurazione', 'Quota giornaliera assicurazione veicolo EE008', 12.50, '2025-01-02', 'Generali Assicurazioni', 'Assicurazioni'),
(9, 9, 7, 'manutenzione', 'Rabbocco liquidi per veicolo EE009', 10.00, '2025-01-02', 'Officina interna', 'Manutenzione Minore'),
(10, 10, 8, 'carburante', 'Rifornimento per corsa Genova-Milano', 35.00, '2025-01-02', 'Q8', 'Carburante'),
(11, 11, 3, 'personale', 'Indennità autista secondo per corsa MIL-VEN-003 (03/01)', 45.00, '2025-01-03', 'EuroExpress HR', 'Stipendi'),
(12, 12, 5, 'carburante', 'Rifornimento Diesel per corsa Torino-Milano (03/01)', 55.00, '2025-01-03', 'Esso', 'Carburante'),
(13, 13, 9, 'pedaggio', 'Pedaggio tunnel Monte Bianco per corsa MIL-PAR-009', 60.00, '2025-01-03', 'Tunnel MB', 'Pedaggi'),
(15, 15, 12, 'altro', 'Costo parcheggio stazione Nizza', 18.00, '2025-01-03', 'Parcheggi Nizza', 'Parcheggio'),
(16, 16, 1, 'manutenzione', 'Sostituzione lampadina faro veicolo EE016', 22.00, '2025-01-04', 'Officina Esterna', 'Manutenzione Minore'),
(17, 17, 14, 'carburante', 'Rifornimento Diesel per corsa NAP-BAR-014', 90.00, '2025-01-04', 'IP', 'Carburante'),
(18, 18, 15, 'pedaggio', 'Pedaggio autostradale A7 per corsa TOR-GEN-015', 10.50, '2025-01-04', 'Autostrade per l''Italia', 'Pedaggi'),
(19, 19, 16, 'personale', 'Indennità autista per corsa FIR-ROM-016', 30.00, '2025-01-04', 'EuroExpress HR', 'Stipendi'),
(20, 20, 17, 'altro', 'Costo lavaggio veicolo EE020', 30.00, '2025-01-04', 'Autolavaggio', 'Pulizia'),
(21, 21, 18, 'carburante', 'Rifornimento Diesel per corsa CAG-ROM-018', 150.00, '2025-01-05', 'Shell', 'Carburante'),
(22, 22, 19, 'pedaggio', 'Pedaggio autostradale A4 per corsa MIL-TRI-019', 40.00, '2025-01-05', 'Autostrade per l''Italia', 'Pedaggi'),
(23, 23, 20, 'personale', 'Indennità autista per corsa PAL-NAP-020', 50.00, '2025-01-05', 'EuroExpress HR', 'Stipendi'),
(24, 24, 21, 'manutenzione', 'Controllo livelli veicolo EE024', 15.00, '2025-01-05', 'Officina interna', 'Manutenzione Minore');




-- INSERIMENTO DATI AGGIUNTIVI PER COMUNICAZIONI 
INSERT INTO comunicazioni (tipo_comunicazione, destinatario, mittente, oggetto, corpo_messaggio, id_cliente, id_prenotazione, id_corsa, data_invio, data_consegna, stato_invio) VALUES
('email', 'giovanni.martinelli@email.it', 'info@euroexpress.it', 'Conferma Prenotazione PR2025000001', 'La tua prenotazione per la corsa EE2025010101 è confermata.', 1, 1, 1, '2024-12-28 14:32:30', '2024-12-28 14:33:05', 'delivered'),
('sms', '+393359876543', 'EuroExpress', 'Biglietto Corsa EE2025010102', 'Il tuo biglietto per la corsa EE2025010102 è pronto. Codice: BIG2025000003', 2, 2, 2, '2024-12-29 09:18:00', '2024-12-29 09:18:15', 'delivered'),
('email', 'info@techsolutions.it', 'info@euroexpress.it', 'Riepilogo Prenotazione PR2025000003', 'Gentile Tech Solutions, ecco il riepilogo della vostra prenotazione.', 3, 3, 3, '2024-12-29 16:45:30', '2024-12-29 16:46:00', 'delivered'),
('push', 'CLI004_device', 'EuroExpress App', 'La tua corsa EE2025010104 è in partenza!', 'Ricorda di essere in stazione 30 minuti prima. Buon viaggio!', 4, 4, 4, '2024-12-31 05:30:00', '2024-12-31 05:30:10', 'delivered'),
('email', 'roberto.gentile@email.it', 'info@euroexpress.it', 'Dettagli Biglietto PR2025000005', 'I dettagli del tuo biglietto per la corsa EE2025010105 sono allegati.', 5, 5, 5, '2024-12-30 18:33:00', '2024-12-30 18:33:45', 'delivered'),
('sms', '+393427410852', 'EuroExpress', 'Ritardo Corsa EE2025010201', 'La corsa EE2025010201 (Milano-Roma) ha un ritardo stimato di 15 minuti. Ci scusiamo per il disagio.', 7, 7, 6, '2025-01-02 07:45:00', '2025-01-02 07:45:10', 'delivered'),
('email', 'elena.marchetti@email.it', 'info@euroexpress.it', 'Promozione Esclusiva per te!', 'Approfitta del nostro sconto fedeltà sul prossimo viaggio!', 8, NULL, NULL, '2025-01-03 10:00:00', '2025-01-03 10:01:00', 'delivered'),
('email', 'marco.pellegrino@email.it', 'info@euroexpress.it', 'Conferma Pagamento PR2025000009', 'Il tuo pagamento per la prenotazione PR2025000009 è stato ricevuto.', 9, 9, 7, '2025-01-01 10:32:30', '2025-01-01 10:33:10', 'delivered'),
('sms', '+393452583691', 'EuroExpress', 'Promemoria Partenza Corsa EE2025010204', 'La tua corsa EE2025010204 da Bologna a Firenze parte tra 1 ora.', 10, 10, 9, '2025-01-02 09:55:00', '2025-01-02 09:55:05', 'delivered'),
('email', 'orders@importexportmed.it', 'info@euroexpress.it', 'Fattura PR2025000011', 'La fattura per la prenotazione PR2025000011 è disponibile nel tuo account.', 11, 11, NULL, '2025-01-02 15:00:00', '2025-01-02 15:00:40', 'delivered'),
('email', 'stefano.barbieri@email.it', 'info@euroexpress.it', 'Aggiornamento Corsa EE2025010302', 'La tua corsa EE2025010302 è stata riprogrammata. Controlla i dettagli.', 12, 12, 12, '2025-01-03 07:00:00', '2025-01-03 07:01:00', 'delivered'),
('sms', '+393403695147', 'EuroExpress', 'Corsa EE2025010303 Cancellata', 'Siamo spiacenti, la corsa EE2025010303 è stata cancellata. Contattaci per rimborso.', 13, 13, 13, '2025-01-03 05:45:00', '2025-01-03 05:45:10', 'delivered'),
('email', 'andrea.gatti@email.it', 'info@euroexpress.it', 'Feedback sul tuo viaggio', 'Aiutaci a migliorare il servizio lasciando una recensione sul tuo ultimo viaggio.', 14, 14, NULL, '2025-01-03 20:00:00', '2025-01-03 20:01:00', 'delivered'),
('email', 'silvia.orlando@email.it', 'info@euroexpress.it', 'Offerta Speciale per te!', 'Non perdere il 10% di sconto sui prossimi viaggi!', 15, NULL, NULL, '2025-01-04 09:00:00', '2025-01-04 09:01:00', 'delivered'),
('sms', '+393424681357', 'EuroExpress', 'Corsa EE2025010401 in corso', 'La tua corsa EE2025010401 è partita in orario. Segui il tracking sull''app.', 16, 16, 16, '2025-01-04 08:00:00', '2025-01-04 08:00:15', 'delivered'),
('email', 'info@mondoviaggi.it', 'info@euroexpress.it', 'Nuove tariffe disponibili', 'Le nuove tariffe per la stagione estiva sono ora online.', 17, NULL, NULL, '2025-01-05 10:00:00', '2025-01-05 10:01:00', 'delivered'),
('email', 'giulia.ricci@email.it', 'info@euroexpress.it', 'La tua recensione è stata pubblicata!', 'Grazie per il tuo feedback sulla corsa EE2025010303.', 18, 18, 13, '2025-01-04 18:00:00', '2025-01-04 18:00:45', 'delivered'),
('sms', '+393315792468', 'EuroExpress', 'Promemoria Pagamento PR2025000019', 'Ricorda di completare il pagamento della tua prenotazione PR2025000019.', 19, 19, NULL, '2025-01-04 09:00:00', '2025-01-04 09:00:10', 'delivered'),
('email', 'federica.desantis@email.it', 'info@euroexpress.it', 'Offerta Last Minute!', 'Sconti imperdibili sui viaggi della prossima settimana.', 20, NULL, NULL, '2025-01-05 12:00:00', '2025-01-05 12:01:00', 'delivered'),
('email', 'luca.conti@email.it', 'info@euroexpress.it', 'Notifica di Check-in Aperto', 'Il check-in per la tua corsa è ora aperto. Effettualo online per risparmiare tempo.', 21, 21, 21, '2025-01-05 07:00:00', '2025-01-05 07:00:30', 'delivered'),
('email', 'contact@greenenergy.it', 'info@euroexpress.it', 'Report Mensile Servizi Business', 'Il report dettagliato dei servizi di trasporto per Gennaio è disponibile.', 22, NULL, NULL, '2025-02-01 09:00:00', '2025-02-01 09:01:00', 'delivered'),
('sms', '+393513579024', 'EuroExpress', 'Benvenuto in EuroExpress!', 'Grazie per esserti registrato. Usa il codice BENVENUTO10 per il tuo primo sconto!', 23, NULL, NULL, '2025-01-04 16:25:00', '2025-01-04 16:25:05', 'delivered'),
('email', 'emanuele.santoro@email.it', 'info@euroexpress.it', 'Sondaggio di Soddisfazione', 'Aiutaci a migliorare il servizio compilando il nostro sondaggio.', 24, NULL, NULL, '2025-01-05 14:00:00', '2025-01-05 14:01:00', 'delivered'),
('email', 'giovanni.martinelli@email.it', 'info@euroexpress.it', 'Promemoria Corsa PR2025000025', 'La tua corsa del 05/01 è in programma. Non dimenticare il biglietto!', 1, 25, NULL, '2025-01-04 09:30:00', '2025-01-04 09:30:30', 'delivered');


-- INSERIMENTO DATI AGGIUNTIVI PER LOG ATTIVITA 
INSERT INTO log_attivita (tabella_interessata, id_record, operazione, utente_sistema, ip_address, valori_nuovi, timestamp_operazione) VALUES
('clienti', 1, 'UPDATE', 'admin', '192.168.1.10', '{"sconto_fedeltà": 0.05}', '2025-01-05 09:00:00'),
('prenotazioni', 25, 'INSERT', 'web_user', '88.12.34.56', '{"codice_prenotazione": "PR2025000025", "id_cliente": 1}', '2025-01-05 09:30:00'),
('corse', 16, 'UPDATE', 'system_cron', '10.0.0.1', '{"stato_corsa": "in_corso", "ora_partenza_effettiva": "08:00:00"}', '2025-01-04 08:00:00'),
('biglietti', 1, 'UPDATE', 'system_checkin', '172.16.0.5', '{"check_in": 1, "data_utilizzo": "2025-01-01 07:50:00"}', '2025-01-01 07:50:00'),
('autisti', 14, 'UPDATE', 'admin', '192.168.1.10', '{"stato_autista": "attivo"}', '2025-01-03 10:00:00'),
('stazioni', 1, 'UPDATE', 'admin', '192.168.1.10', '{"servizi_disponibili": "{\"wifi\": 1, \"deposito_bagagli\": 1}"}', '2025-01-05 10:15:00'),
('manutenzioni', 14, 'UPDATE', 'officina_manager', '10.0.0.15', '{"stato_manutenzione": "completata", "data_fine": "2024-10-20"}', '2024-10-20 17:00:00'),
('pagamenti', 19, 'UPDATE', 'system_payment', '10.0.0.2', '{"stato_pagamento": "completed", "data_pagamento": "2025-01-05 09:15:00"}', '2025-01-05 09:15:00'),
('fatture', 19, 'UPDATE', 'contabile', '192.168.1.20', '{"stato_fattura": "emessa"}', '2025-01-05 11:00:00'),
('promozioni', 16, 'UPDATE', 'marketing_manager', '192.168.1.30', '{"attiva": 1}', '2025-03-01 08:00:00'),
('veicoli', 14, 'UPDATE', 'officina_manager', '10.0.0.15', '{"stato_veicolo": "attivo"}', '2024-10-20 17:00:00'),
('clienti', 2, 'SELECT', 'web_user', '88.12.34.57', NULL, '2025-01-05 09:45:00'),
('prenotazioni', 1, 'SELECT', 'admin', '192.168.1.10', NULL, '2025-01-05 09:50:00'),
('corse', 1, 'SELECT', 'operatore_monitoraggio', '10.0.0.100', NULL, '2025-01-01 08:30:00'),
('biglietti', 2, 'SELECT', 'admin', '192.168.1.10', NULL, '2025-01-05 10:00:00'),
('autisti', 1, 'SELECT', 'hr_manager', '192.168.1.15', NULL, '2025-01-05 10:30:00'),
('linee', 1, 'SELECT', 'web_user', '88.12.34.58', NULL, '2025-01-05 10:40:00'),
('tariffe', 1, 'SELECT', 'marketing_manager', '192.168.1.30', NULL, '2025-01-05 10:50:00'),
('utilizzi_promozioni', 1, 'SELECT', 'contabile', '192.168.1.20', NULL, '2025-01-05 11:10:00'),
('tracking_veicoli', 1, 'INSERT', 'system_gps', '10.0.0.3', '{"latitudine": 45.464, "longitudine": 9.190}', '2025-01-01 07:55:00'),
('costi_operativi', 1, 'INSERT', 'contabile', '192.168.1.20', '{"importo": 180.50}', '2025-01-01 09:00:00'),
('comunicazioni', 1, 'INSERT', 'system_notification', '10.0.0.4', '{"destinatario": "giovanni.martinelli@email.it"}', '2024-12-28 14:32:30'),
('configurazioni_sistema', 1, 'INSERT', 'admin', '192.168.1.10', '{"valore_configurazione": "22.00"}', '2025-01-05 12:00:00'),
('log_attivita', 20, 'INSERT', 'system_cron', '10.0.0.1', '{"tabella_interessata": "tracking_veicoli"}', '2025-01-01 07:55:00');



-- INSERIMENTO DATI AGGIUNTIVI PER CONFIGURAZIONI DI SISTEMA 
INSERT INTO configurazioni_sistema (chiave_configurazione, valore_configurazione, tipo_valore, descrizione, categoria, modificabile, valore_default) VALUES
('default_vat_rate', '22.00', 'decimal', 'Aliquota IVA predefinita per i servizi', 'Fiscale', 1, '22.00'),
('max_bookings_per_client', '10', 'integer', 'Numero massimo di prenotazioni attive per cliente privato', 'Prenotazioni', 1, '10'),
('email_notification_threshold_minutes', '60', 'integer', 'Soglia in minuti per l''invio di notifiche via email prima della partenza', 'Notifiche', 1, '60'),
('loyalty_points_per_euro', '1.5', 'decimal', 'Punti fedeltà guadagnati per ogni euro speso', 'Fedeltà', 1, '1.0'),
('min_passengers_for_group_discount', '4', 'integer', 'Numero minimo di passeggeri per applicare lo sconto gruppo', 'Promozioni', 1, '4'),
('api_key_weather_service', 'YOUR_WEATHER_API_KEY', 'string', 'Chiave API per il servizio meteo esterno', 'Integrazioni', 1, NULL),
('payment_gateway_timeout_seconds', '30', 'integer', 'Timeout per le transazioni del gateway di pagamento', 'Pagamenti', 1, '30'),
('default_currency', 'EUR', 'string', 'Valuta predefinita del sistema', 'General', 0, 'EUR'),
('admin_email_for_alerts', 'admin@euroexpress.it', 'string', 'Indirizzo email per le notifiche di sistema critiche', 'Notifiche', 1, NULL),
('max_luggage_weight_kg', '25.0', 'decimal', 'Peso massimo consentito per i bagagli standard (kg)', 'Operativo', 1, '25.0'),
('cancellation_fee_percentage', '10.0', 'decimal', 'Percentuale di penale per cancellazioni tardive', 'Prenotazioni', 1, '10.0'),
('driver_rest_hours_min', '11', 'integer', 'Ore minime di riposo giornaliero per gli autisti', 'Operativo', 1, '11'),
('enable_sms_notifications', '1', 'boolean', 'Abilita/Disabilita le notifiche SMS', 'Notifiche', 1, '1'),
('default_review_rating', '5', 'integer', 'Valutazione predefinita per le recensioni (se non specificata)', 'Feedback', 1, '5'),
('maintenance_alert_km_threshold', '10000', 'integer', 'Soglia chilometrica per avvisi di manutenzione imminente', 'Manutenzione', 1, '10000'),
('booking_hold_time_minutes', '30', 'integer', 'Tempo in minuti per cui una prenotazione non pagata rimane in stato "confermata"', 'Prenotazioni', 1, '30'),
('auto_archive_logs_days', '365', 'integer', 'Numero di giorni dopo i quali i log attività vengono archiviati automaticamente', 'Sistema', 1, '365'),
('website_url', 'https://www.euroexpress.it', 'string', 'URL principale del sito web EuroExpress', 'General', 0, 'https://www.euroexpress.it'),
('support_phone_number', '+390612345678', 'string', 'Numero di telefono del supporto clienti', 'Contatti', 1, NULL),
('max_promo_uses_per_code', '1000', 'integer', 'Numero massimo di utilizzi totali per codice promozione', 'Promozioni', 1, '1000'),
('min_age_child_ticket', '2', 'integer', 'Età minima per biglietto bambino', 'Tariffe', 1, '2'),
('max_age_child_ticket', '12', 'integer', 'Età massima per biglietto bambino', 'Tariffe', 1, '12'),
('min_age_senior_discount', '65', 'integer', 'Età minima per sconto anziani', 'Tariffe', 1, '65'),
('enable_qr_code_checkin', '1', 'boolean', 'Abilita/Disabilita il check-in tramite QR code', 'Operativo', 1, '1');


--RIABILITO VINCOLI

EXEC sp_MSforeachtable 'ALTER TABLE ? CHECK CONSTRAINT ALL';
GO

