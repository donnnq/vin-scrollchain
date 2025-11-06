// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanMobilityJusticeBroadcast {
    address public steward;

    struct JusticeEntry {
        string region;
        string mobilityBarrier;
        string justiceProposal;
        string emotionalTag;
    }

    JusticeEntry[] public registry;

    event MobilityJusticeBroadcasted(string region, string mobilityBarrier, string justiceProposal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastJustice(
        string memory region,
        string memory mobilityBarrier,
        string memory justiceProposal,
        string memory emotionalTag
    ) public onlySteard {
        registry.push(JusticeEntry(region, mobilityBarrier, justiceProposal, emotionalTag));
        emit MobilityJusticeBroadcasted(region, mobilityBarrier, justiceProposal, emotionalTag);
    }
}
