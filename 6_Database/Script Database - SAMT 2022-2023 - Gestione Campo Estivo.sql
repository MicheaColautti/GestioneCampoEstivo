
DROP DATABASE IF EXISTS GestioneCampoEstivo;
CREATE DATABASE GestioneCampoEstivo;
USE GestioneCampoEstivo;


/****************PERSON****************/
DROP TABLE IF EXISTS person;
CREATE TABLE person(
    id INT(20) AUTO_INCREMENT NOT NULL,
    name VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    address VARCHAR(40) NOT NULL,
    CAP VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL,
    type ENUM('guest', 'volunteer', 'admin','reference') NOT NULL,
    born_date DATE NOT NULL,
    PRIMARY KEY(id)
    
);

       
/****************GUEST_INFO****************/
DROP TABLE IF EXISTS guestInfo;
CREATE TABLE guestInfo(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idGuest INT(20) NOT NULL,
    marital_state VARCHAR(20) NOT NULL,
    weight INT(11) NOT NULL,
    height INT(11) NOT NULL,
    form_placeAndDate VARCHAR(20) NOT NULL,
    signature VARCHAR(20) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (idGuest) REFERENCES person(id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);


/****************REFERENCE****************/
DROP TABLE IF EXISTS referencePerson;
CREATE TABLE referencePerson(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idGuest INT(20) NOT NULL,
    idReference INT(20) NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY (idGuest) REFERENCES person(id),
    FOREIGN KEY (idReference) REFERENCES person(id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);


/****************LIVING_SITU****************/
DROP TABLE IF EXISTS livingSituation;
CREATE TABLE livingSituation(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idGuest INT(20) NOT NULL,

    livingState ENUM('da solo', 'con il coniuge', 'in istituto', 'con i parenti') NOT NULL,
    instituteNumber INT(20),

    PRIMARY KEY(id),
    FOREIGN KEY (idGuest) REFERENCES person(id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);

/****************HEALT_IN****************/
DROP TABLE IF EXISTS healtIns;
CREATE TABLE healtIns(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idGuest INT(20) NOT NULL,

    name VARCHAR(20) NOT NULL,
    number VARCHAR(20) NOT NULL,
    picture VARCHAR(20) NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY (idGuest) REFERENCES person(id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);


/****************LAST_RECOVER****************/
DROP TABLE IF EXISTS lastRecover;
CREATE TABLE lastRecover(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idGuest INT(20) NOT NULL,
    date DATE,
    reason VARCHAR(20),
    hospital VARCHAR(25),
    PRIMARY KEY(id),
    FOREIGN KEY (idGuest) REFERENCES person(id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);


/****************MOVEMENT***************/
DROP TABLE IF EXISTS movement;
CREATE TABLE movement(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idGuest INT(20) NOT NULL,    
    
    status_and_transport ENUM('Indipendente', 'Semidipendente', 'Dipendente') NOT NULL,
    aux_equipment VARCHAR(20),
    arm_sx ENUM('buona', 'ridotta', 'nessun movimento') NOT NULL,
    arm_dx ENUM('buona', 'ridotta', 'nessun movimento') NOT NULL,
    leg_sx ENUM('buona', 'ridotta', 'nessun movimento') NOT NULL,
    leg_dx ENUM('buona', 'ridotta', 'nessun movimento') NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY (idGuest) REFERENCES person(id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);


/****************ALIMENTATION****************/
DROP TABLE IF EXISTS alimentation;
CREATE TABLE alimentation(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idGuest INT(20) NOT NULL,

    eating_ability ENUM('da solo', 'con aiuto', 'imboccare') NOT NULL,
    drinking_ability ENUM('da solo', 'con aiuto', 'imboccare') NOT NULL,
    dentures ENUM('nessuna', 'sopra', 'sotto','entrambe') NOT NULL,
    thickener ENUM('si', 'no') NOT NULL,
    diet VARCHAR(20),
    unadviced_food VARCHAR(20),
    allergies VARCHAR(20),
    alchool VARCHAR(20),

    PRIMARY KEY(id),
    FOREIGN KEY (idGuest) REFERENCES person(id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);



/****************GUEST_HYG****************/
DROP TABLE IF EXISTS guestHyg;
CREATE TABLE guestHyg(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idGuest INT(20) NOT NULL,

    washing_ab ENUM('da solo', 'con aiuto', 'dipendente') NOT NULL,
    dressing_ab ENUM('da solo', 'con aiuto', 'dipendente') NOT NULL,
    toilet_ab ENUM('da solo', 'con aiuto', 'dipendente') NOT NULL,
    urine_cont ENUM('Continente', 'Incontinente') NOT NULL,
    feces_cont ENUM('Continente', 'Incontinente') NOT NULL,
    catheter ENUM('si', 'no') NOT NULL,
    last_change_date DATE,
    CV VARCHAR(20),
    costipation ENUM('si', 'no') NOT NULL,
    manual_feces_ext ENUM('si', 'no') NOT NULL,
    decupitus ENUM('si', 'no') NOT NULL,
    where_decupitus VARCHAR(20),
    prev_and_cure VARCHAR(20),

    PRIMARY KEY(id),
    FOREIGN KEY (idGuest) REFERENCES person(id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);

/***************COMUNICATION****************/
DROP TABLE IF EXISTS comunication;
CREATE TABLE comunication(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idGuest INT(20) NOT NULL,
    
    seeing ENUM('normale', 'parziale', 'assente') NOT NULL,
    hearing ENUM('normale', 'parziale', 'assente') NOT NULL,
    hearing_device ENUM('si', 'no') NOT NULL,
    glasses ENUM('si', 'no') NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY (idGuest) REFERENCES person(id) 
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);
/***************SLEEP****************/
DROP TABLE IF EXISTS sleep;
CREATE TABLE sleep(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idGuest INT(20) NOT NULL,
    
    sleep ENUM('normale', 'parziale', 'assente') NOT NULL,
    difficulty_getting_asleep ENUM('si', 'no') NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY (idGuest) REFERENCES person(id)
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);


/***************PSY_STATE****************/
DROP TABLE IF EXISTS psySate;
CREATE TABLE psySate(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idGuest INT(20) NOT NULL,
    
    orientation ENUM('Buono', 'Alterato', 'Molto alterato') NOT NULL,
    memoria ENUM('Buono', 'Alterato', 'Molto alterato') NOT NULL,
    agitation_state ENUM('si', 'no') NOT NULL,
    depressed ENUM('si', 'no') NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY (idGuest) REFERENCES person(id) 
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);



    /**************************************************************/
    /**************************VOLUNTEER***************************/
    /**************************************************************/

 /***************AUTOCERTIFICATE****************/ 
DROP TABLE IF EXISTS autocertificate;
CREATE TABLE autocertificate(
    id INT(20) AUTO_INCREMENT NOT NULL,
    idVolunteer INT(20) NOT NULL,
    /*
    * Datas like name, lastname, and person of reference are stored in table person/reference. 
    * Link is done via foreign Key
    */
    mother_phone VARCHAR(20) NOT NULL,
    father_phone VARCHAR(20) NOT NULL,
    legal_tutor VARCHAR(20) NOT NULL,
    mestrual_sindrome ENUM('si', 'no') NOT NULL,
    diabetes ENUM('si', 'no') NOT NULL,
    migrain  ENUM('si', 'no') NOT NULL,
    epileps  ENUM('si', 'no') NOT NULL,
    what_pills  VARCHAR(20),
    what_blood_pres_problems  VARCHAR(20),
    what_allergies  VARCHAR(20),
    what_breathing_problems  VARCHAR(20),
    what_cardiac_problems  VARCHAR(20),
    what_coagulation_problems  VARCHAR(20),
    what_joints_problems  VARCHAR(20),
    what_psyco_problems  VARCHAR(20),
    other_problems  VARCHAR(20),
    doctor VARCHAR(20) NOT NULL,
    doctor_phone VARCHAR(20) NOT NULL,
    form_placeAndDate VARCHAR(20) NOT NULL,
    signature VARCHAR(20) NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY (idVolunteer) REFERENCES person(id) 
    
);

/**************************CAMP***************************/
DROP TABLE IF EXISTS camp;
CREATE TABLE camp(
    id INT(20) AUTO_INCREMENT NOT NULL,

    title INT(20) NOT NULL,
    infos TEXT,
    edition TEXT,
    phtos_library TEXT,
    staff_instructions TEXT,
    news TEXT,
    PRIMARY KEY(id)
);

/**************************CHANGE***************************/
DROP TABLE IF EXISTS edit;
CREATE TABLE edit(
    id INT(20) AUTO_INCREMENT NOT NULL,

    last_mod DATE NOT NULL,
    idAdmin INT(11) NOT NULL,
    idCamp INT(11) NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY (idAdmin) REFERENCES person(id),
    FOREIGN KEY (idCamp) REFERENCES camp(id)
);
