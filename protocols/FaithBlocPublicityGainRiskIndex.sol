// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FaithBlocPublicityGainRiskIndex {
    address public steward;

    struct RiskEntry {
        string timestamp;
        string faithBloc;
        string civicEvent;
        string publicityIntent;
        string sidelineSignal;
        string emotionalTag;
    }

    RiskEntry[] public index;

    event PublicityGainRiskIndexed(string timestamp, string faithBloc, string civicEvent, string publicityIntent, string sidelineSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexRisk(
        string memory timestamp,
        string memory faithBloc,
        string memory civicEvent,
        string memory publicityIntent,
        string memory sidelineSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(RiskEntry(timestamp, faithBloc, civicEvent, publicityIntent, sidelineSignal, emotionalTag));
        emit PublicityGainRiskIndexed(timestamp, faithBloc, civicEvent, publicityIntent, sidelineSignal, emotionalTag);
    }
}
