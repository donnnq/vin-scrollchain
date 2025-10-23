// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberattackToInsuranceActivationGrid {
    address public steward;

    struct InsuranceEntry {
        string agencyName;
        string attackName;
        string breachImpact; // "Data loss", "Downtime", "Espionage"
        uint256 claimAmount;
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    InsuranceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateInsurance(string memory agencyName, string memory attackName, string memory breachImpact, uint256 claimAmount, string memory emotionalTag) external onlySteward {
        entries.push(InsuranceEntry(agencyName, attackName, breachImpact, claimAmount, emotionalTag, true, false));
    }

    function sealInsuranceEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getInsuranceEntry(uint256 index) external view returns (InsuranceEntry memory) {
        return entries[index];
    }
}
