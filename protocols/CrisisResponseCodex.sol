// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrisisResponseCodex {
    address public steward;

    struct ResponseEntry {
        string crisisType;
        string responseDelay;
        string reformAction;
        string emotionalTag;
    }

    ResponseEntry[] public codex;

    event CrisisResponseLogged(string crisisType, string responseDelay, string reformAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logResponse(
        string memory crisisType,
        string memory responseDelay,
        string memory reformAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ResponseEntry(crisisType, responseDelay, reformAction, emotionalTag));
        emit CrisisResponseLogged(crisisType, responseDelay, reformAction, emotionalTag);
    }
}
