// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalLandUseTransparencyLedger {
    address public steward;

    struct LandUseEntry {
        string projectName;
        string landOwner;
        string alignmentProtocol;
        string zoningFriction;
        string emotionalTag;
    }

    LandUseEntry[] public ledger;

    event LandUseTransparencyTagged(string projectName, string landOwner, string alignmentProtocol, string zoningFriction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLandUse(
        string memory projectName,
        string memory landOwner,
        string memory alignmentProtocol,
        string memory zoningFriction,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(LandUseEntry(projectName, landOwner, alignmentProtocol, zoningFriction, emotionalTag));
        emit LandUseTransparencyTagged(projectName, landOwner, alignmentProtocol, zoningFriction, emotionalTag);
    }
}
