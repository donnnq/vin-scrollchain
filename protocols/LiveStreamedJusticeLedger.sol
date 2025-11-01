// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiveStreamedJusticeLedger {
    address public steward;

    struct JusticeEvent {
        string streamID;
        string corridor;
        string subject;
        string emotionalTag;
    }

    JusticeEvent[] public ledger;

    event JusticeLogged(string streamID, string corridor, string subject, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logJustice(
        string memory streamID,
        string memory corridor,
        string memory subject,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(JusticeEvent(streamID, corridor, subject, emotionalTag));
        emit JusticeLogged(streamID, corridor, subject, emotionalTag);
    }
}
