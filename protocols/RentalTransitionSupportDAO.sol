// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RentalTransitionSupportDAO {
    address public steward;

    struct SupportEntry {
        string familyName;
        string rentalStage;
        string supportProtocol;
        string emotionalTag;
    }

    SupportEntry[] public registry;

    event RentalSupportTagged(string familyName, string rentalStage, string supportProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSupport(
        string memory familyName,
        string memory rentalStage,
        string memory supportProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SupportEntry(familyName, rentalStage, supportProtocol, emotionalTag));
        emit RentalSupportTagged(familyName, rentalStage, supportProtocol, emotionalTag);
    }
}
