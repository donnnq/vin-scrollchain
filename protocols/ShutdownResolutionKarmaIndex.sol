// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShutdownResolutionKarmaIndex {
    address public steward;

    struct ShutdownEntry {
        string shutdownYear;
        string resolutionAction;
        string karmaProtocol;
        string emotionalTag;
    }

    ShutdownEntry[] public index;

    event ShutdownResolutionTagged(string shutdownYear, string resolutionAction, string karmaProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResolution(
        string memory shutdownYear,
        string memory resolutionAction,
        string memory karmaProtocol,
        string memory emotionalTag
    ) public onlySteard {
        index.push(ShutdownEntry(shutdownYear, resolutionAction, karmaProtocol, emotionalTag));
        emit ShutdownResolutionTagged(shutdownYear, resolutionAction, karmaProtocol, emotionalTag);
    }
}
