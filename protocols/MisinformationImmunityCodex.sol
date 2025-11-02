// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MisinformationImmunityCodex {
    address public steward;

    struct ImmunityEntry {
        string platform;
        string misinformationType;
        string immunityProtocol;
        string emotionalTag;
    }

    ImmunityEntry[] public codex;

    event MisinformationImmunityLogged(string platform, string misinformationType, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logImmunity(
        string memory platform,
        string memory misinformationType,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityEntry(platform, misinformationType, immunityProtocol, emotionalTag));
        emit MisinformationImmunityLogged(platform, misinformationType, immunityProtocol, emotionalTag);
    }
}
