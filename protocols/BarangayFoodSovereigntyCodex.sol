// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFoodSovereigntyCodex {
    address public steward;

    struct SovereigntyClause {
        string barangay;
        string foodType;
        string sovereigntyProtocol;
        string emotionalTag;
    }

    SovereigntyClause[] public codex;

    event FoodSovereigntyTagged(string barangay, string foodType, string sovereigntyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory barangay,
        string memory foodType,
        string memory sovereigntyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SovereigntyClause(barangay, foodType, sovereigntyProtocol, emotionalTag));
        emit FoodSovereigntyTagged(barangay, foodType, sovereigntyProtocol, emotionalTag);
    }
}
