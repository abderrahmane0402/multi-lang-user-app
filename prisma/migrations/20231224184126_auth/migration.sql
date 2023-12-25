-- CreateTable
CREATE TABLE "anne" (
    "anne" DATE NOT NULL,

    CONSTRAINT "anne_pkey" PRIMARY KEY ("anne")
);

-- CreateTable
CREATE TABLE "anne_universitaire" (
    "id_annee" INTEGER NOT NULL,
    "annee_universitaire" VARCHAR(255) NOT NULL,

    CONSTRAINT "anne_universitaire_pkey" PRIMARY KEY ("id_annee")
);

-- CreateTable
CREATE TABLE "asso_11" (
    "libelle" VARCHAR(255) NOT NULL,
    "url" VARCHAR(255) NOT NULL,
    "droitacces" VARCHAR(255),

    CONSTRAINT "asso_11_pkey" PRIMARY KEY ("libelle","url")
);

-- CreateTable
CREATE TABLE "asso_17" (
    "id" INTEGER NOT NULL,
    "idetablissement" BIGINT NOT NULL,

    CONSTRAINT "asso_17_pkey" PRIMARY KEY ("id","idetablissement")
);

-- CreateTable
CREATE TABLE "asso_19" (
    "idetablissement" BIGINT NOT NULL,
    "libelle" VARCHAR(255) NOT NULL,

    CONSTRAINT "asso_19_pkey" PRIMARY KEY ("idetablissement","libelle")
);

-- CreateTable
CREATE TABLE "asso_28" (
    "libelle" VARCHAR(255) NOT NULL,
    "id_license" INTEGER NOT NULL,

    CONSTRAINT "asso_28_pkey" PRIMARY KEY ("libelle","id_license")
);

-- CreateTable
CREATE TABLE "bac" (
    "id" INTEGER NOT NULL,
    "idbac" BIGINT NOT NULL,
    "moyenne" DOUBLE PRECISION,
    "id_province" INTEGER NOT NULL,
    "libelle" VARCHAR(255) NOT NULL,
    "id_etablissementsq" BIGINT NOT NULL,
    "id_specialite" BIGINT NOT NULL,
    "anne" DATE NOT NULL,

    CONSTRAINT "bac_pkey" PRIMARY KEY ("id","idbac")
);

-- CreateTable
CREATE TABLE "choisir" (
    "id_condidature" BIGINT NOT NULL,
    "id_concours" BIGINT NOT NULL,
    "priorite" SMALLINT,

    CONSTRAINT "choisir_pkey" PRIMARY KEY ("id_condidature","id_concours")
);

-- CreateTable
CREATE TABLE "concours" (
    "id_concours" BIGINT NOT NULL,
    "date_concours" DATE,
    "date_preinscription" DATE,
    "date_preselection" DATE,
    "nbr_demander" VARCHAR(50),
    "etat" VARCHAR(255),
    "id_license" INTEGER NOT NULL,

    CONSTRAINT "concours_pkey" PRIMARY KEY ("id_concours")
);

-- CreateTable
CREATE TABLE "condidat" (
    "id" INTEGER NOT NULL,
    "cne" VARCHAR(250),
    "cin" VARCHAR(255),
    "adresse" VARCHAR(255),
    "date_n" DATE,
    "id_condidature" BIGINT NOT NULL,

    CONSTRAINT "condidat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "condidature" (
    "id_condidature" BIGINT NOT NULL,
    "etat" VARCHAR(255),

    CONSTRAINT "condidature_pkey" PRIMARY KEY ("id_condidature")
);

-- CreateTable
CREATE TABLE "date_modification" (
    "id_date" INTEGER NOT NULL,
    "date_modification" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "date_modification_pkey" PRIMARY KEY ("id_date")
);

-- CreateTable
CREATE TABLE "deparetement" (
    "libelle_deparetement" VARCHAR(50) NOT NULL,

    CONSTRAINT "deparetement_pkey" PRIMARY KEY ("libelle_deparetement")
);

-- CreateTable
CREATE TABLE "diplome" (
    "id" INTEGER NOT NULL,
    "id_diplome" INTEGER NOT NULL,
    "anne" DATE NOT NULL,
    "libelle" VARCHAR(255) NOT NULL,
    "idetablissement" BIGINT NOT NULL,

    CONSTRAINT "diplome_pkey" PRIMARY KEY ("id","id_diplome")
);

