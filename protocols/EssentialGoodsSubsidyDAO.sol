// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EssentialGoodsSubsidyDAO {
    address public steward;

    struct SubsidyEntry {
        string barangay;
        string goodName;
        string subsidyProtocol;
        string emotionalTag;
    }

    SubsidyEntry[] public registry;

    event EssentialGoodsSubsidyTagged(string barangay, string goodName, string subsidyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSubsidy(
        string memory barangay,
        string memory goodName,
        string memory subsidyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SubsidyEntry(barangay, goodName, subsidyProtocol, emotionalTag));
        emit EssentialGoodsSubsidyTagged(barangay, goodName, subsidyProtocol, emotionalTag);
    }
}
