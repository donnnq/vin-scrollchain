// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodResilienceDAO {
    address public admin;

    struct ResilienceEntry {
        string projectName;
        string region;
        string emotionalTag;
        bool summoned;
        bool validated;
    }

    ResilienceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResilience(string memory projectName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(projectName, region, emotionalTag, true, false));
    }

    function validateResilience(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function getResilience(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
