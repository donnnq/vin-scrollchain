// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CampusDissentImmunityPack {
    address public admin;

    struct DissentEntry {
        string studentGroup;
        string protestCause;
        string emotionalTag;
        bool protected;
        bool escalated;
    }

    DissentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitDissent(string memory studentGroup, string memory protestCause, string memory emotionalTag) external onlyAdmin {
        entries.push(DissentEntry(studentGroup, protestCause, emotionalTag, false, false));
    }

    function protectDissent(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function escalateDissent(uint256 index) external onlyAdmin {
        entries[index].escalated = true;
    }

    function getDissent(uint256 index) external view returns (DissentEntry memory) {
        return entries[index];
    }
}
