// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VictimEmotionalTaggingLedger {
    address public admin;

    struct VictimEntry {
        string alias;
        string scamType; // "Pig Butchering", "Romance Scam", "Investment Fraud"
        string emotionalLayer; // "Trust Breach", "Financial Loss", "Identity Manipulation"
        string emotionalTag;
        bool summoned;
        bool tagged;
        bool sealed;
    }

    VictimEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonVictim(string memory alias, string memory scamType, string memory emotionalLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(VictimEntry(alias, scamType, emotionalLayer, emotionalTag, true, false, false));
    }

    function confirmTagging(uint256 index) external onlyAdmin {
        entries[index].tagged = true;
    }

    function sealVictimEntry(uint256 index) external onlyAdmin {
        require(entries[index].tagged, "Must be tagged first");
        entries[index].sealed = true;
    }

    function getVictimEntry(uint256 index) external view returns (VictimEntry memory) {
        return entries[index];
    }
}
