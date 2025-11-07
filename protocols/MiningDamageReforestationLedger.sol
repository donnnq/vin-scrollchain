// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiningDamageReforestationLedger {
    address public steward;

    struct ReforestationEntry {
        string siteID;
        string speciesPlanted;
        string timestamp;
        string soilRecoveryStatus;
        string communityInvolved;
        string emotionalTag;
    }

    ReforestationEntry[] public ledger;

    event ReforestationLogged(string siteID, string speciesPlanted, string timestamp, string soilRecoveryStatus, string communityInvolved, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logReforestation(
        string memory siteID,
        string memory speciesPlanted,
        string memory timestamp,
        string memory soilRecoveryStatus,
        string memory communityInvolved,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ReforestationEntry(siteID, speciesPlanted, timestamp, soilRecoveryStatus, communityInvolved, emotionalTag));
        emit ReforestationLogged(siteID, speciesPlanted, timestamp, soilRecoveryStatus, communityInvolved, emotionalTag);
    }
}
