// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MailInVotingImmunityCodex {
    address public steward;

    struct ImmunityEntry {
        string state;
        string mailInProtocol;
        string fraudConcern;
        string emotionalTag;
    }

    ImmunityEntry[] public codex;

    event MailInVotingLogged(string state, string mailInProtocol, string fraudConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logMailIn(
        string memory state,
        string memory mailInProtocol,
        string memory fraudConcern,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityEntry(state, mailInProtocol, fraudConcern, emotionalTag));
        emit MailInVotingLogged(state, mailInProtocol, fraudConcern, emotionalTag);
    }
}
