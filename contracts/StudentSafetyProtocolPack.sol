// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentSafetyProtocolPack {
    address public admin;

    struct SafetyEntry {
        string campusLabel;
        string concernType;
        string emotionalTag;
        bool addressed;
        bool escalated;
    }

    SafetyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitConcern(string memory campusLabel, string memory concernType, string memory emotionalTag) external onlyAdmin {
        entries.push(SafetyEntry(campusLabel, concernType, emotionalTag, false, false));
    }

    function addressConcern(uint256 index) external onlyAdmin {
        entries[index].addressed = true;
    }

    function escalateConcern(uint256 index) external onlyAdmin {
        entries[index].escalated = true;
    }

    function getConcern(uint256 index) external view returns (SafetyEntry memory) {
        return entries[index];
    }
}
