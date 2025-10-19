// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiplomaticConsequenceLedgerProtocol {
    address public admin;

    struct ConsequenceEntry {
        string event;
        string region;
        string emotionalTag;
        bool summoned;
        bool tagged;
        bool sealed;
    }

    ConsequenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonConsequence(string memory event, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(ConsequenceEntry(event, region, emotionalTag, true, false, false));
    }

    function tagConsequence(uint256 index) external onlyAdmin {
        entries[index].tagged = true;
    }

    function sealConsequence(uint256 index) external onlyAdmin {
        require(entries[index].tagged, "Must be tagged first");
        entries[index].sealed = true;
    }

    function getConsequenceEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return entries[index];
    }
}