-- CreateTable
CREATE TABLE "dossier" (
    "id_dossier" BIGINT NOT NULL,
    "id_condidature" BIGINT NOT NULL,

    CONSTRAINT "dossier_pkey" PRIMARY KEY ("id_dossier")
);

-- CreateTable
CREATE TABLE "dossier_concours" (
    "id_dossier_concours" BIGINT NOT NULL,
    "id_dossier" BIGINT NOT NULL,

    CONSTRAINT "dossier_concours_pkey" PRIMARY KEY ("id_dossier_concours")
);

-- CreateTable
CREATE TABLE "dossier_electronique" (
    "id_dossier" BIGINT NOT NULL,
    "id_dossier_electronique" BIGINT NOT NULL,

    CONSTRAINT "dossier_electronique_pkey" PRIMARY KEY ("id_dossier","id_dossier_electronique")
);

-- CreateTable
CREATE TABLE "dossier_physic" (
    "id_dossier" BIGINT NOT NULL,
    "id_dossier_physic" BIGINT NOT NULL,

    CONSTRAINT "dossier_physic_pkey" PRIMARY KEY ("id_dossier","id_dossier_physic")
);

-- CreateTable
CREATE TABLE "etablisement" (
    "idetablissement" BIGINT NOT NULL,
    "nometablissement" VARCHAR(255),
    "libelle" VARCHAR(255) NOT NULL,

    CONSTRAINT "etablisement_pkey" PRIMARY KEY ("idetablissement")
);

-- CreateTable
CREATE TABLE "etablisementsq" (
    "id_province" INTEGER NOT NULL,
    "libelle_1" VARCHAR(255) NOT NULL,
    "id_etablissementsq" BIGINT NOT NULL,
    "libelle" VARCHAR(255) NOT NULL,

    CONSTRAINT "etablisementsq_pkey" PRIMARY KEY ("id_province","libelle_1","id_etablissementsq")
);

-- CreateTable
CREATE TABLE "historisation_concours" (
    "id_concours" BIGINT NOT NULL,
    "id_date" INTEGER NOT NULL,
    "date_concours_ancien" DATE,
    "date_preinscription_ancien" DATE,
    "date_inscription_ancien" DATE,
    "etat" VARCHAR(255),

    CONSTRAINT "historisation_concours_pkey" PRIMARY KEY ("id_concours","id_date")
);

-- CreateTable
CREATE TABLE "historisation_condidature" (
    "id" INTEGER NOT NULL,
    "id_condidature" BIGINT NOT NULL,
    "id_date" INTEGER NOT NULL,
    "etat" VARCHAR(255),

    CONSTRAINT "historisation_condidature_pkey" PRIMARY KEY ("id","id_condidature","id_date")
);

-- CreateTable
CREATE TABLE "license" (
    "id_license" INTEGER NOT NULL,
    "libelle" VARCHAR(255),
    "libelle_deparetement" VARCHAR(50) NOT NULL,

    CONSTRAINT "license_pkey" PRIMARY KEY ("id_license")
);

-- CreateTable
CREATE TABLE "note" (
    "id" INTEGER NOT NULL,
    "id_diplome" INTEGER NOT NULL,
    "id_note" BIGINT NOT NULL,
    "classement" INTEGER,
    "note" DOUBLE PRECISION,
    "nbretudiants" BIGINT,
    "type" VARCHAR(255),
    "id_annee" INTEGER,

    CONSTRAINT "note_pkey" PRIMARY KEY ("id","id_diplome","id_note")
);

-- CreateTable
CREATE TABLE "page" (
    "url" VARCHAR(255) NOT NULL,
    "url_1" VARCHAR(255) NOT NULL,

    CONSTRAINT "page_pkey" PRIMARY KEY ("url")
);

-- CreateTable
CREATE TABLE "personne" (
    "id" INTEGER NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "nom" VARCHAR(255),
    "prenom" VARCHAR(255),
    "telephone" INTEGER,
    "password" VARCHAR(255) NOT NULL,
    "libelle" VARCHAR(255) NOT NULL,

    CONSTRAINT "personne_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "province" (
    "id_province" INTEGER NOT NULL,
    "libelle" VARCHAR(255) NOT NULL,

    CONSTRAINT "province_pkey" PRIMARY KEY ("id_province")
);

