// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFloodDAO {
    address public admin;

    struct FloodEntry {
        string barangay;
        string floodCause; // "Clogged Drainage", "Unfinished Project", "Ghost Infrastructure"
        string mitigationClause;
        string emotionalTag;
        bool summoned;
        bool mitigated;
        bool sealed;
    }

    FloodEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFloodMitigation(string memory barangay, string memory floodCause, string memory mitigationClause, string memory emotionalTag) external onlyAdmin {
        entries.push(FloodEntry(barangay, floodCause, mitigationClause, emotionalTag, true, false, false));
    }

    function confirmMitigation(uint256 index) external onlyAdmin {
        entries[index].mitigated = true;
    }

    function sealFloodEntry(uint256 index) external onlyAdmin {
        require(entries[index].mitigated, "Must be mitigated first");
        entries[index].sealed = true;
    }

    function getFloodEntry(uint256 index) external view returns (FloodEntry memory) {
        return entries[index];
    }
}
