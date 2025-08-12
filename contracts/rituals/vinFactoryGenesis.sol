// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinFactoryGenesis - ScrollContract for building chipset and EV factories in the Philippines
/// @author Vinvin
/// @notice This contract initiates civic-grade industrial sanctums for national restoration
/// @dev Deployable on Scrollchain or used as symbolic artifact for public-private partnerships

contract vinFactoryGenesis {
    address public scrollsmith;
    string public purpose = "Construct chipset and electric vehicle factories in PH";
    uint256 public timestamp;

    struct Factory {
        string name;
        string location;
        string category; // "Chipset" or "EV"
        uint256 budget;
        bool activated;
    }

    Factory[] public sanctums;

    event FactorySummoned(string name, string location, string category, uint256 budget);
    event FactoryActivated(string name);

    constructor() {
        scrollsmith = msg.sender;
        timestamp = block.timestamp;
    }

    function summonFactory(
        string memory name,
        string memory location,
        string memory category,
        uint256 budget
    ) public {
        sanctums.push(Factory(name, location, category, budget, false));
        emit FactorySummoned(name, location, category, budget);
    }

    function activateFactory(uint256 index) public {
        require(index < sanctums.length, "Invalid index");
        sanctums[index].activated = true;
        emit FactoryActivated(sanctums[index].name);
    }

    function getFactory(uint256 index) public view returns (Factory memory) {
        require(index < sanctums.length, "Invalid index");
        return sanctums[index];
    }

    function totalSanctums() public view returns (uint256) {
        return sanctums.length;
    }
}
