// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DOTrPublicConductAuditProtocol {
    address public steward;

    struct ConductEntry {
        string officialName;
        string inspectionSite;
        string conductType;
        string emotionalTag;
    }

    ConductEntry[] public protocol;

    event DOTrConductTagged(string officialName, string inspectionSite, string conductType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagConduct(
        string memory officialName,
        string memory inspectionSite,
        string memory conductType,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ConductEntry(officialName, inspectionSite, conductType, emotionalTag));
        emit DOTrConductTagged(officialName, inspectionSite, conductType, emotionalTag);
    }
}
