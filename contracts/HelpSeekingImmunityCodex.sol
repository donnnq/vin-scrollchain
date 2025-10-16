// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelpSeekingImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string personLabel;
        string helpType;
        string emotionalTag;
        bool protected;
        bool ritualized;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitImmunity(string memory personLabel, string memory helpType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(personLabel, helpType, emotionalTag, false, false));
    }

    function protectHelpSeeker(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function ritualizeHelpRequest(uint256 index) external onlyAdmin {
        entries[index].ritualized = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
