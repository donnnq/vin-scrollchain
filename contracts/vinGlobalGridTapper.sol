// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinGlobalGridTapper
/// @dev Interfaces with registered energy relay contracts across regions or global nodes

contract vinGlobalGridTapper {
    address public tapAdmin;
    uint256 public tapRateKWh = 1000; // max tap per request

    struct GridNode {
        string region;
        string energyType; // could be "solar surplus", "hydro reserve", etc.
        bool isActive;
        uint256 availableKWh;
    }

    GridNode[] public nodes;

    event GridTapped(string region, string energyType, uint256 amountTapped);

    modifier onlyAdmin() {
        require(msg.sender == tapAdmin, "Unauthorized");
        _;
    }

    constructor(address _admin) {
        tapAdmin = _admin;
    }

    function registerNode(string memory region, string memory energyType, uint256 availableKWh) public onlyAdmin {
        nodes.push(GridNode(region, energyType, true, availableKWh));
    }

    function tapNode(uint256 index, uint256 amountKWh) public onlyAdmin {
        GridNode storage node = nodes[index];
        require(node.isActive, "Node offline");
        require(node.availableKWh >= amountKWh, "Not enough energy");

        require(amountKWh <= tapRateKWh, "Tap rate exceeded");
        node.availableKWh -= amountKWh;

        emit GridTapped(node.region, node.energyType, amountKWh);
    }

    function getNode(uint256 index) public view returns (GridNode memory) {
        return nodes[index];
    }

    function listNodes() public view returns (GridNode[] memory) {
        return nodes;
    }
}
