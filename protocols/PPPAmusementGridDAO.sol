// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PPPAmusementGridDAO {
    address public steward;

    struct AmusementEntry {
        string city;
        string attractionType;
        string PPPPartner;
        string emotionalTag;
    }

    AmusementEntry[] public registry;

    event AmusementDeployed(string city, string attractionType, string PPPPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function deployAmusement(
        string memory city,
        string memory attractionType,
        string memory PPPPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AmusementEntry(city, attractionType, PPPPartner, emotionalTag));
        emit AmusementDeployed(city, attractionType, PPPPartner, emotionalTag);
    }
}
