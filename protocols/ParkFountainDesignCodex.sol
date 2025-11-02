// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ParkFountainDesignCodex {
    address public steward;

    struct FountainClause {
        string parkName;
        string fountainStyle;
        string waterFeatureType;
        string emotionalTag;
    }

    FountainClause[] public codex;

    event FountainDesigned(string parkName, string fountainStyle, string waterFeatureType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function designFountain(
        string memory parkName,
        string memory fountainStyle,
        string memory waterFeatureType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(FountainClause(parkName, fountainStyle, waterFeatureType, emotionalTag));
        emit FountainDesigned(parkName, fountainStyle, waterFeatureType, emotionalTag);
    }
}
