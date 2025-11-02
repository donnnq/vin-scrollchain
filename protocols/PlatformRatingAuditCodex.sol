// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlatformRatingAuditCodex {
    address public steward;

    struct RatingClause {
        string platformName;
        string ratingSystem;
        string auditVerdict;
        string emotionalTag;
    }

    RatingClause[] public codex;

    event RatingAuditLogged(string platformName, string ratingSystem, string auditVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRatingAudit(
        string memory platformName,
        string memory ratingSystem,
        string memory auditVerdict,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RatingClause(platformName, ratingSystem, auditVerdict, emotionalTag));
        emit RatingAuditLogged(platformName, ratingSystem, auditVerdict, emotionalTag);
    }
}
