// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PriceJusticeBroadcastTreaty {
    address public steward;

    struct BroadcastClause {
        string barangay;
        string commodity;
        string justiceSignal;
        string emotionalTag;
    }

    BroadcastClause[] public treatyLog;

    event PriceJusticeBroadcasted(string barangay, string commodity, string justiceSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastJustice(
        string memory barangay,
        string memory commodity,
        string memory justiceSignal,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(BroadcastClause(barangay, commodity, justiceSignal, emotionalTag));
        emit PriceJusticeBroadcasted(barangay, commodity, justiceSignal, emotionalTag);
    }
}
