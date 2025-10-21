// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeBiasDAO {
    address public admin;

    struct BiasEntry {
        string chamber;
        string biasType; // "Committee Chair Selection", "Investigation Scope", "Partisan Shielding"
        string biasClause;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool sealed;
    }

    BiasEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBias(string memory chamber, string memory biasType, string memory biasClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BiasEntry(chamber, biasType, biasClause, emotionalTag, true, false, false));
    }

    function confirmFlagging(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function sealBiasEntry(uint256 index) external onlyAdmin {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getBiasEntry(uint256 index) external view returns (BiasEntry memory) {
        return entries[index];
    }
}
