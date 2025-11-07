// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DrugPriceReformBroadcastManifest {
    address public steward;

    struct ReformEntry {
        string reformTitle;
        string timestamp;
        string affectedDrugs;
        string accessImpact;
        string emotionalTag;
    }

    ReformEntry[] public manifest;

    event DrugPriceReformBroadcasted(string reformTitle, string timestamp, string affectedDrugs, string accessImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastReform(
        string memory reformTitle,
        string memory timestamp,
        string memory affectedDrugs,
        string memory accessImpact,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(ReformEntry(reformTitle, timestamp, affectedDrugs, accessImpact, emotionalTag));
        emit DrugPriceReformBroadcasted(reformTitle, timestamp, affectedDrugs, accessImpact, emotionalTag);
    }
}
