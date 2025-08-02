// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinPhantomCommand {
    mapping(address => bool) public ghostNodes;
    event GhostNodeRegistered(address node);

    function registerGhost(address node) public {
        ghostNodes[node] = true;
        emit GhostNodeRegistered(node);
    }
}
