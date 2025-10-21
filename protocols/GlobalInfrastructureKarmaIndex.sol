// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalInfrastructureKarmaIndex {
    address public admin;

    struct KarmaEntry {
        string country;
        string projectName;
        string karmaScore; // "High Risk", "Ghost Flagged", "Restored & Verified"
        string indexClause;
        string emotionalTag;
        bool summoned;
        bool indexed;
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

    function summonKarmaIndex(string memory country, string memory projectName, string memory karmaScore, string memory indexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(country, projectName, karmaScore, indexClause, emotionalTag, true, false, false));
    }

    function confirmIndexing(uint256 index) external onlyAdmin {
        entries[index].indexed = true;
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