-- CreateTable
CREATE TABLE "role" (
    "libelle" VARCHAR(255) NOT NULL,
    "libelle_1" VARCHAR(255) NOT NULL,

    CONSTRAINT "role_pkey" PRIMARY KEY ("libelle")
);

-- CreateTable
CREATE TABLE "specialite" (
    "libelle" VARCHAR(255) NOT NULL,

    CONSTRAINT "specialite_pkey" PRIMARY KEY ("libelle")
);

-- CreateTable
CREATE TABLE "specialite_bac" (
    "id_specialite" BIGINT NOT NULL,
    "libelle" VARCHAR(255) NOT NULL,

    CONSTRAINT "specialite_bac_pkey" PRIMARY KEY ("id_specialite")
);

-- CreateTable
CREATE TABLE "type_diplome" (
    "libelle" VARCHAR(255) NOT NULL,

    CONSTRAINT "type_diplome_pkey" PRIMARY KEY ("libelle")
);

-- CreateTable
CREATE TABLE "ville" (
    "id_province" INTEGER NOT NULL,
    "libelle" VARCHAR(255) NOT NULL,

    CONSTRAINT "ville_pkey" PRIMARY KEY ("id_province","libelle")
);

-- CreateIndex
CREATE UNIQUE INDEX "anne_universitaire_annee_universitaire_key" ON "anne_universitaire"("annee_universitaire");

-- CreateIndex
CREATE UNIQUE INDEX "dossier_electronique_id_dossier_key" ON "dossier_electronique"("id_dossier");

-- CreateIndex
CREATE UNIQUE INDEX "dossier_physic_id_dossier_key" ON "dossier_physic"("id_dossier");

-- CreateIndex
CREATE UNIQUE INDEX "etablisementsq_libelle_key" ON "etablisementsq"("libelle");

-- CreateIndex
CREATE UNIQUE INDEX "personne_email_key" ON "personne"("email");

-- CreateIndex
CREATE UNIQUE INDEX "personne_telephone_key" ON "personne"("telephone");

-- CreateIndex
CREATE UNIQUE INDEX "province_libelle_key" ON "province"("libelle");

