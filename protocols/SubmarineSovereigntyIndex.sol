// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubmarineSovereigntyIndex {
    address public steward;

    struct SovereigntyEntry {
        string vesselID;
        string nation;
        string depthZone;
        string timestamp;
        string emotionalTag;
    }

    SovereigntyEntry[] public index;

    event SovereigntyLogged(string vesselID, string nation, string depthZone, string timestamp, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSovereignty(
        string memory vesselID,
        string memory nation,
        string memory depthZone,
        string memory timestamp,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SovereigntyEntry(vesselID, nation, depthZone, timestamp, emotionalTag));
        emit SovereigntyLogged(vesselID, nation, depthZone, timestamp, emotionalTag);
    }
}
