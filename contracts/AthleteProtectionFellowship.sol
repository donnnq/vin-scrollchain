// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AthleteProtectionFellowship {
    address public admin;

    struct ProtectionEntry {
        string athleteName;
        string sport;
        string emotionalTag;
        bool protected;
        bool verified;
    }

    ProtectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectAthlete(string memory athleteName, string memory sport, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(athleteName, sport, emotionalTag, true, false));
    }

    function verifyProtection(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
