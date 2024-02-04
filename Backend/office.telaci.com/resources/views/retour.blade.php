<?php
if (isset($_POST['cpm_trans_id'])) {
    // SDK PHP de CinetPay
    require_once __DIR__ . '/cinetpay.php';
    require_once __DIR__ . '/commande.php';

    //La classe commande correspond à votre colonne qui gère les transactions dans votre base de données
    $commande = new Commande();
    try {
        // Initialisation de CinetPay et Identification du paiement
        $id_transaction = $_POST['cpm_trans_id'];
        $apiKey = _VOTRE_APIKEY_;
        $site_id = _VOTRE_SITEID_;
        $plateform = "TEST"; // Valorisé à PROD si vous êtes en production
        $version = "V2"; // Valorisé à V1 si vous voulez utiliser la version 1 de l'api
        $CinetPay = new CinetPay($site_id, $apiKey, $plateform, $version);
        // Reprise exacte des bonnes données chez CinetPay
        $CinetPay->setTransId($id_transaction)->getPayStatus();
        $cpm_site_id = $CinetPay->_cpm_site_id;
        $signature = $CinetPay->_signature;
        $cpm_amount = $CinetPay->_cpm_amount;
        $cpm_trans_id = $CinetPay->_cpm_trans_id;
        $cpm_custom = $CinetPay->_cpm_custom;
        $cpm_currency = $CinetPay->_cpm_currency;
        $cpm_payid = $CinetPay->_cpm_payid;
        $cpm_payment_date = $CinetPay->_cpm_payment_date;
        $cpm_payment_time = $CinetPay->_cpm_payment_time;
        $cpm_error_message = $CinetPay->_cpm_error_message;
        $payment_method = $CinetPay->_payment_method;
        $cpm_phone_prefixe = $CinetPay->_cpm_phone_prefixe;
        $cel_phone_num = $CinetPay->_cel_phone_num;
        $cpm_ipn_ack = $CinetPay->_cpm_ipn_ack;
        $created_at = $CinetPay->_created_at;
        $updated_at = $CinetPay->_updated_at;
        $cpm_result = $CinetPay->_cpm_result;
        $cpm_trans_status = $CinetPay->_cpm_trans_status;
        $cpm_designation = $CinetPay->_cpm_designation;
        $buyer_name = $CinetPay->_buyer_name;

        // Recuperation de la ligne de la transaction dans votre base de données
        $commande->setTransId($id_transaction);
        $commande->getCommandeByTransId();
        // Verification de l'etat du traitement de la commande
        if ($commande->getStatut() == '00') {
            echo 'Felicitation, votre paiement a été effectué avec succès';
            die();
        }
        // On verifie que le montant payé chez CinetPay correspond à notre montant en base de données pour cette transaction
        if ($commande->getMontant() == $cpm_amount) {
            if($cpm_result == '00'){
                echo 'Felicitation, votre paiement a été effectué avec succès';
                die();
            }else{
                echo 'Echec, votre paiement a échoué';
                die();
            }
        } else {
            echo 'Echec, votre paiement a été validé mais les montants ne correspondent pas';
            die();
        }
    } catch (Exception $e) {
        echo "Erreur :" . $e->getMessage();
        // Une erreur s'est produite
    }
} else {
    // redirection vers la page d'accueil
    die();
}
?>
