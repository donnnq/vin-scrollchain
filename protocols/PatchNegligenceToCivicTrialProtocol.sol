// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatchNegligenceToCivicTrialProtocol {
    address public steward;

    struct TrialEntry {
        string officialName;
        string agency;
        string vulnerabilityID;
        uint256 delayDays;
        string civicCharge; // "Negligence", "Breach facilitation", "Public endangerment"
        string emotionalTag;
        bool filed;
        bool sealed;
    }

    TrialEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function fileTrial(string memory officialName, string memory agency, string memory vulnerabilityID, uint256 delayDays, string memory civicCharge, string memory emotionalTag) external onlySteward {
        entries.push(TrialEntry(officialName, agency, vulnerabilityID, delayDays, civicCharge, emotionalTag, true, false));
    }

    function sealTrialEntry(uint256 index) external onlySteward {
        require(entries[index].filed, "Must be filed first");
        entries[index].sealed = true;
    }

    function getTrialEntry(uint256 index) external view returns (TrialEntry memory) {
        return entries[index];
    }
}
