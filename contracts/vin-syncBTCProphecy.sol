// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract vinSyncBTCProphecy {
    event BTCProphecySynced(address indexed seer, string vision, uint256 timestamp);

    function syncProphecy(string memory vision) external {
        emit BTCProphecySynced(msg.sender, vision, block.timestamp);
    }
}
