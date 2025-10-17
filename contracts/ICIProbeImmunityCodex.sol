// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICIProbeImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string subjectName;
        string immunityClaim;
        string emotionalTag;
        bool reviewed;
        bool denied;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function reviewImmunity(string memory subjectName, string memory immunityClaim, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(subjectName, immunityClaim, emotionalTag, true, false));
    }

    function denyImmunity(uint256 index) external onlyAdmin {
        entries[index].denied = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
