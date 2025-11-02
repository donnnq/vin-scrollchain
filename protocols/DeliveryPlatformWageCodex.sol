// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeliveryPlatformWageCodex {
    address public steward;

    struct WageClause {
        string platformName;
        string wagePolicy;
        string auditStatus;
        string emotionalTag;
    }

    WageClause[] public codex;

    event WagePolicyLogged(string platformName, string wagePolicy, string auditStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logWagePolicy(
        string memory platformName,
        string memory wagePolicy,
        string memory auditStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(WageClause(platformName, wagePolicy, auditStatus, emotionalTag));
        emit WagePolicyLogged(platformName, wagePolicy, auditStatus, emotionalTag);
    }
}
