// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FastTrackDignityProtocol {
    address public admin;

    struct DignityEntry {
        string migrantName;
        string careType;
        string emotionalTag;
        bool summoned;
        bool delivered;
    }

    DignityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCare(string memory migrantName, string memory careType, string memory emotionalTag) external onlyAdmin {
        entries.push(DignityEntry(migrantName, careType, emotionalTag, true, false));
    }

    function deliverCare(uint256 index) external onlyAdmin {
        entries[index].delivered = true;
    }

    function getDignityEntry(uint256 index) external view returns (DignityEntry memory) {
        return entries[index];
    }
}
