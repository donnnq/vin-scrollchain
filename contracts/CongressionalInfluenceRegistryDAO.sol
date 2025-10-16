// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CongressionalInfluenceRegistryDAO {
    address public admin;

    struct InfluenceEntry {
        string legislatorLabel;
        string influenceType;
        string targetAgency;
        string emotionalTag;
        bool confirmed;
    }

    InfluenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitInfluence(string memory legislatorLabel, string memory influenceType, string memory targetAgency, string memory emotionalTag) external onlyAdmin {
        entries.push(InfluenceEntry(legislatorLabel, influenceType, targetAgency, emotionalTag, false));
    }

    function confirmInfluence(uint256 index) external onlyAdmin {
        entries[index].confirmed = true;
    }

    function getEntry(uint256 index) external view returns (InfluenceEntry memory) {
        return entries[index];
    }
}
