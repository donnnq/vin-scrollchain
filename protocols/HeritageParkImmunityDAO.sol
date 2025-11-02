// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageParkImmunityDAO {
    address public steward;

    struct ParkEntry {
        string parkName;
        string heritageElement;
        string immunityStatus;
        string emotionalTag;
    }

    ParkEntry[] public registry;

    event ParkProtected(string parkName, string heritageElement, string immunityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function protectPark(
        string memory parkName,
        string memory heritageElement,
        string memory immunityStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ParkEntry(parkName, heritageElement, immunityStatus, emotionalTag));
        emit ParkProtected(parkName, heritageElement, immunityStatus, emotionalTag);
    }
}
