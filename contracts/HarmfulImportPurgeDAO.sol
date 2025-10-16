// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HarmfulImportPurgeDAO {
    address public admin;

    struct PurgeEntry {
        string productLabel;
        string originCountry;
        string violationType;
        string emotionalTag;
        bool purged;
    }

    PurgeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory productLabel, string memory originCountry, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(PurgeEntry(productLabel, originCountry, violationType, emotionalTag, false));
    }

    function markPurged(uint256 index) external onlyAdmin {
        entries[index].purged = true;
    }

    function getEntry(uint256 index) external view returns (PurgeEntry memory) {
        return entries[index];
    }
}
