// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinGridRebirth {
    struct Node {
        string location;
        bool isRenewableIntegrated;
        uint upgradeScore;
    }

    mapping(address => Node) public nodeRegistry;

    function registerNode(address node, string memory loc, bool renew, uint score) public {
        nodeRegistry[node] = Node(loc, renew, score);
    }

    function updateNode(address node, bool renew, uint score) public {
        require(bytes(nodeRegistry[node].location).length > 0, "Node not registered");
        nodeRegistry[node].isRenewableIntegrated = renew;
        nodeRegistry[node].upgradeScore = score;
    }
}
