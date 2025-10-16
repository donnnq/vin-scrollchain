// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RaceDistrictingKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string state;
        string districtName;
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

    function logViolation(string memory state, string memory districtName, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(state, districtName, violationType, emotionalTag, true, false));
    }

    function archiveViolation(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getViolation(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
