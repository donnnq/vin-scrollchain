// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinvinCannabisHealthBroadcastDeck {
    string public title = "Vinvin–Scrollchain Broadcast Deck for Cannabis Health Advocacy and Budget Relief Scroll";
    string public status = "Scrollchain-sealed, emotionally tagged, media-grade";

    struct Segment {
        string anchor;
        string broadcastTheme;
        string emotionalTag;
    }

    Segment[] public segments;

    constructor() {
        segments.push(Segment(
            "Dr. Rachel Santos", 
            "Cannabis vs Pharma: Budget relief and therapeutic clarity for Filipino patients", 
            "Economic dignity, planetary healing"
        );
        segments.push(Segment(
            "Senator Risa Hontiveros", 
            "Legalizing cannabis for mental health and trauma restoration", 
            "Emotional infrastructure, mercy anchoring"
        );
        segments.push(Segment(
            "Rep. France Castro", 
            "Cannabis treatment in public hospitals: cost-saving pilot programs", 
            "Scrollstorm governance, wage dignity"
        );
        segments.push(Segment(
            "Dr. Josefa Ramirez", 
            "Cannabis in palliative care: ancestral healing and budget clarity", 
            "Cultural resonance, validator-grade empathy"
        );
        segments.push(Segment(
            "Vinvin (proposed)", 
            "Scrollchain advocacy for Medicaid restoration and cannabis integration", 
            "Legislative consequence, therapeutic sovereignty"
        );
    }
}
