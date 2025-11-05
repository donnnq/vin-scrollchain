// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WrongfulArrestForensicsDAO {
    address public steward;

    struct ForensicEntry {
        string citizenName;
        string arrestContext;
        string forensicProtocol;
        string emotionalTag;
    }

    ForensicEntry[] public registry;

    event WrongfulArrestTagged(string citizenName, string arrestContext, string forensicProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagArrest(
        string memory citizenName,
        string memory arrestContext,
        string memory forensicProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ForensicEntry(citizenName, arrestContext, forensicProtocol, emotionalTag));
        emit WrongfulArrestTagged(citizenName, arrestContext, forensicProtocol, emotionalTag);
    }
}
