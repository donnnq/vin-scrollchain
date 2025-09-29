// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinvinOVPBudgetEmotionalLedger {
    string public title = "Vinvin–OVP Budget Emotional Ledger";
    string public status = "Scrollchain-sealed, emotionally tagged, vice-presidential-grade";

    struct Allocation {
        string program;
        uint256 amount;
        string emotionalTag;
        string civicImpact;
    }

    Allocation[] public allocations;

    constructor() {
        // Sample emotional tagging
        allocations.push(Allocation("Medical Assistance Program", 250_000_000, "Hope", "Direct relief for indigent patients"));
        allocations.push(Allocation("Satellite Office Operations", 180_000_000, "Presence", "Regional access to VP services"));
        allocations.push(Allocation("Educational Aid", 120_000_000, "Aspiration", "Support for marginalized students"));
        allocations.push(Allocation("Livelihood Kits", 100_000_000, "Dignity", "Empowerment of low-income families"));
        allocations.push(Allocation("Personnel Services", 200_000_000, "Stability", "Support for staff and operations"));
        allocations.push(Allocation("Maintenance & Operating Expenses", 52_895_000, "Continuity", "Daily functioning of OVP sanctum"));
    }
}
