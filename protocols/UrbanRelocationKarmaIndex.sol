// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanRelocationKarmaIndex {
    address public admin;

    struct KarmaEntry {
        string location;
        string actionType; // "Relocation", "Eviction", "Road Conversion"
        string karmaClause;
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonKarma(string memory location, string memory actionType, string memory karmaClause, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(location, actionType, karmaClause, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
