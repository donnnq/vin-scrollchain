// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealthcareRhetoricToPolicyDisruptionGrid {
    address public steward;

    struct RhetoricEntry {
        string statement; // "Get rid of Obamacare", "Paying for illegal immigrants"
        string disruptionType; // "Defunding", "Deflection", "Polarization"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    RhetoricEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexRhetoric(string memory statement, string memory disruptionType, string memory emotionalTag) external onlySteward {
        entries.push(RhetoricEntry(statement, disruptionType, emotionalTag, true, false));
    }

    function sealRhetoricEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getRhetoricEntry(uint256 index) external view returns (RhetoricEntry memory) {
        return entries[index];
    }
}
