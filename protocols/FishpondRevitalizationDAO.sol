// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FishpondRevitalizationDAO {
    address public steward;

    struct FishpondEntry {
        string location;
        string operationalStatus;
        string handler;
        string emotionalTag;
    }

    FishpondEntry[] public registry;

    event FishpondTagged(string location, string operationalStatus, string handler, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFishpond(
        string memory location,
        string memory operationalStatus,
        string memory handler,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FishpondEntry(location, operationalStatus, handler, emotionalTag));
        emit FishpondTagged(location, operationalStatus, handler, emotionalTag);
    }
}
