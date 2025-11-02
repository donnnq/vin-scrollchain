// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicSpaceRestorationCodex {
    address public steward;

    struct RestorationClause {
        string spaceName;
        string restorationAction;
        string civicOutcome;
        string emotionalTag;
    }

    RestorationClause[] public codex;

    event SpaceRestored(string spaceName, string restorationAction, string civicOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function restoreSpace(
        string memory spaceName,
        string memory restorationAction,
        string memory civicOutcome,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RestorationClause(spaceName, restorationAction, civicOutcome, emotionalTag));
        emit SpaceRestored(spaceName, restorationAction, civicOutcome, emotionalTag);
    }
}
