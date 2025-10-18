// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AirpowerDiplomacyCodex {
    address public admin;

    struct DiplomacyEntry {
        string operationName;
        string targetNation;
        string emotionalTag;
        bool deployed;
        bool archived;
    }

    DiplomacyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployAirpower(string memory operationName, string memory targetNation, string memory emotionalTag) external onlyAdmin {
        entries.push(DiplomacyEntry(operationName, targetNation, emotionalTag, true, false));
    }

    function archiveDiplomacy(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getDiplomacyEntry(uint256 index) external view returns (DiplomacyEntry memory) {
        return entries[index];
    }
}
