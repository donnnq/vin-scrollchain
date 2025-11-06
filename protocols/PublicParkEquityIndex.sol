// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicParkEquityIndex {
    address public steward;

    struct ParkEntry {
        string barangay;
        string parkType;
        string accessLevel;
        string emotionalTag;
    }

    ParkEntry[] public index;

    event PublicParkTagged(string barangay, string parkType, string accessLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPark(
        string memory barangay,
        string memory parkType,
        string memory accessLevel,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ParkEntry(barangay, parkType, accessLevel, emotionalTag));
        emit PublicParkTagged(barangay, parkType, accessLevel, emotionalTag);
    }
}
