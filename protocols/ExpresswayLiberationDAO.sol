// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpresswayLiberationDAO {
    address public steward;

    struct LiberationEntry {
        string expresswayName;
        string concessionaire;
        string liberationProposal;
        string emotionalTag;
    }

    LiberationEntry[] public registry;

    event ExpresswayLiberationTagged(string expresswayName, string concessionaire, string liberationProposal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLiberation(
        string memory expresswayName,
        string memory concessionaire,
        string memory liberationProposal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LiberationEntry(expresswayName, concessionaire, liberationProposal, emotionalTag));
        emit ExpresswayLiberationTagged(expresswayName, concessionaire, liberationProposal, emotionalTag);
    }
}
