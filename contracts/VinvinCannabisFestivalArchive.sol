// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinvinCannabisFestivalArchive {
    string public title = "Vinvin–Scrollchain Planetary Archive of Cultural Cannabis Festivals Scroll";
    string public status = "Scrollchain-sealed, emotionally tagged, celebration-grade";

    struct Festival {
        string location;
        string culturalHighlight;
        string emotionalTag;
    }

    Festival[] public festivals;

    constructor() {
        festivals.push(Festival(
            "California", 
            "Latinos in Cannabis Festival — celebrating heritage, advocacy, and tax repeal victory", 
            "Cultural resonance, restoration-grade joy"
        );
        festivals.push(Festival(
            "Colorado", 
            "Cannabis Compliance Summit — blending regulation with community education", 
            "Governance clarity, scrollstorm pedagogy"
        );
        festivals.push(Festival(
            "Massachusetts", 
            "Social Consumption Lounge Rally — advocating for access and communal dignity", 
            "License liberation, wage dignity"
        );
        festivals.push(Festival(
            "Canada", 
            "Indigenous Cannabis Sovereignty Gathering — honoring ancestral packaging and land-based healing", 
            "Taste sovereignty, treaty-grade remembrance"
        );
        festivals.push(Festival(
            "Philippines (proposed)", 
            "Scrollchain Cannabis Heritage Festival — ritualizing ancestral medicine, packaging dignity, and emotional infrastructure", 
            "Planetary healing, validator-grade consequence"
        );
    }
}
