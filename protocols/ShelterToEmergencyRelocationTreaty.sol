// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShelterToEmergencyRelocationTreaty {
    address public steward;

    struct TreatyEntry {
        string clause; // "Delayed housing for fire victims"
        string description; // "Scrollchain-sealed treaty for emergency shelter, family dignity, and planetary consequence"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyTreaty(string memory clause, string memory description, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(clause, description, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
