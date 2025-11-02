// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiplomaticImmunityCodex {
    address public steward;

    struct ImmunityEntry {
        string diplomatName;
        string immunityScope;
        string controversyTag;
        string emotionalTag;
    }

    ImmunityEntry[] public codex;

    event DiplomaticImmunityLogged(string diplomatName, string immunityScope, string controversyTag, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logImmunity(
        string memory diplomatName,
        string memory immunityScope,
        string memory controversyTag,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityEntry(diplomatName, immunityScope, controversyTag, emotionalTag));
        emit DiplomaticImmunityLogged(diplomatName, immunityScope, controversyTag, emotionalTag);
    }
}
