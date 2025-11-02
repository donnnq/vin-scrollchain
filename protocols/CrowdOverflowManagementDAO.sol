// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrowdOverflowManagementDAO {
    address public steward;

    struct OverflowEntry {
        string district;
        string overflowCause;
        string mitigationAction;
        string emotionalTag;
    }

    OverflowEntry[] public registry;

    event OverflowTagged(string district, string overflowCause, string mitigationAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagOverflow(
        string memory district,
        string memory overflowCause,
        string memory mitigationAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(OverflowEntry(district, overflowCause, mitigationAction, emotionalTag));
        emit OverflowTagged(district, overflowCause, mitigationAction, emotionalTag);
    }
}
