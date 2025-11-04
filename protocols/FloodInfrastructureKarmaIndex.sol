// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodInfrastructureKarmaIndex {
    address public steward;

    struct KarmaEntry {
        string projectName;
        string region;
        string karmaSignal;
        string emotionalTag;
    }

    KarmaEntry[] public index;

    event FloodKarmaIndexed(string projectName, string region, string karmaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexKarma(
        string memory projectName,
        string memory region,
        string memory karmaSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(KarmaEntry(projectName, region, karmaSignal, emotionalTag));
        emit FloodKarmaIndexed(projectName, region, karmaSignal, emotionalTag);
    }
}
