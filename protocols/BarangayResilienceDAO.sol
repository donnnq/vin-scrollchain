// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayResilienceDAO {
    address public admin;

    struct ResilienceEntry {
        string barangay;
        string resilienceType; // "Drainage Upgrade", "Flood Alert System", "Green Buffer Zone"
        string clause;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    ResilienceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResilience(string memory barangay, string memory resilienceType, string memory clause, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(barangay, resilienceType, clause, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealResilienceEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getResilienceEntry(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
