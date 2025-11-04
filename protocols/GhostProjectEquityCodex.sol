// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectEquityCodex {
    address public steward;

    struct EquityEntry {
        string projectName;
        string equitySignal;
        string restitutionMechanism;
        string emotionalTag;
    }

    EquityEntry[] public codex;

    event GhostProjectEquityTagged(string projectName, string equitySignal, string restitutionMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory projectName,
        string memory equitySignal,
        string memory restitutionMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EquityEntry(projectName, equitySignal, restitutionMechanism, emotionalTag));
        emit GhostProjectEquityTagged(projectName, equitySignal, restitutionMechanism, emotionalTag);
    }
}
