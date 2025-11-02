// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalBillboardSovereigntyDAO {
    address public steward;

    struct BillboardEntry {
        string location;
        string contentType;
        string sovereigntyStatus;
        string emotionalTag;
    }

    BillboardEntry[] public registry;

    event BillboardTagged(string location, string contentType, string sovereigntyStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagBillboard(
        string memory location,
        string memory contentType,
        string memory sovereigntyStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BillboardEntry(location, contentType, sovereigntyStatus, emotionalTag));
        emit BillboardTagged(location, contentType, sovereigntyStatus, emotionalTag);
    }
}
