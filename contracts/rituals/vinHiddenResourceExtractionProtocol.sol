// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinHiddenResourceExtractionProtocol {
    address public scrollkeeper;

    struct ResourceNode {
        string location;
        string mineralType;
        uint256 estimatedValue;
        bool extractionApproved;
        uint256 timestamp;
    }

    ResourceNode[] public nodes;

    event ResourceTagged(string location, string mineralType, uint256 value);
    event ExtractionAuthorized(string location);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function tagResource(string memory location, string memory mineralType, uint256 estimatedValue) external onlyScrollkeeper {
        nodes.push(ResourceNode(location, mineralType, estimatedValue, false, block.timestamp));
        emit ResourceTagged(location, mineralType, estimatedValue);
    }

    function authorizeExtraction(uint256 index) external onlyScrollkeeper {
        nodes[index].extractionApproved = true;
        emit ExtractionAuthorized(nodes[index].location);
    }

    function getNode(uint256 index) external view returns (string memory, string memory, uint256, bool, uint256) {
        ResourceNode memory r = nodes[index];
        return (r.location, r.mineralType, r.estimatedValue, r.extractionApproved, r.timestamp);
    }

    function totalNodes() external view returns (uint256) {
        return nodes.length;
    }
}
