// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AncestralFermentationRegistryDAO {
    address public steward;

    struct FermentEntry {
        string recipeName;
        string originCulture;
        string probioticBenefit;
        string fermentationType; // "Wild", "Starter-Based", "Salt-Cured"
        string emotionalTag;
        uint256 timestamp;
    }

    FermentEntry[] public entries;

    event FermentLogged(
        string recipeName,
        string originCulture,
        string probioticBenefit,
        string fermentationType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log ancestral fermentation rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logFerment(
        string memory recipeName,
        string memory originCulture,
        string memory probioticBenefit,
        string memory fermentationType,
        string memory emotionalTag
    ) external onlySteward {
        entries.push(FermentEntry({
            recipeName: recipeName,
            originCulture: originCulture,
            probioticBenefit: probioticBenefit,
            fermentationType: fermentationType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit FermentLogged(recipeName, originCulture, probioticBenefit, fermentationType, emotionalTag, block.timestamp);
    }

    function getFermentByIndex(uint256 index) external view returns (
        string memory recipeName,
        string memory originCulture,
        string memory probioticBenefit,
        string memory fermentationType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < entries.length, "Scrollstorm index out of bounds");
        FermentEntry memory f = entries[index];
        return (
            f.recipeName,
            f.originCulture,
            f.probioticBenefit,
            f.fermentationType,
            f.emotionalTag,
            f.timestamp
        );
    }
}
