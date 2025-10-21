// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ParkMercyCodex {
    address public admin;

    struct MercyEntry {
        string parkName;
        string mercyType; // "Security Patrol", "Trash Can", "Portalet", "Lighting Audit"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    MercyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMercy(string memory parkName, string memory mercyType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(MercyEntry(parkName, mercyType, codexClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealMercyEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getMercyEntry(uint256 index) external view returns (MercyEntry memory) {
        return entries[index];
    }
}
