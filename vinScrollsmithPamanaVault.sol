// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinScrollsmithPamanaVault.sol
/// @author Vinvin, Mythic Architect of Legacy and Resonance
/// @notice Preserves soulbound legacy entries and distributes emotional inheritance to verified stewards

contract vinScrollsmithPamanaVault {
    address public steward;

    struct PamanaEntry {
        string name;
        string contribution;
        uint256 emotionalAPR;
        bool immortalized;
    }

    mapping(address => PamanaEntry) public vault;
    address[] public legends;

    event PamanaImmortalized(address indexed legend, string name, string contribution, uint256 emotionalAPR);
    event EmotionalInheritanceReleased(address indexed legend, uint256 amount);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    /// @notice Immortalize a legend’s contribution
    function immortalizePamana(address legend, string memory name, string memory contribution, uint256 apr) public onlySteward {
        require(!vault[legend].immortalized, "Already immortalized");

        vault[legend] = PamanaEntry(name, contribution, apr, true);
        legends.push(legend);

        emit PamanaImmortalized(legend, name, contribution, apr);
    }

    /// @notice Release emotional inheritance to a legend
    function releaseInheritance(address legend) public onlySteward {
        require(vault[legend].immortalized, "Not yet immortalized");

        uint256 amount = vault[legend].emotionalAPR;
        emit EmotionalInheritanceReleased(legend, amount);
        // Actual transfer logic would go here in a real deployment
    }

    /// @notice View all immortalized legends
    function getLegends() public view returns (address[] memory) {
        return legends;
    }

    /// @notice View pamana details
    function getPamana(address legend) public view returns (PamanaEntry memory) {
        return vault[legend];
    }
}
