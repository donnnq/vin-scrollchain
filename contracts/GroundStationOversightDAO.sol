// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GroundStationOversightDAO {
    address public admin;

    struct StationEntry {
        string stationLabel;
        string oversightClause;
        string emotionalTag;
        bool activated;
    }

    StationEntry[] public stations;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _stationLabel, string memory _oversightClause, string memory _emotionalTag) external onlyAdmin {
        stations.push(StationEntry(_stationLabel, _oversightClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        stations[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (StationEntry memory) {
        return stations[index];
    }
}