-- AddForeignKey
ALTER TABLE "asso_11" ADD CONSTRAINT "asso_11_libelle_fkey" FOREIGN KEY ("libelle") REFERENCES "role"("libelle") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "asso_11" ADD CONSTRAINT "asso_11_url_fkey" FOREIGN KEY ("url") REFERENCES "page"("url") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "asso_17" ADD CONSTRAINT "asso_17_id_fkey" FOREIGN KEY ("id") REFERENCES "condidat"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "asso_17" ADD CONSTRAINT "asso_17_idetablissement_fkey" FOREIGN KEY ("idetablissement") REFERENCES "etablisement"("idetablissement") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "asso_19" ADD CONSTRAINT "asso_19_idetablissement_fkey" FOREIGN KEY ("idetablissement") REFERENCES "etablisement"("idetablissement") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "asso_19" ADD CONSTRAINT "asso_19_libelle_fkey" FOREIGN KEY ("libelle") REFERENCES "specialite"("libelle") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "asso_28" ADD CONSTRAINT "asso_28_id_license_fkey" FOREIGN KEY ("id_license") REFERENCES "license"("id_license") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "asso_28" ADD CONSTRAINT "asso_28_libelle_fkey" FOREIGN KEY ("libelle") REFERENCES "specialite"("libelle") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "bac" ADD CONSTRAINT "bac_anne_fkey" FOREIGN KEY ("anne") REFERENCES "anne"("anne") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "bac" ADD CONSTRAINT "bac_id_fkey" FOREIGN KEY ("id") REFERENCES "condidat"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "bac" ADD CONSTRAINT "bac_id_province_libelle_id_etablissementsq_fkey" FOREIGN KEY ("id_province", "libelle", "id_etablissementsq") REFERENCES "etablisementsq"("id_province", "libelle_1", "id_etablissementsq") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "bac" ADD CONSTRAINT "bac_id_specialite_fkey" FOREIGN KEY ("id_specialite") REFERENCES "specialite_bac"("id_specialite") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "choisir" ADD CONSTRAINT "choisir_id_concours_fkey" FOREIGN KEY ("id_concours") REFERENCES "concours"("id_concours") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "choisir" ADD CONSTRAINT "choisir_id_condidature_fkey" FOREIGN KEY ("id_condidature") REFERENCES "condidature"("id_condidature") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "concours" ADD CONSTRAINT "concours_id_license_fkey" FOREIGN KEY ("id_license") REFERENCES "license"("id_license") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "condidat" ADD CONSTRAINT "condidat_id_condidature_fkey" FOREIGN KEY ("id_condidature") REFERENCES "condidature"("id_condidature") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "condidat" ADD CONSTRAINT "condidat_id_fkey" FOREIGN KEY ("id") REFERENCES "personne"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "diplome" ADD CONSTRAINT "diplome_anne_fkey" FOREIGN KEY ("anne") REFERENCES "anne"("anne") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "diplome" ADD CONSTRAINT "diplome_id_fkey" FOREIGN KEY ("id") REFERENCES "condidat"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "diplome" ADD CONSTRAINT "diplome_idetablissement_fkey" FOREIGN KEY ("idetablissement") REFERENCES "etablisement"("idetablissement") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "diplome" ADD CONSTRAINT "diplome_libelle_fkey" FOREIGN KEY ("libelle") REFERENCES "specialite"("libelle") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dossier" ADD CONSTRAINT "dossier_id_condidature_fkey" FOREIGN KEY ("id_condidature") REFERENCES "condidature"("id_condidature") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dossier_concours" ADD CONSTRAINT "dossier_concours_id_dossier_fkey" FOREIGN KEY ("id_dossier") REFERENCES "dossier"("id_dossier") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dossier_electronique" ADD CONSTRAINT "dossier_electronique_id_dossier_fkey" FOREIGN KEY ("id_dossier") REFERENCES "dossier"("id_dossier") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dossier_physic" ADD CONSTRAINT "dossier_physic_id_dossier_fkey" FOREIGN KEY ("id_dossier") REFERENCES "dossier"("id_dossier") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "etablisement" ADD CONSTRAINT "etablisement_libelle_fkey" FOREIGN KEY ("libelle") REFERENCES "type_diplome"("libelle") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "etablisementsq" ADD CONSTRAINT "etablisementsq_id_province_libelle_1_fkey" FOREIGN KEY ("id_province", "libelle_1") REFERENCES "ville"("id_province", "libelle") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "historisation_concours" ADD CONSTRAINT "historisation_concours_id_concours_fkey" FOREIGN KEY ("id_concours") REFERENCES "concours"("id_concours") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "historisation_concours" ADD CONSTRAINT "historisation_concours_id_date_fkey" FOREIGN KEY ("id_date") REFERENCES "date_modification"("id_date") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "historisation_condidature" ADD CONSTRAINT "historisation_condidature_id_condidature_fkey" FOREIGN KEY ("id_condidature") REFERENCES "condidature"("id_condidature") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "historisation_condidature" ADD CONSTRAINT "historisation_condidature_id_date_fkey" FOREIGN KEY ("id_date") REFERENCES "date_modification"("id_date") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "historisation_condidature" ADD CONSTRAINT "historisation_condidature_id_fkey" FOREIGN KEY ("id") REFERENCES "personne"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "license" ADD CONSTRAINT "license_libelle_deparetement_fkey" FOREIGN KEY ("libelle_deparetement") REFERENCES "deparetement"("libelle_deparetement") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "note" ADD CONSTRAINT "note_id_annee_fkey" FOREIGN KEY ("id_annee") REFERENCES "anne_universitaire"("id_annee") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "note" ADD CONSTRAINT "note_id_id_diplome_fkey" FOREIGN KEY ("id", "id_diplome") REFERENCES "diplome"("id", "id_diplome") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "page" ADD CONSTRAINT "page_url_1_fkey" FOREIGN KEY ("url_1") REFERENCES "page"("url") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "personne" ADD CONSTRAINT "personne_libelle_fkey" FOREIGN KEY ("libelle") REFERENCES "role"("libelle") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "role" ADD CONSTRAINT "role_libelle_1_fkey" FOREIGN KEY ("libelle_1") REFERENCES "role"("libelle") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ville" ADD CONSTRAINT "ville_id_province_fkey" FOREIGN KEY ("id_province") REFERENCES "province"("id_province") ON DELETE NO ACTION ON UPDATE NO ACTION;
