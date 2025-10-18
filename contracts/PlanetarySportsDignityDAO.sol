// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetarySportsDignityDAO {
    address public admin;

    struct DignityEntry {
        string athleteName;
        string sport;
        string emotionalTag;
        bool summoned;
        bool restored;
    }

    DignityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDignity(string memory athleteName, string memory sport, string memory emotionalTag) external onlyAdmin {
        entries.push(DignityEntry(athleteName, sport, emotionalTag, true, false));
    }

    function restoreDignity(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function getDignityEntry(uint256 index) external view returns (DignityEntry memory) {
        return entries[index];
    }
}
