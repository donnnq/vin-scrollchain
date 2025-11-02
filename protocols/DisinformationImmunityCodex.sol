// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisinformationImmunityCodex {
    address public steward;

    struct ImmunityEntry {
        string platform;
        string disinformationType;
        string immunityProtocol;
        string emotionalTag;
    }

    ImmunityEntry[] public codex;

    event DisinformationImmunityLogged(string platform, string disinformationType, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logImmunity(
        string memory platform,
        string memory disinformationType,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityEntry(platform, disinformationType, immunityProtocol, emotionalTag));
        emit DisinformationImmunityLogged(platform, disinformationType, immunityProtocol, emotionalTag);
    }
}
