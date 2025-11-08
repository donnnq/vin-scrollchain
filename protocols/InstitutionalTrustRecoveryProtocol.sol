// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InstitutionalTrustRecoveryProtocol {
    address public steward;

    struct RecoveryEntry {
        string timestamp;
        string institutionName;
        string recoveryAction;
        string trustScoreBoost;
        string emotionalTag;
    }

    RecoveryEntry[] public protocol;

    event TrustRecoveryLogged(string timestamp, string institutionName, string recoveryAction, string trustScoreBoost, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRecovery(
        string memory timestamp,
        string memory institutionName,
        string memory recoveryAction,
        string memory trustScoreBoost,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(RecoveryEntry(timestamp, institutionName, recoveryAction, trustScoreBoost, emotionalTag));
        emit TrustRecoveryLogged(timestamp, institutionName, recoveryAction, trustScoreBoost, emotionalTag);
    }
}
