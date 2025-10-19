// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeveloperRecruitmentBreachTrackerDAO {
    address public admin;

    struct BreachEntry {
        string platform;
        string lureMethod;
        string malwareLinked;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool sealed;
    }

    BreachEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBreach(string memory platform, string memory lureMethod, string memory malwareLinked, string memory emotionalTag) external onlyAdmin {
        entries.push(BreachEntry(platform, lureMethod, malwareLinked, emotionalTag, true, false, false));
    }

    function flagBreach(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function sealBreach(uint256 index) external onlyAdmin {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getBreachEntry(uint256 index) external view returns (BreachEntry memory) {
        return entries[index];
    }
}
