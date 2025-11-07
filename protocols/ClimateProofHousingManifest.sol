// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateProofHousingManifest {
    address public steward;

    struct HousingAudit {
        string location;
        string timestamp;
        string riskLevel;
        string retrofittingStatus;
        string emotionalTag;
    }

    HousingAudit[] public audits;

    event HousingAuditLogged(string location, string timestamp, string riskLevel, string retrofittingStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logAudit(
        string memory location,
        string memory timestamp,
        string memory riskLevel,
        string memory retrofittingStatus,
        string memory emotionalTag
    ) public onlySteward {
        audits.push(HousingAudit(location, timestamp, riskLevel, retrofittingStatus, emotionalTag));
        emit HousingAuditLogged(location, timestamp, riskLevel, retrofittingStatus, emotionalTag);
    }
}
