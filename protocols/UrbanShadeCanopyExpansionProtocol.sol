// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanShadeCanopyExpansionProtocol {
    address public steward;

    struct ExpansionEntry {
        string timestamp;
        string location;
        string treeSpecies;
        string canopyCoverageEstimate;
        string heatMitigationSignal;
        string emotionalTag;
    }

    ExpansionEntry[] public protocol;

    event ShadeCanopyExpanded(string timestamp, string location, string treeSpecies, string canopyCoverageEstimate, string heatMitigationSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function expandCanopy(
        string memory timestamp,
        string memory location,
        string memory treeSpecies,
        string memory canopyCoverageEstimate,
        string memory heatMitigationSignal,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ExpansionEntry(timestamp, location, treeSpecies, canopyCoverageEstimate, heatMitigationSignal, emotionalTag));
        emit ShadeCanopyExpanded(timestamp, location, treeSpecies, canopyCoverageEstimate, heatMitigationSignal, emotionalTag);
    }
}
