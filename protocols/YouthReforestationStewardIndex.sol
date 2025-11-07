// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthReforestationStewardIndex {
    address public steward;

    struct StewardEntry {
        string name;
        string schoolOrBarangay;
        string timestamp;
        string actionTaken;
        string emotionalTag;
    }

    StewardEntry[] public index;

    event StewardLogged(string name, string schoolOrBarangay, string timestamp, string actionTaken, string emotionalTag);

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
        string memory actionTaken,
        string memory emotionalTag
    ) public onlySteward {
        index.push(StewardEntry(name, schoolOrBarangay, timestamp, actionTaken, emotionalTag));
        emit StewardLogged(name, schoolOrBarangay, timestamp, actionTaken, emotionalTag);
    }
}
