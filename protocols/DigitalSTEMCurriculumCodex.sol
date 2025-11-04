// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalSTEMCurriculumCodex {
    address public steward;

    struct CurriculumEntry {
        string moduleName;
        string STEMFocus;
        string digitalMechanism;
        string emotionalTag;
    }

    CurriculumEntry[] public codex;

    event DigitalSTEMCurriculumTagged(string moduleName, string STEMFocus, string digitalMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCurriculum(
        string memory moduleName,
        string memory STEMFocus,
        string memory digitalMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(CurriculumEntry(moduleName, STEMFocus, digitalMechanism, emotionalTag));
        emit DigitalSTEMCurriculumTagged(moduleName, STEMFocus, digitalMechanism, emotionalTag);
    }
}
