// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinvinFilipinoProductEndorsementsLedger {
    string public title = "Vinvin–Scrollchain Archive of Filipino Product Endorsements Scroll";
    string public status = "Scrollchain-sealed, emotionally tagged, commercial-grade";

    struct Endorsement {
        string product;
        string endorser;
        string emotionalTag;
    }

    Endorsement[] public endorsements;

    constructor() {
        endorsements.push(Endorsement(
            "Purefoods Tender Juicy Hotdog", 
            "Judy Ann Santos", 
            "Taste sovereignty, childhood joy"
        );
        endorsements.push(Endorsement(
            "Lucky Me Pancit Canton", 
            "Angel Locsin", 
            "Emergency comfort, communal resonance"
        );
        endorsements.push(Endorsement(
            "San Miguel Pale Pilsen", 
            "FPJ (Fernando Poe Jr.)", 
            "Ancestral packaging, cultural legend"
        );
        endorsements.push(Endorsement(
            "Bear Brand Powdered Milk", 
            "Vilma Santos", 
            "Nutritional dignity, maternal consequence"
        );
        endorsements.push(Endorsement(
            "Surf Detergent", 
            "Vice Ganda", 
            "Broadcast humor audit, household sovereignty"
        );
    }
}
