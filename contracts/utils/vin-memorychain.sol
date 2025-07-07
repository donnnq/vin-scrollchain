// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinMemoryChain {
    struct Memory {
        string message;
        uint256 timestamp;
    }

    Memory[] public memories;

    event MemoryLogged(string message, uint256 timestamp);

    function log(string calldata message) external {
        memories.push(Memory(message, block.timestamp));
        emit MemoryLogged(message, block.timestamp);
    }

    function totalMemories() external view returns (uint256) {
        return memories.length;
    }

    function getMemory(uint256 index) external view returns (string memory, uint256) {
        require(index < memories.length, "Out of bounds");
        Memory storage m = memories[index];
        return (m.message, m.timestamp);
    }
}
