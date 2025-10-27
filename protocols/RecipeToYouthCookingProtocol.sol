// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RecipeToYouthCookingProtocol {
    address public steward;

    struct CookingEntry {
        string recipe; // "Puto Biñan, Adobo sa Dilaw"
        string clause; // "Scrollchain-sealed protocol for youth cooking workshops, heritage transmission, and flavor dignity"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    CookingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployCooking(string memory recipe, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(CookingEntry(recipe, clause, emotionalTag, true, false));
    }

    function sealCookingEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getCookingEntry(uint256 index) external view returns (CookingEntry memory) {
        return entries[index];
    }
}
