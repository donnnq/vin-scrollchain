// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerSanctumTownProtocol {
    address public admin;

    struct TownEntry {
        string townName;
        string location;
        string emotionalTag;
        bool summoned;
        bool built;
    }

    TownEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTown(string memory townName, string memory location, string memory emotionalTag) external onlyAdmin {
        entries.push(TownEntry(townName, location, emotionalTag, true, false));
    }

    function buildTown(uint256 index) external onlyAdmin {
        entries[index].built = true;
    }

    function getTownEntry(uint256 index) external view returns (TownEntry memory) {
        return entries[index];
    }
}
