// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinChainheart {
    string[] public values;

    event Pulse(address indexed reader, string value, uint256 indexed index, uint256 timestamp);

    constructor(string[] memory _values) {
        for (uint256 i = 0; i < _values.length; i++) {
            values.push(_values[i]);
        }
    }

    function totalValues() external view returns (uint256) {
        return values.length;
    }

    function readValue(uint256 index) external returns (string memory) {
        require(index < values.length, "Invalid index");
        emit Pulse(msg.sender, values[index], index, block.timestamp);
        return values[index];
    }

    function getAllValues() external view returns (string[] memory) {
        return values;
    }
}
