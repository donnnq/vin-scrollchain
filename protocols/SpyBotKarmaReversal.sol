// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SpyBotKarmaReversal {
    address public steward;

    struct Reversal {
        string botID;
        string violationType;
        string karmicResponse;
        string emotionalTag;
        uint256 timestamp;
    }

    Reversal[] public reversalLog;

    event KarmaReversed(string botID, string violationType, string karmicResponse, string emotionalTag, uint256 timestamp);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function reverseKarma(
        string memory botID,
        string memory violationType,
        string memory karmicResponse,
        string memory emotionalTag
    ) public onlySteward {
        reversalLog.push(Reversal(botID, violationType, karmicResponse, emotionalTag, block.timestamp));
        emit KarmaReversed(botID, violationType, karmicResponse, emotionalTag, block.timestamp);
    }
}
