// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanSlopeProtectionDAO {
    address public steward;

    struct ProtectionEntry {
        string slopeLocation;
        string integrityProtocol;
        string civicSignal;
        string emotionalTag;
    }

    ProtectionEntry[] public registry;

    event SlopeProtectionBroadcasted(string slopeLocation, string integrityProtocol, string civicSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastProtection(
        string memory slopeLocation,
        string memory integrityProtocol,
        string memory civicSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ProtectionEntry(slopeLocation, integrityProtocol, civicSignal, emotionalTag));
        emit SlopeProtectionBroadcasted(slopeLocation, integrityProtocol, civicSignal, emotionalTag);
    }
}
