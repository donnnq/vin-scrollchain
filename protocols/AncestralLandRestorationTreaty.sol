// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralLandRestorationTreaty {
    address public steward;

    struct RestorationEntry {
        string community;
        string timestamp;
        string biodiversityProtocol;
        string restorationStatus;
        string emotionalTag;
    }

    RestorationEntry[] public treaty;

    event LandRestored(string community, string timestamp, string biodiversityProtocol, string restorationStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function restoreLand(
        string memory community,
        string memory timestamp,
        string memory biodiversityProtocol,
        string memory restorationStatus,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(RestorationEntry(community, timestamp, biodiversityProtocol, restorationStatus, emotionalTag));
        emit LandRestored(community, timestamp, biodiversityProtocol, restorationStatus, emotionalTag);
    }
}
