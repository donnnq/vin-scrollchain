// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdSpendToDiplomaticConsequenceProtocol {
    address public steward;

    struct AdEntry {
        string fundingEntity; // "Ontario Government", "Doug Ford Admin"
        string adContent; // "Anti-US messaging", "Trade attack ad"
        string consequenceType; // "Trade cancellation", "Diplomatic freeze"
        string emotionalTag;
        bool triggered;
        bool sealed;
    }

    AdEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function triggerConsequence(string memory fundingEntity, string memory adContent, string memory consequenceType, string memory emotionalTag) external onlySteward {
        entries.push(AdEntry(fundingEntity, adContent, consequenceType, emotionalTag, true, false));
    }

    function sealAdEntry(uint256 index) external onlySteward {
        require(entries[index].triggered, "Must be triggered first");
        entries[index].sealed = true;
    }

    function getAdEntry(uint256 index) external view returns (AdEntry memory) {
        return entries[index];
    }
}
