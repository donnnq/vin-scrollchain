// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WomenAthleteIntegrityDAO {
    address public admin;

    struct IntegrityEntry {
        string athleteName;
        string sport;
        string emotionalTag;
        bool verified;
        bool protected;
    }

    IntegrityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function verifyAthlete(string memory athleteName, string memory sport, string memory emotionalTag) external onlyAdmin {
        entries.push(IntegrityEntry(athleteName, sport, emotionalTag, true, false));
    }

    function protectAthlete(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getIntegrityEntry(uint256 index) external view returns (IntegrityEntry memory) {
        return entries[index];
    }
}
