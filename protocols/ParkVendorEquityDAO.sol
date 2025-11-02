// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ParkVendorEquityDAO {
    address public steward;

    struct VendorEntry {
        string parkName;
        string vendorType;
        string equityStatus;
        string emotionalTag;
    }

    VendorEntry[] public registry;

    event VendorTagged(string parkName, string vendorType, string equityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagVendor(
        string memory parkName,
        string memory vendorType,
        string memory equityStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(VendorEntry(parkName, vendorType, equityStatus, emotionalTag));
        emit VendorTagged(parkName, vendorType, equityStatus, emotionalTag);
    }
}
