// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayVendorDignityCodex {
    address public steward;

    struct DignityClause {
        string vendorName;
        string marketLocation;
        string dignityProtocol;
        string emotionalTag;
    }

    DignityClause[] public codex;

    event VendorDignityTagged(string vendorName, string marketLocation, string dignityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDignity(
        string memory vendorName,
        string memory marketLocation,
        string memory dignityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DignityClause(vendorName, marketLocation, dignityProtocol, emotionalTag));
        emit VendorDignityTagged(vendorName, marketLocation, dignityProtocol, emotionalTag);
    }
}
