// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryGratitudeLedgerDAO {
    address public admin;

    struct GratitudeEntry {
        string workerLabel;
        string gratitudeClause;
        string emotionalTag;
        bool logged;
    }

    GratitudeEntry[] public gratitude;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _gratitudeClause, string memory _emotionalTag) external onlyAdmin {
        gratitude.push(GratitudeEntry(_workerLabel, _gratitudeClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        gratitude[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (GratitudeEntry memory) {
        return gratitude[index];
    }
}
