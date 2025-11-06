// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHousingGrantIntentLedger {
    address public steward;

    struct GrantIntent {
        string barangayName;
        string contactPerson;
        string numberOfInterestedFamilies;
        string priorityLevel;
        string emotionalTag;
    }

    GrantIntent[] public ledger;

    event BarangayGrantIntentTagged(string barangayName, string contactPerson, string numberOfInterestedFamilies, string priorityLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagGrantIntent(
        string memory barangayName,
        string memory contactPerson,
        string memory numberOfInterestedFamilies,
        string memory priorityLevel,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(GrantIntent(barangayName, contactPerson, numberOfInterestedFamilies, priorityLevel, emotionalTag));
        emit BarangayGrantIntentTagged(barangayName, contactPerson, numberOfInterestedFamilies, priorityLevel, emotionalTag);
    }
}
