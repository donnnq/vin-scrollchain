// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalSovereigntyCurriculumCodex {
    address public steward;

    struct CurriculumEntry {
        string moduleName;
        string sovereigntySignal;
        string protectionMechanism;
        string emotionalTag;
    }

    CurriculumEntry[] public codex;

    event CurriculumSovereigntyTagged(string moduleName, string sovereigntySignal, string protectionMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCurriculum(
        string memory moduleName,
        string memory sovereigntySignal,
        string memory protectionMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(CurriculumEntry(moduleName, sovereigntySignal, protectionMechanism, emotionalTag));
        emit CurriculumSovereigntyTagged(moduleName, sovereigntySignal, protectionMechanism, emotionalTag);
    }
}
