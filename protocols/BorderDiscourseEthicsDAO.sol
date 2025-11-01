// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BorderDiscourseEthicsDAO {
    address public steward;

    struct DiscourseEntry {
        string corridor;
        string discourseType;
        string emotionalTag;
        string auditLevel;
    }

    DiscourseEntry[] public registry;

    event DiscourseTagged(string corridor, string discourseType, string emotionalTag, string auditLevel);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagDiscourse(
        string memory corridor,
        string memory discourseType,
        string memory emotionalTag,
        string memory auditLevel
    ) public onlySteward {
        registry.push(DiscourseEntry(corridor, discourseType, emotionalTag, auditLevel));
        emit DiscourseTagged(corridor, discourseType, emotionalTag, auditLevel);
    }
}
