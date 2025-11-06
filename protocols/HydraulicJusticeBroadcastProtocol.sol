// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HydraulicJusticeBroadcastProtocol {
    address public steward;

    struct JusticeEntry {
        string region;
        string waterInequity;
        string justiceProposal;
        string emotionalTag;
    }

    JusticeEntry[] public registry;

    event HydraulicJusticeBroadcasted(string region, string waterInequity, string justiceProposal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastJustice(
        string memory region,
        string memory waterInequity,
        string memory justiceProposal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(JusticeEntry(region, waterInequity, justiceProposal, emotionalTag));
        emit HydraulicJusticeBroadcasted(region, waterInequity, justiceProposal, emotionalTag);
    }
}
