// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatchDelayToResignationProtocol {
    address public steward;

    struct ResignationEntry {
        string officialName;
        string agency;
        string vulnerabilityID;
        uint256 delayDays;
        string breachOutcome; // "Compromise", "Espionage", "Public backlash"
        string emotionalTag;
        bool triggered;
        bool sealed;
    }

    ResignationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function triggerResignation(string memory officialName, string memory agency, string memory vulnerabilityID, uint256 delayDays, string memory breachOutcome, string memory emotionalTag) external onlySteward {
        entries.push(ResignationEntry(officialName, agency, vulnerabilityID, delayDays, breachOutcome, emotionalTag, true, false));
    }

    function sealResignationEntry(uint256 index) external onlySteward {
        require(entries[index].triggered, "Must be triggered first");
        entries[index].sealed = true;
    }

    function getResignationEntry(uint256 index) external view returns (ResignationEntry memory) {
        return entries[index];
    }
}
