// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthStewardshipYouthDAO {
    address public steward;

    struct StewardEntry {
        string name;
        string schoolOrBarangay;
        string timestamp;
        string truthProject;
        string emotionalTag;
    }

    StewardEntry[] public registry;

    event YouthTruthStewardLogged(string name, string schoolOrBarangay, string timestamp, string truthProject, string emotionalTag);

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
        string memory truthProject,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(St
ewardEntry(name, schoolOrBarangay, timestamp, truthProject, emotionalTag));
        emit YouthTruthStewardLogged(name, schoolOrBarangay, timestamp, truthProject, emotionalTag);
    }
}
