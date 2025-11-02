// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorporateLayoffDisclosureDAO {
    address public steward;

    struct LayoffDisclosure {
        string companyName;
        uint256 numberOfWorkers;
        string reason;
        string emotionalTag;
    }

    LayoffDisclosure[] public registry;

    event LayoffDisclosed(string companyName, uint256 numberOfWorkers, string reason, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function discloseLayoff(
        string memory companyName,
        uint256 numberOfWorkers,
        string memory reason,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LayoffDisclosure(companyName, numberOfWorkers, reason, emotionalTag));
        emit LayoffDisclosed(companyName, numberOfWorkers, reason, emotionalTag);
    }
}
