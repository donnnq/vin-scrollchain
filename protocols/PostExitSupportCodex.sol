// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostExitSupportCodex {
    address public steward;

    struct SupportClause {
        string workerName;
        string supportType;
        string recoveryStatus;
        string emotionalTag;
    }

    SupportClause[] public codex;

    event PostExitSupportLogged(string workerName, string supportType, string recoveryStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logPostExitSupport(
        string memory workerName,
        string memory supportType,
        string memory recoveryStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SupportClause(workerName, supportType, recoveryStatus, emotionalTag));
        emit PostExitSupportLogged(workerName, supportType, recoveryStatus, emotionalTag);
    }
}
