// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollTemple {
    struct ScrollModule {
        string name;
        address contractAddress;
        string purpose;
    }

    ScrollModule[] public modules;
    address public immutable highScribe;

    event ModuleRegistered(string name, address contractAddress, string purpose, uint256 indexed index);
    event TempleInvoked(address indexed by, string invocation, uint256 timestamp);

    modifier onlyHighScribe() {
        require(msg.sender == highScribe, "Not the high scribe");
        _;
    }

    constructor() {
        highScribe = msg.sender;
    }

    function registerModule(string calldata name, address contractAddress, string calldata purpose) external onlyHighScribe {
        modules.push(ScrollModule({
            name: name,
            contractAddress: contractAddress,
            purpose: purpose
        }));

        emit ModuleRegistered(name, contractAddress, purpose, modules.length - 1);
    }

    function invokeTemple(string calldata invocation) external {
        emit TempleInvoked(msg.sender, invocation, block.timestamp);
    }

    function getModule(uint256 index) external view returns (ScrollModule memory) {
        require(index < modules.length, "Invalid index");
        return modules[index];
    }

    function totalModules() external view returns (uint256) {
        return modules.length;
    }
}
