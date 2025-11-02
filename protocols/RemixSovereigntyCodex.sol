// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemixSovereigntyCodex {
    address public steward;

    struct SovereigntyClause {
        string remixTitle;
        string corridor;
        string sourceMaterial;
        string emotionalTag;
    }

    SovereigntyClause[] public codex;

    event RemixTagged(string remixTitle, string corridor, string sourceMaterial, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagRemix(
        string memory remixTitle,
        string memory corridor,
        string memory sourceMaterial,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SovereigntyClause(remixTitle, corridor, sourceMaterial, emotionalTag));
        emit RemixTagged(remixTitle, corridor, sourceMaterial, emotionalTag);
    }
}
