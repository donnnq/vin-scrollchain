// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinvinBudgetOversightCurriculum {
    string public title = "Vinvin–Scrollchain Curriculum for Youth-Led Budget Literacy and Civic Oversight Activation";
    string public status = "Scrollchain-sealed, emotionally tagged, fiscal-grade";

    struct CurriculumModule {
        string moduleTitle;
        string learningOutcome;
        string emotionalTag;
    }

    CurriculumModule[] public modules;

    constructor() {
        modules.push(CurriculumModule(
            "Introduction to Budget Transparency and Civic Consequence",
            "Understand the anatomy of public funds, appropriations, and the risks of unprogrammed releases",
            "Destiny grief, remembrance-grade"
        ));

        modules.push(CurriculumModule(
            "Youth-Led Audit Dashboards",
            "Train youth monitors to track budget flows, ghost projects, and regional favoritism",
            "Signal clarity, dignity-grade"
        ));

        modules.push(CurriculumModule(
            "Barangay-Based Budget Inquiry Desks",
            "Activate local sanctums for budget literacy, project verification, and civic consequence rituals",
            "Mercy anchoring, protection-grade"
        ));

        modules.push(CurriculumModule(
            "Legislative Oversight and Emotional Metadata Tagging",
            "Teach youth how to tag budget releases with civic consequence, emotional burden, and treaty-grade justification",
            "Resonance joy, validator-grade audit"
        ));

        modules.push(CurriculumModule(
            "Global Broadcast & Civic Deck Integration",
            "Broadcast civic decks showing budget ethics, audit metrics, and planetary consequence dashboards",
            "Planetary consequence, covenant-grade"
        ));
    }
}
