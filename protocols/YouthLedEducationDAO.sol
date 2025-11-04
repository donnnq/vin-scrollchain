// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthLedEducationDAO {
    address public steward;

    struct EducationEntry {
        string initiativeName;
        string youthSignal;
        string learningMechanism;
        string emotionalTag;
    }

    EducationEntry[] public registry;

    event YouthEducationTagged(string initiativeName, string youthSignal, string learningMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEducation(
        string memory initiativeName,
        string memory youthSignal,
        string memory learningMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EducationEntry(initiativeName, youthSignal, learningMechanism, emotionalTag));
        emit YouthEducationTagged(initiativeName, youthSignal, learningMechanism, emotionalTag);
    }
}
