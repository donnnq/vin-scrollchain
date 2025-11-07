// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoProtocolLegacyPreservationDAO {
    address public steward;

    struct LegacyEntry {
        string protocolName;
        string timestamp;
        string legacyFeature;
        string preservationMethod;
        string emotionalTag;
    }

    LegacyEntry[] public registry;

    event LegacyPreserved(string protocolName, string timestamp, string legacyFeature, string preservationMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function preserveLegacy(
        string memory protocolName,
        string memory timestamp,
        string memory legacyFeature,
        string memory preservationMethod,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LegacyEntry(protocolName, timestamp, legacyFeature, preservationMethod, emotionalTag));
        emit LegacyPreserved(protocolName, timestamp, legacyFeature, preservationMethod, emotionalTag);
    }
}
