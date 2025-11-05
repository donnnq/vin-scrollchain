// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayDefenseReadinessLedger {
    address public steward;

    struct ReadinessEntry {
        string barangay;
        string exSoldierName;
        string defenseRole;
        string emotionalTag;
    }

    ReadinessEntry[] public ledger;

    event DefenseReadinessTagged(string barangay, string exSoldierName, string defenseRole, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagReadiness(
        string memory barangay,
        string memory exSoldierName,
        string memory defenseRole,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ReadinessEntry(barangay, exSoldierName, defenseRole, emotionalTag));
        emit DefenseReadinessTagged(barangay, exSoldierName, defenseRole, emotionalTag);
    }
}
