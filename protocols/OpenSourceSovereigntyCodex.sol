// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OpenSourceSovereigntyCodex {
    address public steward;

    struct SovereigntyClause {
        string projectName;
        string licensingModel;
        string sovereigntyProtocol;
        string emotionalTag;
    }

    SovereigntyClause[] public codex;

    event OpenSourceSovereigntyTagged(string projectName, string licensingModel, string sovereigntyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory projectName,
        string memory licensingModel,
        string memory sovereigntyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SovereigntyClause(projectName, licensingModel, sovereigntyProtocol, emotionalTag));
        emit OpenSourceSovereigntyTagged(projectName, licensingModel, sovereigntyProtocol, emotionalTag);
    }
}
