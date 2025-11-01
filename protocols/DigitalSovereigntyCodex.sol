// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalSovereigntyCodex {
    address public steward;

    struct SovereigntyClause {
        string deviceID;
        string corridor;
        string protectionLevel;
        string emotionalTag;
    }

    SovereigntyClause[] public codex;

    event SovereigntyGranted(string deviceID, string corridor, string protectionLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function grantSovereignty(
        string memory deviceID,
        string memory corridor,
        string memory protectionLevel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SovereigntyClause(deviceID, corridor, protectionLevel, emotionalTag));
        emit SovereigntyGranted(deviceID, corridor, protectionLevel, emotionalTag);
    }
}
