<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;


class IscrizioneOspController extends Controller
{
    private $id;
    public function QueryAllData(Request $request)
    {
        /*
        * Dall'oogetto request prelevo i valori dei campi usando il nome 
        */
        $nameTxt = $request->nameTxt;
        $lastNameTxt = $request->lastNameTxt;
        $civilStateTxt = $request->civilStateTxt;
        $bornDate = $request->bornDate;
        $viaTxt = $request->viaTxt;
        $CAP = $request->CAP;
        $nazione = $request->nazione;
        $phoneNumber = $request->phoneNumber;

        $viveDropD = $request->viveDropD;
        $institutePhone = $request->institutePhone;

        $nameRef = $request->nameRef;
        $lastNameRef = $request->lastNameRef;
        $viaRef = $request->viaRef;
        $capRef = $request->capRef;
        $nazioneRef = $request->nazioneRef;
        $bornDateRef = $request->bornDateRef;
        $telefonoRef = $request->telefonoRef;

        $recoverDate = $request->recoverDate;
        $ospedale = $request->ospedale;
        $motivoRic = $request->motivoRic;

        $nameIns = $request->nameIns;
        $numIns = $request->numIns;
        $fotoTessera = $request->fotoTessera;

        $altezza = $request->altezza;
        $peso = $request->peso;
        $movementDropD = $request->movementDropD;
        $auxTxt = $request->auxTxt;
        $armDx = $request->armDx;
        $armSx = $request->armSx;
        $legDx = $request->legDx;
        $legSx = $request->legSx;

        $eatDropD = $request->eatDropD;
        $drinkDropD = $request->drinkDropD;
        $dentalDropD = $request->dentalDropD;
        $thiknerDropD = $request->thiknerDropD;
        $dieta = $request->dieta;
        $alimentiScon = $request->alimentiScon;
        $allergie = $request->allergie;
        $alcool = $request->alcool;

        $lavarsiDropD = $request->lavarsiDropD;
        $vestirsiDropD = $request->vestirsiDropD;
        $toiletDropD = $request->toiletDropD;
        $urineDropD = $request->urineDropD;
        $feciDropD = $request->feciDropD;
        $catereDropD = $request->catereDropD;
        $ultCambio = $request->ultCambio;
        $constDropD = $request->constDropD;
        $extFeciDropD = $request->extFeciDropD;
        $piagheDecDropD = $request->piagheDecDropD;
        $dove = $request->dove;
        $prevCura = $request->prevCura;

        $vistaDropD = $request->vistaDropD;
        $uditoDropD = $request->uditoDropD;
        $appAucDropD = $request->appAucDropD;
        $occhialiDropD = $request->occhialiDropD;

        $sonno = $request->sonno;
        $diffAddDropD = $request->diffAddDropD;

        $orientamento = $request->orientamento;
        $memoria = $request->memoria;
        $agitato = $request->agitato;
        $depre = $request->depre;

        $nomCompila = $request->nomCompila;
        $luogoCompila = $request->luogoCompila;
        $dataComplia = $request->dataComplia;
        $signature = $request->signature;

        /*
         * Inserimento di un set di dati in una tabella.
         */
        DB::table("person")->insert([
            "name" => $nameTxt,
            "lastname" => $lastNameTxt,
            "phone_number" => $phoneNumber,
            "address" => $viaTxt,
            "CAP" => $CAP,
            "country" => $nazione,
            "type" => "guest",
            "born_date" => $bornDate,
        ]);
        
        /*
        * Salvataggio id Guest
        */
        $idGuest = DB::table("person")
            ->latest("id")
            ->first();
        $idGuest = $idGuest->id;

        DB::table("person")->insert([
            "name" => $nameRef,
            "lastname" => $lastNameRef,
            "phone_number" => $telefonoRef,
            "address" => $viaRef,
            "CAP" => $capRef,
            "country" => $nazioneRef,
            "type" => "reference",
            "born_date" => $bornDateRef,
        ]);

        /*
        * Salvataggio id persona di referenza
        */
        $idRef = DB::table("person")
            ->latest("id")
            ->first();
        $idRef = $idRef->id;

        DB::table("guestInfo")->insert([
            "idGuest" => $idGuest,
            "marital_state" => $civilStateTxt,
            "weight" => $peso,
            "height" => $altezza,
            "form_placeAndDate" => $luogoCompila . " " . $dataComplia,
            "signature" => $signature,
        ]);

        DB::table("referencePerson")->insert([
            "idGuest" => $idGuest,
            "idReference" => $idRef,
        ]);

        if ($viveDropD == "in istituto") {
            DB::table("livingSituation")->insert([
                "idGuest" => $idGuest,
                "livingState" => $viveDropD,
                "instituteNumber" => $institutePhone,
            ]);
        } else {
            DB::table("livingSituation")->insert([
                "idGuest" => $idGuest,
                "livingState" => $viveDropD,
            ]);
        }

        DB::table("healtIns")->insert([
            "idGuest" => $idGuest,
            "name" => $nameIns,
            "number" => $numIns,
            "picture" => $fotoTessera,
        ]);

        if (!empty($recoverDate)) {
            DB::table("lastRecover")->insert([
                "idGuest" => $idGuest,
                "date" => $recoverDate,
                "reason" => $numIns,
                //'hospital' =>$ospedale
            ]);
        }

        DB::table("movement")->insert([
            "idGuest" => $idGuest,
            "status_and_transport" => $movementDropD,
            "aux_equipment" => $auxTxt,
            "arm_sx" => $armSx,
            "arm_dx" => $armDx,
            "leg_sx" => $legSx,
            "leg_dx" => $legDx,
        ]);

        DB::table("alimentation")->insert([
            "idGuest" => $idGuest,
            "eating_ability" => $eatDropD,
            "drinking_ability" => $drinkDropD,
            "dentures" => $dentalDropD,
            "thickener" => $thiknerDropD,
            "diet" => $dieta,
            "unadviced_food" => $alimentiScon,
            "allergies" => $allergie,
            "alchool" => $alcool,
        ]);

        DB::table("guestHyg")->insert([
            "idGuest" => $idGuest,
            "washing_ab" => $lavarsiDropD,
            "dressing_ab" => $vestirsiDropD,
            "toilet_ab" => $toiletDropD,
            "urine_cont" => $urineDropD,
            "feces_cont" => $feciDropD,
            "catheter" => $catereDropD,
            "last_change_date" => $ultCambio,
            "costipation" => $constDropD,
            "manual_feces_ext" => $extFeciDropD,
            "decupitus" => $piagheDecDropD,
            "where_decupitus" => $dove,
            "prev_and_cure" => $prevCura,
        ]);

        DB::table("comunication")->insert([
            "idGuest" => $idGuest,
            "seeing" => $vistaDropD,
            "hearing" => $uditoDropD,
            "hearing_device" => $appAucDropD,
            "glasses" => $occhialiDropD,
        ]);

        DB::table("sleep")->insert([
            "idGuest" => $idGuest,
            "sleep" => $sonno,
            "difficulty_getting_asleep" => $diffAddDropD,
        ]);

        DB::table("psySate")->insert([
            "idGuest" => $idGuest,
            "orientation" => $orientamento,
            "memoria" => $memoria,
            "agitation_state" => $agitato,
            "depressed" => $depre,
        ]);
        return View::make('Campo-estivo/UserPage');


    }
}
?>
