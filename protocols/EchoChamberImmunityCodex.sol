// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EchoChamberImmunityCodex {
    address public steward;

    struct EchoEntry {
        string platform;
        string ideologicalLoop;
        string immunityProtocol;
        string emotionalTag;
    }

    EchoEntry[] public codex;

    event EchoChamberLogged(string platform, string ideologicalLoop, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logEcho(
        string memory platform,
        string memory ideologicalLoop,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EchoEntry(platform, ideologicalLoop, immunityProtocol, emotionalTag));
        emit EchoChamberLogged(platform, ideologicalLoop, immunityProtocol, emotionalTag);
    }
}
