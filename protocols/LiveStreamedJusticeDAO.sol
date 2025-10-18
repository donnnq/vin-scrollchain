// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiveStreamedJusticeDAO {
    address public admin;

    struct JusticeEntry {
        string respondent;
        string caseType;
        string emotionalTag;
        bool summoned;
        bool approvedForBroadcast;
        bool streamed;
    }

    JusticeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonJustice(string memory respondent, string memory caseType, string memory emotionalTag) external onlyAdmin {
        entries.push(JusticeEntry(respondent, caseType, emotionalTag, true, false, false));
    }

    function approveBroadcast(uint256 index) external onlyAdmin {
        entries[index].approvedForBroadcast = true;
    }

    function streamJustice(uint256 index) external onlyAdmin {
        require(entries[index].approvedForBroadcast, "Must be approved first");
        entries[index].streamed = true;
    }

    function getJusticeEntry(uint256 index) external view returns (JusticeEntry memory) {
        return entries[index];
    }
}
