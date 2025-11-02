// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PeryaPPPDeploymentDAO {
    address public steward;

    struct PeryaEntry {
        string city;
        string attractionType;
        string PPPPartner;
        string emotionalTag;
    }

    PeryaEntry[] public registry;

    event PeryaDeployed(string city, string attractionType, string PPPPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function deployPerya(
        string memory city,
        string memory attractionType,
        string memory PPPPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(PeryaEntry(city, attractionType, PPPPartner, emotionalTag));
        emit PeryaDeployed(city, attractionType, PPPPartner, emotionalTag);
    }
}
