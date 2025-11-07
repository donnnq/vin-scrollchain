// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerAccommodationEquityManifest {
    address public steward;

    struct AccommodationEntry {
        string companyName;
        string timestamp;
        string location;
        string barracksStatus;
        string emotionalTag;
    }

    AccommodationEntry[] public manifest;

    event AccommodationDeclared(string companyName, string timestamp, string location, string barracksStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function declareAccommodation(
        string memory companyName,
        string memory timestamp,
        string memory location,
        string memory barracksStatus,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(AccommodationEntry(companyName, timestamp, location, barracksStatus, emotionalTag));
        emit AccommodationDeclared(companyName, timestamp, location, barracksStatus, emotionalTag);
    }
}
