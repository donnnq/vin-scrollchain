// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinBroadbandBridge {
    struct Node {
        string region;
        bool satelliteEnabled;
        uint bandwidth;
    }

    mapping(address => Node) public connectivityNodes;

    function activateNode(address node, string memory region, bool satellite, uint bandwidth) public {
        connectivityNodes[node] = Node(region, satellite, bandwidth);
    }

    function updateBandwidth(address node, uint bandwidth) public {
        require(bytes(connectivityNodes[node].region).length > 0, "Node not active");
        connectivityNodes[node].bandwidth = bandwidth;
    }
}
