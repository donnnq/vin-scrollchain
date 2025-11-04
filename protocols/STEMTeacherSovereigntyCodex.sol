// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract STEMTeacherSovereigntyCodex {
    address public steward;

    struct SovereigntyEntry {
        string region;
        string STEMDomain;
        string empowermentMechanism;
        string emotionalTag;
    }

    SovereigntyEntry[] public codex;

    event STEMTeacherSovereigntyTagged(string region, string STEMDomain, string empowermentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory region,
        string memory STEMDomain,
        string memory empowermentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SovereigntyEntry(region, STEMDomain, empowermentMechanism, emotionalTag));
        emit STEMTeacherSovereigntyTagged(region, STEMDomain, empowermentMechanism, emotionalTag);
    }
}
