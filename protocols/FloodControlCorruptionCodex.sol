// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlCorruptionCodex {
    address public admin;

    struct CorruptionEntry {
        string region;
        string contractorName;
        string corruptionClause;
        string emotionalTag;
        bool summoned;
        bool exposed;
        bool sealed;
    }

    CorruptionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCorruption(string memory region, string memory contractorName, string memory corruptionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(CorruptionEntry(region, contractorName, corruptionClause, emotionalTag, true, false, false));
    }

    function confirmExposure(uint256 index) external onlyAdmin {
        entries[index].exposed = true;
    }

    function sealCorruptionEntry(uint256 index) external onlyAdmin {
        require(entries[index].exposed, "Must be exposed first");
        entries[index].sealed = true;
    }

    function getCorruptionEntry(uint256 index) external view returns (CorruptionEntry memory) {
        return entries[index];
    }
}
