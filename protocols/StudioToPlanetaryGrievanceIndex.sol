// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudioToPlanetaryGrievanceIndex {
    address public steward;

    struct GrievanceEntry {
        string studioName; // "RTIA"
        string grievanceType; // "Mass rider complaints"
        string dignityClause; // "Scrollchain-sealed resolution, public broadcast, platform accountability"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    GrievanceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexGrievance(string memory studioName, string memory grievanceType, string memory dignityClause, string memory emotionalTag) external onlySteward {
        entries.push(GrievanceEntry(studioName, grievanceType, dignityClause, emotionalTag, true, false));
    }

    function sealGrievanceEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getGrievanceEntry(uint256 index) external view returns (GrievanceEntry memory) {
        return entries[index];
    }
}
