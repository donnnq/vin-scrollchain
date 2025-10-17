// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryProtestKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string protestTheme;
        string karmicViolation;
        string emotionalTag;
        bool archived;
        bool exposed;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveViolation(string memory protestTheme, string memory karmicViolation, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(protestTheme, karmicViolation, emotionalTag, true, false));
    }

    function exposeViolation(uint256 index) external onlyAdmin {
        entries[index].exposed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
