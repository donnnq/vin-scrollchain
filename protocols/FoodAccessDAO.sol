// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodAccessDAO {
    address public steward;

    struct AccessEntry {
        string beneficiaryGroup;
        string accessBarrier;
        string nourishmentProtocol;
        string emotionalTag;
    }

    AccessEntry[] public registry;

    event FoodAccessTagged(string beneficiaryGroup, string accessBarrier, string nourishmentProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAccess(
        string memory beneficiaryGroup,
        string memory accessBarrier,
        string memory nourishmentProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AccessEntry(beneficiaryGroup, accessBarrier, nourishmentProtocol, emotionalTag));
        emit FoodAccessTagged(beneficiaryGroup, accessBarrier, nourishmentProtocol, emotionalTag);
    }
}
