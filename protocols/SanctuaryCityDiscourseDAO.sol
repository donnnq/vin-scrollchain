// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctuaryCityDiscourseDAO {
    address public steward;

    struct DiscourseEntry {
        string cityName;
        string discourseTrigger;
        string civicImpact;
        string emotionalTag;
    }

    DiscourseEntry[] public registry;

    event SanctuaryCityDiscourseTagged(string cityName, string discourseTrigger, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDiscourse(
        string memory cityName,
        string memory discourseTrigger,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DiscourseEntry(cityName, discourseTrigger, civicImpact, emotionalTag));
        emit SanctuaryCityDiscourseTagged(cityName, discourseTrigger, civicImpact, emotionalTag);
    }
}
