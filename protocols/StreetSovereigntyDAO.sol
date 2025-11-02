// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StreetSovereigntyDAO {
    address public steward;

    struct StreetEntry {
        string location;
        string transportType;
        string sovereigntyStatus;
        string emotionalTag;
    }

    StreetEntry[] public registry;

    event StreetTagged(string location, string transportType, string sovereigntyStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagStreet(
        string memory location,
        string memory transportType,
        string memory sovereigntyStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(StreetEntry(location, transportType, sovereigntyStatus, emotionalTag));
        emit StreetTagged(location, transportType, sovereigntyStatus, emotionalTag);
    }
}
