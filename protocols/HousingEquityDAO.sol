// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HousingEquityDAO {
    address public steward;

    struct HousingEntry {
        string purok;
        string residentName;
        string housingType;
        bool dignityCertified;
    }

    HousingEntry[] public registry;

    event HousingTagged(string purok, string residentName, string housingType);
    event EvictionKarmaTriggered(string purok, string reason);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagHousing(
        string memory purok,
        string memory residentName,
        string memory housingType,
        bool dignityCertified
    ) public onlySteward {
        registry.push(HousingEntry(purok, residentName, housingType, dignityCertified));
        emit HousingTagged(purok, residentName, housingType);
    }

    function triggerEvictionKarma(string memory purok, string memory reason) public onlySteward {
        emit EvictionKarmaTriggered(purok, reason);
    }
}
