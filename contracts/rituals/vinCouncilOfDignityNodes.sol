// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinCouncilOfDignityNodes {
    address public scrollkeeper;

    struct DignityNode {
        string region;
        address steward;
        string focusArea; // e.g., food, education, emotional health
        bool active;
    }

    DignityNode[] public nodes;

    event NodeActivated(string region, address steward, string focusArea);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function activateNode(string memory region, address steward, string memory focusArea) external onlyScrollkeeper {
        nodes.push(DignityNode(region, steward, focusArea, true));
        emit NodeActivated(region, steward, focusArea);
    }

    function getNode(uint256 index) external view returns (string memory, address, string memory, bool) {
        DignityNode memory node = nodes[index];
        return (node.region, node.steward, node.focusArea, node.active);
    }

    function totalNodes() external view returns (uint256) {
        return nodes.length;
    }
}
