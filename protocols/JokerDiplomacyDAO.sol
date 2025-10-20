// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JokerDiplomacyDAO {
    address public admin;

    struct DiplomacyEntry {
        string actor;
        string ultimatum;
        string strategicClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    DiplomacyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDiplomacy(string memory actor, string memory ultimatum, string memory strategicClause, string memory emotionalTag) external onlyAdmin {
        entries.push(DiplomacyEntry(actor, ultimatum, strategicClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealDiplomacyEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getDiplomacyEntry(uint256 index) external view returns (DiplomacyEntry memory) {
        return entries[index];
    }
}
