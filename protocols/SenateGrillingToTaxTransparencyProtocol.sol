// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateGrillingToTaxTransparencyProtocol {
    address public steward;

    struct GrillingEntry {
        string senatorName; // "Marcoleta"
        string agencyTargeted; // "ERC"
        string issueRaised; // "12% VAT"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    GrillingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastGrilling(string memory senatorName, string memory agencyTargeted, string memory issueRaised, string memory emotionalTag) external onlySteward {
        entries.push(GrillingEntry(senatorName, agencyTargeted, issueRaised, emotionalTag, true, false));
    }

    function sealGrillingEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getGrillingEntry(uint256 index) external view returns (GrillingEntry memory) {
        return entries[index];
    }
}
