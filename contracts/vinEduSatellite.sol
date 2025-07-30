// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinEduSatellite {
    address public scrollsmith;
    uint public orbitNodeCount;

    struct OrbitNode {
        string region;
        string uplinkPurpose;
        string satelliteChannel;
        bool isBeamActive;
    }

    mapping(uint => OrbitNode) public eduBeamRegistry;

    event OrbitNodeSummoned(string region, string satelliteChannel);
    event BeamActivated(uint indexed nodeId, string purpose);
    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
        orbitNodeCount = 0;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Only the scrollsmith may summon orbit nodes.");
        _;
    }

    // 🌍 Deploy satellite node for a given region
    function summonOrbitNode(
        string memory region,
        string memory uplinkPurpose,
        string memory satelliteChannel
    ) public onlyScrollsmith {
        eduBeamRegistry[orbitNodeCount++] = OrbitNode(region, uplinkPurpose, satelliteChannel, false);
        emit OrbitNodeSummoned(region, satelliteChannel);
    }

    // 🔥 Activate the lesson beam for a node
    function activateBeam(uint nodeId) public onlyScrollsmith {
        require(nodeId < orbitNodeCount, "Node does not exist.");
        eduBeamRegistry[nodeId].isBeamActive = true;
        emit BeamActivated(nodeId, eduBeamRegistry[nodeId].uplinkPurpose);
    }

    // 🌌 View orbit node data
    function getOrbitNode(uint id) public view returns (
        string memory region,
        string memory uplinkPurpose,
        string memory satelliteChannel,
        bool isBeamActive
    ) {
        OrbitNode memory node = eduBeamRegistry[id];
        return (node.region, node.uplinkPurpose, node.satelliteChannel, node.isBeamActive);
    }

    // 🧙 Transfer scrollsmith rights
    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid address.");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    // 🚀 View total nodes summoned
    function totalOrbitNodes() public view returns (uint) {
        return orbitNodeCount;
    }
}
