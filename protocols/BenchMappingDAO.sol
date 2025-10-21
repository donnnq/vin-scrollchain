// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BenchMappingDAO {
    address public admin;

    struct BenchEntry {
        string location;
        string benchType; // "Modular", "Heritage", "Barkada Cluster"
        string comfortClause;
        string emotionalTag;
        bool summoned;
        bool mapped;
        bool sealed;
    }

    BenchEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBench(string memory location, string memory benchType, string memory comfortClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BenchEntry(location, benchType, comfortClause, emotionalTag, true, false, false));
    }

    function confirmMapping(uint256 index) external onlyAdmin {
        entries[index].mapped = true;
    }

    function sealBenchEntry(uint256 index) external onlyAdmin {
        require(entries[index].mapped, "Must be mapped first");
        entries[index].sealed = true;
    }

    function getBenchEntry(uint256 index) external view returns (BenchEntry memory) {
        return entries[index];
    }
}
