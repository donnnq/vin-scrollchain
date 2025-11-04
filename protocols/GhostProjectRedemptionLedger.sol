// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectRedemptionLedger {
    address public steward;

    struct RedemptionEntry {
        string projectName;
        string redemptionSignal;
        string restorationMechanism;
        string emotionalTag;
    }

    RedemptionEntry[] public ledger;

    event GhostProjectRedeemed(string projectName, string redemptionSignal, string restorationMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function redeemProject(
        string memory projectName,
        string memory redemptionSignal,
        string memory restorationMechanism,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(RedemptionEntry(projectName, redemptionSignal, restorationMechanism, emotionalTag));
        emit GhostProjectRedeemed(projectName, redemptionSignal, restorationMechanism, emotionalTag);
    }
}
