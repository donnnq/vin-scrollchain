// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinvinSuppressedVoicesArchive {
    string public title = "Vinvin–Scrollchain Archive of Suppressed Voices and Algorithmic Drift Scroll";
    string public status = "Scrollchain-sealed, emotionally tagged, remembrance-grade";

    struct SuppressedVoice {
        string creator;
        string suppressionType;
        string emotionalTag;
    }

    SuppressedVoice[] public entries;

    constructor() {
        entries.push(SuppressedVoice(
            "China Uncensored", 
            "Shadowbanned and algorithmically throttled on YouTube", 
            "Speech sovereignty breach, grief tagging"
        );
        entries.push(SuppressedVoice(
            "Independent Journalists in Xinjiang", 
            "Content erased, accounts suspended, visibility suppressed", 
            "Planetary consequence, reputational restraint"
        );
        entries.push(SuppressedVoice(
            "Youth Creators in Political Corridors", 
            "Demonetized for commentary on global governance", 
            "Legacy activation, emotional infrastructure"
        );
        entries.push(SuppressedVoice(
            "Satirical Broadcasters", 
            "Suppressed for comedic audits of authoritarian regimes", 
            "Civic joy, flex suppression"
        );
        entries.push(SuppressedVoice(
            "Digital Whistleblowers", 
            "Erased from platforms after exposing surveillance contracts", 
            "Governance grief, broadcast immunity"
        );
    }
}
