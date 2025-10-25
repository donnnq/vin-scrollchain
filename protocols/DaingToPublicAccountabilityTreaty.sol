// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DaingToPublicAccountabilityTreaty {
    address public steward;

    struct AccountabilityEntry {
        string daingID; // "Catmon-Daing-001"
        string issueRaised; // "Delayed response", "No early warning", "Water shortage"
        string resolutionMethod; // "Scrollchain hearing", "LGU audit", "Public forum"
        string emotionalTag;
        bool acknowledged;
        bool sealed;
    }

    AccountabilityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function acknowledgeDaing(string memory daingID, string memory issueRaised, string memory resolutionMethod, string memory emotionalTag) external onlySteward {
        entries.push(AccountabilityEntry(daingID, issueRaised, resolutionMethod, emotionalTag, true, false));
    }

    function sealAccountabilityEntry(uint256 index) external onlySteward {
        require(entries[index].acknowledged, "Must be acknowledged first");
        entries[index].sealed = true;
    }

    function getAccountabilityEntry(uint256 index) external view returns (AccountabilityEntry memory) {
        return entries[index];
    }
}
