// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostServiceMentalHealthDAO {
    address public steward;

    struct WellnessEntry {
        string veteranName;
        string supportType;
        string healingProtocol;
        string emotionalTag;
    }

    WellnessEntry[] public registry;

    event MentalHealthSupportTagged(string veteranName, string supportType, string healingProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSupport(
        string memory veteranName,
        string memory supportType,
        string memory healingProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(WellnessEntry(veteranName, supportType, healingProtocol, emotionalTag));
        emit MentalHealthSupportTagged(veteranName, supportType, healingProtocol, emotionalTag);
    }
}
