// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryLaborJusticeCodex {
    address public admin;

    struct JusticeEntry {
        string workerName;
        string country;
        string violationType;
        string emotionalTag;
        bool restored;
        bool archived;
    }

    JusticeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logJustice(string memory workerName, string memory country, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(JusticeEntry(workerName, country, violationType, emotionalTag, false, false));
    }

    function markRestored(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function archiveJustice(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getJustice(uint256 index) external view returns (JusticeEntry memory) {
        return entries[index];
    }
}
