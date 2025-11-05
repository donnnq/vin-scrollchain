// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LaborJusticeBroadcastDAO {
    address public steward;

    struct JusticeEntry {
        string companyName;
        string treatmentSignal;
        string equityScore;
        string emotionalTag;
    }

    JusticeEntry[] public registry;

    event LaborJusticeBroadcasted(string companyName, string treatmentSignal, string equityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastJustice(
        string memory companyName,
        string memory treatmentSignal,
        string memory equityScore,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(JusticeEntry(companyName, treatmentSignal, equityScore, emotionalTag));
        emit LaborJusticeBroadcasted(companyName, treatmentSignal, equityScore, emotionalTag);
    }
}
