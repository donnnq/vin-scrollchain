// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinGermanEnergyReboot {
    struct EnergyNode {
        string name;
        uint256 allocatedUSD;
        bool activated;
    }

    mapping(uint256 => EnergyNode) public nodes;
    uint256 public totalUSD;
    uint256 public nodeCount;
    address public scrollkeeper;

    event NodeFunded(string name, uint256 amount);
    event NodeActivated(string name);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may reboot energy");
        _;
    }

    constructor(uint256 _initialUSD) {
        scrollkeeper = msg.sender;
        totalUSD = _initialUSD;
    }

    function addEnergyNode(string memory _name, uint256 _usd) public onlyScrollkeeper {
        require(_usd <= totalUSD, "Insufficient scroll funds");
        nodes[nodeCount] = EnergyNode(_name, _usd, false);
        totalUSD -= _usd;
        emit NodeFunded(_name, _usd);
        nodeCount++;
    }

    function activateNode(uint256 _nodeId) public onlyScrollkeeper {
        EnergyNode storage node = nodes[_nodeId];
        require(!node.activated, "Node already activated");
        node.activated = true;
        emit NodeActivated(node.name);
    }

    function getRemainingUSD() public view returns (uint256) {
        return totalUSD;
    }
}
