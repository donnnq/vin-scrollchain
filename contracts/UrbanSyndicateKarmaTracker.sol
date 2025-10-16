// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanSyndicateKarmaTracker {
    address public admin;

    struct KarmaEntry {
        string entityName;
        string city;
        string violationType;
        string emotionalTag;
        bool exposed;
        bool archived;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function exposeEntity(string memory entityName, string memory city, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(entityName, city, violationType, emotionalTag, true, false));
    }

    function archiveEntity(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getKarma(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
