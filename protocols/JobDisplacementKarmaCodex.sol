// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JobDisplacementKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string sector;
        string displacedRole;
        string karmaClause;
        string emotionalTag;
        bool summoned;
        bool acknowledged;
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

    function summonKarma(string memory sector, string memory displacedRole, string memory karmaClause, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(sector, displacedRole, karmaClause, emotionalTag, true, false, false));
    }

    function confirmAcknowledgement(uint256 index) external onlyAdmin {
        entries[index].acknowledged = true;
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].acknowledged, "Must be acknowledged first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
