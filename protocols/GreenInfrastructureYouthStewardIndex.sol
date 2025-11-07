// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GreenInfrastructureYouthStewardIndex {
    address public steward;

    struct StewardEntry {
        string name;
        string schoolOrBarangay;
        string timestamp;
        string greenProject;
        string emotionalTag;
    }

    StewardEntry[] public index;

    event YouthStewardLogged(string name, string schoolOrBarangay, string timestamp, string greenProject, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSteward(
        string memory name,
        string memory schoolOrBarangay,
        string memory timestamp,
        string memory greenProject,
        string memory emotionalTag
    ) public onlySteard {
        index.push(StewardEntry(name, schoolOrBarangay, timestamp, greenProject, emotionalTag));
        emit YouthStewardLogged(name, schoolOrBarangay, timestamp, greenProject, emotionalTag);
    }
}
