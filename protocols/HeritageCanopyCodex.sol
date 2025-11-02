// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageCanopyCodex {
    address public steward;

    struct CanopyDesign {
        string designName;
        string culturalOrigin;
        string climateAdaptation;
        string emotionalTag;
    }

    CanopyDesign[] public codex;

    event HeritageCanopyLogged(string designName, string culturalOrigin, string climateAdaptation, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logCanopyDesign(
        string memory designName,
        string memory culturalOrigin,
        string memory climateAdaptation,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(CanopyDesign(designName, culturalOrigin, climateAdaptation, emotionalTag));
        emit HeritageCanopyLogged(designName, culturalOrigin, climateAdaptation, emotionalTag);
    }
}
