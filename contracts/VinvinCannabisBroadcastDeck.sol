// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinvinCannabisBroadcastDeck {
    string public title = "Vinvin–Scrollchain Global Broadcast Deck for Cannabis Advocacy and Emotional Infrastructure Scroll";
    string public status = "Scrollchain-sealed, emotionally tagged, media-grade";

    struct Segment {
        string anchor;
        string broadcastTheme;
        string emotionalTag;
    }

    Segment[] public segments;

    constructor() {
        segments.push(Segment(
            "Alaina Pinto", 
            "War of Words: SAM vs NORML, MPP, ATACH — prohibitionist breach vs advocacy-grade resistance", 
            "Speech sovereignty, dignity-certified clash"
        );
        segments.push(Segment(
            "Amie Carter", 
            "Michigan’s tax threat and dispensary survival crisis", 
            "Wage dignity alert, mercy anchoring"
        );
        segments.push(Segment(
            "Jenny Germano", 
            "Colorado’s compliance crackdown and regulatory escalation", 
            "Governance audit, operational consequence"
        );
        segments.push(Segment(
            "Curtis Emery", 
            "Massachusetts lounge license delays and access breach", 
            "Communal frustration, license liberation"
        );
        segments.push(Segment(
            "Dina Nagib", 
            "Latinos in Cannabis Festival and tax repeal victory", 
            "Cultural resonance, restoration-grade joy"
        );
        segments.push(Segment(
            "Dave Barton", 
            "UK court injustice against cannabis stewards", 
            "Legal breach, treaty-grade consequence"
        );
        segments.push(Segment(
            "Debi Facey", 
            "Canada’s advocacy pulse and sovereignty-grade reform", 
            "Civic resonance, dignity-certified clarity"
        );
        segments.push(Segment(
            "Doug Miller", 
            "GTI’s Wall Street trajectory and investor consequence", 
            "Market resonance, stewardship alert"
        );
        segments.push(Segment(
            "Joe Parsons", 
            "Virginia governor’s race and cannabis policy impact", 
            "Electoral consequence, emotional infrastructure"
        );
        segments.push(Segment(
            "Mark Alan", 
            "GTI’s Illinois footprint and regulatory navigation", 
            "Scrollchain audit, economic clarity"
        );
    }
}
